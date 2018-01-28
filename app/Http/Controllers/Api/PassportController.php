<?php
namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Auth;
use Lcobucci\JWT\Parser;

use Validator;

class PassportController extends Controller
{

    public $successStatus = 200;
	public $unauthorised = 401;

    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
		//set the data validation
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);
		//test if data is invalid and return an error
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], $this->unauthorised);            
        }
		//Save the user
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        //create the token
		$success['token'] =  $user->createToken('MyApp')->accessToken;
        $success['name'] =  $user->name;
		//return the token and the user name
        return response()->json(['success'=>$success], $this->successStatus);
    }
	
    /**
     * login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(){
		//Attempt to login the user using the provided credential
        if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){
            $user = Auth::user();
            $success['token'] =  $user->createToken('MyApp')->accessToken;
			//Return a success response with the token
            return response()->json(['success' => $success], $this->successStatus);
        }
        else{
			//Return Unauthorised response
            return response()->json(['error'=>'Unauthorised'], $this->unauthorised);
        }
    }


}