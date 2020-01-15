#!/usr/bin/env php
<?php

if (!extension_loaded('yp')) {
    error_log('yp extension not found');
    exit(1);
}

$opts = getopt('d:');
if (isset($opts['d'])) {
    $domain = $opts['d'];
} else {
    $domain = yp_get_default_domain();
}

if (empty($domain)) {
    error_log('domain should not be empty');
    exit(1);
}

$mapname = array_pop($argv);
if (empty($mapname)) {
    error_log('mapname is empty');
    exit(1);
}
$hosts = listgroup($domain, 'netgroup', $mapname);
echo implode(' ', $hosts) . PHP_EOL;

function listgroup($domain, $mapname, $key) {
    $hosts = array();
    $match_result = yp_match($domain, $mapname, $key);
    if (empty($match_result)) {
        return array();
    }

    foreach (explode(' ', $match_result) as $match_item) {
        $match_item = trim($match_item);
        if (empty($match_item)) {
            continue;
        }

        $all_matches = array();
        if (preg_match_all('/\(.*\)/U', $match_item, $all_matches, PREG_OFFSET_CAPTURE)) {
            foreach ($all_matches[0] as $match_capture) {
                list($host_line, $offset) = $match_capture;
                $host_line = substr($host_line, 1, -1);
                list($host, /* ignore */, /* ignore */) = explode(',', $host_line);
                if (empty($host)) {
                    continue;
                }
                $hosts[] = $host;
            }
        } else {
            $hosts = array_merge($hosts, listgroup($domain, $mapname, $match_item));
        }
    }

    return array_unique($hosts);
}
