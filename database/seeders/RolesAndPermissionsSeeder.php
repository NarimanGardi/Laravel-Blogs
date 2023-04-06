<?php

namespace Database\Seeders;


use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RolesAndPermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin = Role::create(['name' => 'Admin']);
        $author = Role::create(['name' => 'Author']);

        $AdminPermissions 
        = ['manage-user', 'view-user', 'create-user', 'edit-user' , 'delete-user' ,
           'manager-category', 'view-category', 'create-category', 'edit-category','delete-category'];

        foreach ($AdminPermissions as $permission) {
            Permission::create(['name' => $permission]);
        }
        $AuthorPermissions = ['manage-post', 'view-post', 'create-post', 'edit-post' , 'delete-post'];

        foreach ($AuthorPermissions as $permission) {
            Permission::create(['name' => $permission]);
        }
        
        $admin->givePermissionTo(Permission::all());
        $author->givePermissionTo($AuthorPermissions);
    }
}
