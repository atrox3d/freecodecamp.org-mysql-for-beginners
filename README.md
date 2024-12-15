# INSTRUCTIONS:

- ### password:
    the password has to be saved in a textfile named

        secrets/password.txt
    
    as defined in ```docker-compose.yml```

    for example:

        cat secrets/password.txt
        password01  
  <br/>

- ### start mysql:
        docker compose up

- ### connect to my sql:
        docker compose exec -it db bash
    
    - then from container:

            mysql -u root -p
    
    or directly:

        docker compose exec -it db mysql -u root -p

<br/>
<br/>

---

<br/>
<br/>

# TUTORIAL REFERENCES:

- ## keep-it-techie:
    ### VIDEO:
    https://www.youtube.com/watch?v=uWkcxasFWzQ

    ### GITHUB EXAMPLE DATA REPO:
    https://github.com/bytebase/employee-sample-database

<br/>

- ## brocode:
    ### VIDEO:
    https://www.youtube.com/watch?v=5OdVJbNCSso

