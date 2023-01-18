sele * from {{
              metrics.calculate(
                  metrics('revenue'),
                  grain='day',
                  dimensions=['customer_status'])}}