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
	public $badRequest = 400;

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
            'email' => 'required|email|unique:users',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);
		//test if data is invalid and return an error
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], $this->badRequest);            
        }
		//Save the user
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        //create the token
		$userInfo['token'] =  $user->createToken('MyApp')->accessToken;
        $userInfo['name'] =  $user->name;
		//return the token and the user name
        return response()->json(['success' => 'You have registered successfully',
                                 'user' => $userInfo
                                ], $this->successStatus);
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
            $userInfo['token'] =  $user->createToken('MyApp')->accessToken;
            $userInfo['name'] =  $user->name;
            
			//Return a success response with the token
            return response()->json(['success' => 'You are logged in',
                                     'user' => $userInfo
           ], $this->successStatus);
        }
        else{
			//Return Unauthorised response
            return response()->json(['error'=>'Email and password do not match'], $this->unauthorised);
        }
    }
	
    /**
     * logout api
     *
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request)
    {	
		//clear token 
        $value = $request->bearerToken();
        $id = (new Parser())->parse($value)->getHeader('jti');
        $token = $request->user()->tokens->find($id);
        $token->revoke();

        return response()->json([
            'success' => 'You are Logged out.',
        ], $this->successStatus);
    }
}