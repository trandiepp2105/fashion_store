-- Call the procedure to insert a new user and assign a role
CALL CreateUserWithRole(
    "tranvandiep",  -- user_name
    "tranvandiep@gmail.com",  -- user_email
    "hashpassword",  -- user_password
    "0385320575",  -- user_phone_number
    3   -- role_id
);
