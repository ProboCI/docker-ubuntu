<?php

require './vendor/autoload.php';

use Aws\S3\S3Client;
use Aws\Exception\AwsException;
use Aws\S3\ObjectUploader;
use Aws\S3\ListObjects;
use Aws\S3\DeleteObject;;

$output = $argv[1];

$aws_key = getenv('AWS_KEY');
$aws_secret = getenv('AWS_SECRET');
$aws_bucket = getenv('AWS_BUCKET');
$aws_subfolder = getenv('AWS_SUBFOLDER');
$aws_site = getenv('AWS_SITE');

$aws_subfolder = (!empty($aws_subfolder)) ? $aws_subfolder . '/' : NULL;

if (!empty($aws_key) && !empty($aws_secret)) {
  $s3 = new S3Client([
    'version' => 'latest',
    'region'  => 'us-east-1',
    'use_path_style_endpoint' => true,
    'credentials' => [
      'key'    => $aws_key,
      'secret' => $aws_secret,
    ],
  ]);
}
else {
  print "Unable to connect to aws.";
  exit();
}

$files = ['cancel'];
try {
  $results = $s3->getPaginator('ListObjects', [
    'Bucket' => $aws_bucket
  ]);

} catch (S3Exception $e) {
  echo $e->getMessage();
}
if (!empty($results)) {
  foreach ($results as $result) {
    foreach ($result['Contents'] as $key => $content) {
      if ((!empty($aws_site) && strpos($content['Key'], $aws_site)) !== FALSE) {
        $files[] =  $content['Key'];
      }
      else {
        $files[] =  $content['Key'];
      }
    }
  }
}

$file_to_retrieve = array_pop($files);

try {
  $result = $s3->getObject([
    'Bucket' => $aws_bucket,
    'Key'    => $file_to_retrieve,
  ]);
  file_put_contents('/assets/' . $output, $result['Body']);
} catch (S3Exception $e) {
  echo $e->getMessage() . PHP_EOL;
}