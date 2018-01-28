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

}
