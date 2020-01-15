#!/usr/bin/env php
<?php

use Composer\Factory;
use Composer\IO\NullIO;

$composer_dir = getenv('COMPOSER_DIR');
if (false === $composer_dir) {
    throw new RuntimeException('Please specify COMPOSER_DIR env');
}
require "$composer_dir/vendor/autoload.php";

$composer_file = isset($argv[1]) ? $argv[1] : getcwd() . '/composer.json';
$composer_file = realpath(trim($composer_file));
if (false === $composer_file) {
    throw new RuntimeException('composer.json not found');
}

$composer = Factory::create(new NullIO(), $composer_file);
$generator = $composer->getAutoloadGenerator();

$installation_manager = $composer->getInstallationManager();
$local_repo = $composer->getRepositoryManager()->getLocalRepository();
$main_package = $composer->getPackage();
$packages = $local_repo->getCanonicalPackages();

$packages = $generator->buildPackageMap($installation_manager, $main_package, $packages);
$autoloads = $generator->parseAutoloads($packages, $main_package);
print_r($autoloads);
