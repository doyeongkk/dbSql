
doyeong.v_emp ==> v_emp

SELECT *
FROM doyeong.v_emp;

CREATE SYNONYM v_emp FOR doyeong.v_emp;
DROP SYNONYM v_emp ;

SELECT *
FROM v_emp;