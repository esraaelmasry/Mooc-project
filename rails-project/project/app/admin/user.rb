ActiveAdmin.register User do

permit_params :name , :email ,:dob ,:gender ,:profilepicture

end
