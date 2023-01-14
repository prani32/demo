select * 
from  {{
     metrics.calculate(
          metric('Revenue'),
          grain='day',
          dimensions=['customer_status']
          )
     }}
  