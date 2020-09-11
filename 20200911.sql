



join1

SELECT lprod_gu,lprod_nm,prod_id,prod_name
FROM lprod,prod
WHERE prod.prod_lgu = lprod.lprod_gu;

SELECT COUNT(*)
FROM prod;

join2
SELECT buyer_id,buyer_name,prod_id,prod_name
FROM buyer, prod
WHERE prod.prod_buyer = buyer.buyer_id;


join3


ORACLE로 푼거

SELECT member.mem_id,member.mem_name,prod.prod_id,prod.prod_name,cart.cart_qty
FROM  member, cart, prod
WHERE member.mem_id = cart.cart_member
AND cart.cart_prod = prod.prod_id;

ANSI=SQL 
테이블 JOIN 테이블 ON ()
      JOIN       ON  ()  

SELECT member.mem_id,member.mem_name,prod.prod_id,prod.prod_name,cart.cart_qty
FROM  member  JOIN cart ON (member.mem_id = cart.cart_member)
              jOIN PROD ON (caar.cart.prod = prod.prod_member)