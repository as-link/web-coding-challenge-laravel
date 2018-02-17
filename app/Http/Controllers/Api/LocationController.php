<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

use App\Location;
use App\User;
use App\Http\Resources\Location as LocationResource;
use Validator;

class LocationController extends Controller
{
	public $successCreated = 201;
    public $unauthorised = 401;
    public $successStatus = 200;
    public $badRequest = 400;
    /**
     * get location
     *
     * @return \Illuminate\Http\Response
     */
    public function getLocation()
    {
        if(Auth::user()){
            //Get the user
            $user = Auth::user();
            //Get user lat lng
            $location = Location::where('user_id','=', $user->id)->get();
            //if the user didn't set his location yet
            if(!$location->count()){
                //return empty location
                $location = ['lat'=> '', 'lng' => ''];
                return response()->json(['data'=> $location], $this->successStatus);
            }else{
                // Return collection of location as a resource
                return new LocationResource($location->first());
            }
        }else{
            // Unauthenticated
            return response()->json(['error'=>'You need to login to perform this action'], $this->unauthorised);
        }
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if(Auth::user()){
            //get the user
            $user = Auth::user();
            //lat/lng validation
            $validator = Validator::make($request->all(), [
                'lat' => [
                    'required',
                    'regex:/^(\-?\d+(\.\d+)?).\s*(\-?\d+(\.\d+)?)$/'
                    ], 
                'lng' => [
                    'required',
                    'regex:/^(\-?\d+(\.\d+)?).\s*(\-?\d+(\.\d+)?)$/'
                    ]
                ]);

            if ($validator->fails()) {
                return response()->json(['error' => 'The Latitude and longitude are required and should be in decimal degrees format'], $this->badRequest);            
            }

            //No location for the logged user
            if(is_null($user->location)){
                // created a new location
                $new_location = [
                    'lat' => $request->lat,
                    'lng' => $request->lng
                ];
                //save location
                if($location = $user->location()->create($new_location)){
                    return response()->json([
                        'success' => 'Your location has been set successfully',
                    ], $this->successCreated);
                }else{
                    return response()->json([
                        'error' => 'The location could not be saved',
                    ]);
                }
            }
        }else{
            // Unauthenticated
            return response()->json(['error'=>'You need to login to perform this action'], $this->unauthorised);
        }
    }
    /**
     * Update resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        if(Auth::user()){
			//lat/lng validation
            $validator = Validator::make($request->all(), [
                'lat' => [
                    'required',
                    'regex:/^(\-?\d+(\.\d+)?).\s*(\-?\d+(\.\d+)?)$/'
                    ], 
                'lng' => [
                    'required',
                    'regex:/^(\-?\d+(\.\d+)?).\s*(\-?\d+(\.\d+)?)$/'
                    ]
            ]);

			if ($validator->fails()) {
				return response()->json(['error' => $validator->errors()], $this->badRequest);            
			}
			//Get the user
			$user = Auth::user();
			//Set location
			$location = $user->location;
			$location->lat = $request->lat;
			$location->lng = $request->lng;
			//Update location
			if($user->location()->save($location)){
                return response()->json([
                    'success' => 'Your location has been updated successfully',
                ], $this->successStatus);
			}else{
				return response()->json([
					'error' => 'The location could not be updated',
				]);
			}
        }else{
            // Unauthenticated
            return response()->json(['error'=>'You need to login to perform this action'], $this->unauthorised);
        }
    }
}
