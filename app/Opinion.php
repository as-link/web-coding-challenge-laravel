<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Opinion extends Model
{
    public $timestamps = false;
    
    /**
     * Get the user that owns the opinion.
     */
    public function user()
    {
        return $this->belongsTo('App\User');
    }
    /**
     * Get the shop that owns the opinion.
     */
    public function shop()
    {
        return $this->belongsTo('App\Shop');
    }
}
