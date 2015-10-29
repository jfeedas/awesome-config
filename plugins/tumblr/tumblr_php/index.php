<?php

require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/constants.php';
require __DIR__ . '/functions.php';

$storage = file_get_contents(__DIR__ . '/storage.txt');
$storage = unserialize($storage);

$client = new Tumblr\API\Client(CONSUMER_KEY, CONSUMER_SECRET, TOKEN, SECRET);
$response = $client->getDashboardPosts(array('limit' => 1));
$post = $response->posts[0];
$lastPostId = $post->id;

if($post->type == 'photo' && $post->followed == 1){
    if($storage['last_post_id'] != $lastPostId)
    {
        deleteThumb($storage['last_post_id']);
        saveThumb($post);
        
        $storage['last_post_id'] = $lastPostId;
        
        echo json_encode(
            [
                'blog_name' => $post->blog_name,
                'image' => getThumbPath($lastPostId),
            ]
        );
    } else {
        echo "FALSE";
    }    
} else {
    echo "FALSE";
}

file_put_contents(__DIR__ . '/storage.txt', serialize($storage));
