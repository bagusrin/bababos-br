# bababos-br

### Requirement

- Python >= 3.8
- Django
- Django Rest Framework

How To Setup?

```sh
$ git clone https://github.com/bagusrin/bababos-br.git
$ cd bababos-br
$ python3 -m venv env #create virtual environment
$ source env/bin/activate
$ pip install -r "requirements.txt" #install dependency
```

Migration DB?

```sh
$ cd project
$ ./manage.py makemigratios db #if there is not migration folder
$ ./manage.py migrate
```

OR Import DB?
```sh
You can import directly using db_bababos.sql at root folder
```

How to Run?

```sh
$ cd project
$ ./manage.py runserver 127.0.0.1:8000
```

Endpoint List

```sh
[POST] Create Customer. Url : http://127.0.0.1:8000/customers/
[Get] Get Customer. Url : http://127.0.0.1:8000/customers/
[POST] Create Supplier. Url : http://127.0.0.1:8000/suppliers/
[Get] Get Supplier. Url : http://127.0.0.1:8000/suppliers/
[POST] Create Product. Url : http://127.0.0.1:8000/products/
[Get] Get Product. Url : http://127.0.0.1:8000/products/
[POST] Create Fleet. Url : http://127.0.0.1:8000/fleets/
[Get] Get Fleet. Url : http://127.0.0.1:8000/fleets/
[POST] Create Shipping Cost. Url : http://127.0.0.1:8000/shippings/
[Get] Get Shipping Cost. Url : http://127.0.0.1:8000/shippings/
[POST] Create Price. Url : http://127.0.0.1:8000/prices/
[POST] Create Quotation. Url : http://127.0.0.1:8000/quotations/
[PUT] Update Quotation. Url : http://127.0.0.1:8000/quotations/[quotation_no]/
[GET] Get Detail Quotation. Url : http://127.0.0.1:8000/quotations/[quotation_no]/
[GET] Get History Order. Url : http://127.0.0.1:8000/history-orders/
```

### Example Request Endpoint

```sh
Purchase Quotation
Url : http://localhost:8000/quotations/
Body Request :
{
    "customer_code": "M1-STQI-11",
    "items": [
        {
            "sku": "PLT-SPHC0180",
            "qty": 50
        },
        {
            "sku": "PLT-SPHC0026",
            "qty": 10
        }
    ]
}

Response :
{
    "status": 201,
    "success": true,
    "message": "quotation has been created",
    "data": {
        "quotation_no": "bf85d425-c94b-4dc1-a0ad-7bf477a55489",
        "quotation_date": "2023-07-05T20:40:05.993516Z",
        "total_amount": 3216054.0540650003,
        "total_product_amount": 1616054.054065,
        "total_shipping_amount": 1600000.0,
        "status": "quotation",
        "customer": {
            "id": 3,
            "code": "M1-STQI-11",
            "address": "Kel. Rorotan- Cilincing",
            "city": "Jakarta Utara"
        },
        "items": [
            {
                "product": {
                    "id": 5,
                    "sku": "PLT-SPHC0180",
                    "qty": 50,
                    "price": 670108.108105
                },
                "supplier": {
                    "id": 2,
                    "code": "S1-HSC-1",
                    "address": "Mangga Dua Sel., Kecamatan Sawah Besar",
                    "city": "Jakarta Pusat"
                }
            },
            {
                "product": {
                    "id": 26,
                    "sku": "PLT-SPHC0026",
                    "qty": 10,
                    "price": 945945.94596
                },
                "supplier": {
                    "id": 3,
                    "code": "S1-PSB-1",
                    "address": "Tubagus Angke",
                    "city": "Jakarta Utara"
                }
            }
        ]
    }
}
```



### Swagger
http://localhost:8000/docs


### ERD
![db_bababos (2)](https://github.com/bagusrin/bababos-br/assets/13326311/076df981-3ef7-4894-9cd3-f881c232bb56)




### Sample Postman

## Add pricelist
<img width="762" alt="Screen Shot 2023-07-04 at 14 40 30" src="https://github.com/bagusrin/bababos-br/assets/13326311/b3f702e6-cbb3-4c86-b3dc-e43c8dd05c0b">

## Add quotation
<img width="789" alt="Screen Shot 2023-07-06 at 01 37 13" src="https://github.com/bagusrin/bababos-br/assets/13326311/73d5b760-12c4-457d-9a89-6e0e78110386">

<img width="765" alt="Screen Shot 2023-07-06 at 01 37 21" src="https://github.com/bagusrin/bababos-br/assets/13326311/4be9223f-7a49-4347-b12d-cb2ae94fd822">

## Update quotation to order (accept by customer)
<img width="838" alt="Screen Shot 2023-07-06 at 02 04 35" src="https://github.com/bagusrin/bababos-br/assets/13326311/150c3024-c6b0-4480-925e-9808e49e71a6">

## History Order
<img width="787" alt="Screen Shot 2023-07-06 at 03 02 56" src="https://github.com/bagusrin/bababos-br/assets/13326311/2931f6db-c97d-4de4-8d01-3bdd73039308">



### Notes
There's still a lot that can be refactored. But due to time constraints, I have not been able to do so. I'm sorry for being late to submit
