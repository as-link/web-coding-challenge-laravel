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
	public $resourceCreated = 201;
    
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
                return response()->json(['data'=> $location]);
            }else{
                // Return collection of location as a resource
                return new LocationResource($location->first());
            }
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
                return response()->json(['error' => $validator->errors()]);            
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
					// Return a location as a resource
                    return new LocationResource($location, $this->resourceCreated);
                }else{
                    return response()->json([
                        'error' => 'The location could not be saved',
                    ]);
                }
            }
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
				return response()->json(['error' => $validator->errors()]);            
			}
			//Get the user
			$user = Auth::user();
			//Set location
			$location = $user->location;
			$location->lat = $request->lat;
			$location->lng = $request->lng;
			//Update location
			if($user->location()->save($location)){
				return new LocationResource($location);
			}else{
				return response()->json([
					'error' => 'The location could not be updated',
				]);
			}
        }
    }
}
