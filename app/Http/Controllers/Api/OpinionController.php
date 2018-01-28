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

	public $unauthorised = 401;
	
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
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {   
        if(Auth::user()){
            //Get the user
            $user = Auth::user();
            $opinion = Opinion::find($id);

            //No opinion found for the given id
            if(!$opinion){
                return response()->json([
                    'error' => 'Opinion not found!'
                ]);
            }
            //Test if opinion belongs to the logged user
            if($opinion->user_id == $user->id){
                //Delete opinion if it belongs to logged user
                if($opinion->delete()){
                    return new OpinionResource($opinion);
                }  
            }else{
                return response()->json([
                    'error' => 'Unauthorized to remove this item'
                ], $this->unauthorised);
            }
        }
    }
}
