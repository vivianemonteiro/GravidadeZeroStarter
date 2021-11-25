def factory_send_pix():
    pix = {
        "bank": "Nubank",
        "key": "yoda@jedi.com",
        "value": "100"
    }

    return pix
    
def factory_send_pix_zero():
    pixzero = {
        "bank": "C6 Bank",
        "key": "Teste Valor 0",
        "value": "0"
    }
    return pixzero

def factory_send_pix_negative():
    pixnegative = {
        "bank": "C6 Bank",
        "key": "Teste Valor 0",
        "value": "-1"
    }
    return pixnegative