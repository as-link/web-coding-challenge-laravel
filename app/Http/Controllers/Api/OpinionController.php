<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Opinion;
use App\User;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\Opinion as OpinionResource;

class OpinionController extends Controller
{

    /**
     * Store an opinion
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {  
        if(Auth::user()){
            //get the user
            $user = Auth::user();
			//Get the opinion
            $opinion = Opinion::where([
                ['user_id', '=', $user->id],
                ['shop_id', '=', $request->shop_id],
                ['opinion', '=', $request->opinion]
            ])->first();

            if(!empty($opinion)){
                if($opinion->opinion == 0){ 
                    //Update created_at for previously displiked shops 
                    if(Opinion::where('id', $opinion->id)->update([
                        'created_at' => date("Y-m-d H:i:s")
                        ])){
							// Return opinion as a resource
                            return new OpinionResource($opinion);   
                        }
                }
            }else{ 
                //Opinion does not exist - Insert new opinion (like/dislike)
                $opinion = new Opinion;
                $opinion->user_id = $user->id;
                $opinion->shop_id = $request->shop_id;
                $opinion->opinion = $request->opinion;

                if($opinion->save()){
					// Return opinion as a resource
                    return new OpinionResource($opinion);
                }
            }
        }
    }
}
