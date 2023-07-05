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
<img width="931" alt="Screen Shot 2023-07-06 at 03 56 20" src="https://github.com/bagusrin/bababos-br/assets/13326311/e95db56e-b772-4458-8b7f-239fd362d66b">



### Sample Postman

<img width="629" alt="Screen Shot 2023-02-02 at 00 40 54" src="https://user-images.githubusercontent.com/13326311/216120731-2a5bad90-7271-4861-bd60-485642a754bd.png">

<img width="558" alt="Screen Shot 2023-02-01 at 22 32 37" src="https://user-images.githubusercontent.com/13326311/216120933-dd27ebfa-5f9a-4f73-a7f6-37a4bf53dd37.png">

<img width="643" alt="Screen Shot 2023-02-01 at 22 43 40" src="https://user-images.githubusercontent.com/13326311/216121031-57634abf-9be7-4dd4-852e-a786681b9fdf.png">

### Notes
There's still a lot that can be refactored. But due to time constraints, I have not been able to do so. I'm sorry for being late to submit
