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
    public $successStatus = 200;
    public $notFound = 404;
    public $successCreated = 201;
    public $successDeleted = 204;
	
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
                            return response()->json([
                                'success' => 'The shop has been disliked and wont show up in the list for the next 2 hours',
                            ], $this->successStatus);
                        }
                }
            }else{ 
                //Opinion does not exist - Insert new opinion (like/dislike)
                $opinion = new Opinion;
                $opinion->user_id = $user->id;
                $opinion->shop_id = $request->shop_id;
                $opinion->opinion = $request->opinion;

                if($opinion->save()){
                    if($request->opinion == 0){
                        return response()->json([
                            'success' => 'The shop has been disliked and wont show up in the list for the next 2 hours',
                        ], $this->successCreated);
                    }else if($request->opinion == 1){
                        return response()->json([
                            'success' => 'The shop has been liked. You can find it the in preferred shop list',
                        ], $this->successCreated);
                    }
                }
            }
        }else{
            // Unauthenticated
            return response()->json(['error'=>'You need to login to perform this action'], $this->unauthorised);
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

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function removeOpinion($shop_id)
    {   
        if(Auth::user()){
            //Get the user
            $user = Auth::user();
            $opinion = Opinion::where([
                ['shop_id', '=', $shop_id],
                ['user_id', '=', $user->id],
                ['opinion', '=', 1]
            ]);
            //No opinion found for the given id
            if(count($opinion->get()) == 0){
                return response()->json([
                    'error' => 'Opinion not found!'
                ], $this->notFound);
            }else{
                //Delete opinion
                if($opinion->delete()){
                    return response()->json([
                        'success' => 'The shop has been removed from the preffered shop list'
                    ], $this->successStatus);
                }  
            }
        }else{
            // Unauthenticated
            return response()->json(['error'=>'You need to login to perform this action'], $this->unauthorised);
        }
    }
}
