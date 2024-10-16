# POST

```
{
    "data": {
        "type": "contacts",
        "attributes": {
            "name": "CRUD AMS",
            "email": "crud_ams_@gmail.com",
            "birthdate": "07/07/2007"
        },
        "relationships": {
            "kind": {
                "data": {
                    "id": "2",
                    "type": "kinds"
                }
            }
        }
    }
}
```

# Patch

```
{
    "data": {
        "id": "103",
        "type": "contacts",
        "attributes": {
            "name": "CRUD AMS PATCH",
            "email": "crud_ams_@gmail.com",
            "birthdate": "07/07/2007"
        },
        "relationships": {
            "kind": {
                "data": {
                    "id": "3",
                    "type": "kinds"
                }
            }
        }
    }
}
```
