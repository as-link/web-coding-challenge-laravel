<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Location extends Model
{

    protected $fillable = ['lat', 'lng'];
    /**
     * Get the user that owns the location.
     */
    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
