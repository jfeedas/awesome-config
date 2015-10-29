<?php

/**
 * Save thumb
 * 
 * @param type $tumblrPost
 * @return boolean
 */
function saveThumb($tumblrPost){
    $altSizesCount = count($tumblrPost->photos[0]->alt_sizes);
    
    $img = $tumblrPost->photos[0]->alt_sizes[$altSizesCount - 1];
    $imageSoucrce = file_get_contents($img->url);
    file_put_contents(__DIR__ . '/img/' . $tumblrPost->id. ".jpg", $imageSoucrce);
    return TRUE;
}

/**
 * Get image path
 * 
 * @param int $id
 * @return string
 */
function getThumbPath($id){
    return __DIR__ . "/img/" . $id . ".jpg";
}

/**
 * Delete image
 * 
 * @param int $id
 * @return boolean
 */
function deleteThumb($id){
    $filePath = getThumbPath($id);
    if(!file_exists($filePath)){
        return FALSE;
    }
    
    unlink($filePath);
    return TRUE;
}