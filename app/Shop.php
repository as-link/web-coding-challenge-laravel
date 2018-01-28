<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Shop extends Model
{
    /**
     * Get shop's opinions.
     */
    public function opinions()
    {
        return $this->hasMany('App\Opinion');
    }

}
