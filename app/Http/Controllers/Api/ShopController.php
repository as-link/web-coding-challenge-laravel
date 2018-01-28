<?php
namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Shop;
use App\User;
use App\Location;

use Illuminate\Support\Facades\Auth;
use App\Http\Resources\Shop as ShopResource;
use DB;

class ShopController extends Controller
{

    /**
     * Shops api
     *
     * @return \Illuminate\Http\Response
     */
    public function getNearbyShops()
    {
        if(Auth::user()){
            //Get the user
            $user = Auth::user();
            //Get user lat lng
            $location = new Location;
            $location = User::find($user->id)->location;
            //2 hours ago
            $twoHoursAgo = date("Y-m-d H:i:s", strtotime("-2 hour"));
            //Get shops with no opinions plus unlinked shop (unliked more than 2h ago) sorted by distance
            $shops = Shop::select("*", DB::raw("( 3960 * Acos(Cos(Radians('$location->lat')) * Cos(Radians(lat)) * Cos(Radians(lng) - Radians('$location->lng')) + Sin(Radians('$location->lat')) * Sin(Radians(lat)))) AS distance"))
            ->whereHas('opinions', function ($query) use ($user,$twoHoursAgo) {
                $query->where([
                    ['user_id', '=', $user->id],
                    ['opinion', '=', '0'],
                    ['opinions.created_at', '<', $twoHoursAgo]
                ]);
            })
            ->orWhereDoesntHave('opinions')
            ->orderBy('distance', 'ASC')
            ->paginate(10);

            // Return collection of shops as a resource
            return ShopResource::collection($shops);
        }
    }

}  