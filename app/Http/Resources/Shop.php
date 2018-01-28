<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class Shop extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            "id" => $this->id,
            "city" => $this->city,
            "email" => $this->email,
            "name" => $this->name,
            "picture" => $this->picture,
            "lat" => $this->lat,
            "lng" => $this->lng
        ];
    }
}
