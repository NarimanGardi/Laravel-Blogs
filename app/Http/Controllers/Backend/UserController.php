<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\CraeteUserRequest;
use App\Http\Requests\Backend\UpdateUserRequest;
use App\Http\Requests\Backend\UserPasswordUpdate;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;
class UserController extends Controller
{
    public function __construct()
    {
        $this->authorizeResource(User::class, 'user');
    }

    public function index()
    {
        $users = User::with('roles','media.model')->paginate(10);
        return view('backend.pages.users.index', compact('users'));
    }


    public function create()
    {
        $roles = Role::all('name');
        return view('backend.pages.users.create', compact('roles'));
    }


    public function store(CraeteUserRequest $request)
    {
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ])->assignRole($request->role);

        if($request->hasFile('avatar')){
            $user->addMediaFromRequest('avatar')->toMediaCollection('avatar');
        }
        toast()->success('Successed','User Created Successfully');
        return redirect()->route('users.index');
    }

 
    public function show(User $user)
    {
        abort(404);
    }

    public function edit(User $user)
    {
        $user = User::with('media.model')->find($user->id);
        $roles = Role::all('name');
        return view('backend.pages.users.edit', compact('user', 'roles'));
    }

    public function update(UpdateUserRequest $request, User $user)
    {
        $user->update($request->only('name', 'email'));
        if($request->has('role')){
            $user->syncRoles($request->role);
        }
        if($request->hasFile('avatar')){
            $user->addMediaFromRequest('avatar')->toMediaCollection('avatar');
            $user->getMedia('avatar')->count();
            $user->getFirstMediaUrl('avatar'); 
        }
        toast()->success('Successed','User profile updated successfully');
        return back();
    }

    public function destroy(User $user)
    {
        $user->delete();
        toast()->success('Successed','User deleted successfully');
        return back();
    }

    public function updatePassword(UserPasswordUpdate $request,$id)
    {
        $user = User::findorFail($id);
        if(!Hash::check($request->old_password, $user->password)){
            toast()->error('Failed','Old password is not correct');
            return back();
        }
        $user->update(['password' => bcrypt($request->password)]);
        $user->save();
        toast()->success('Successed','User password updated successfully');
        return back();
    }
}
