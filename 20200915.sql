---------이거 확인하기



SELECT b.buy_date,b.buy_prod,p.prod_id,p.prod_name,b.buy_qty
FROM buyprod b RIGHT OUTER JOIN prod p
ON b.buy_prod(+) = p.prod_id
AND b.BUY_DATE =  TO_DATE ('2005/01/25','YYYY/MM/DD');


SELECT TO_DATE ('2005/01/25','YYYY/MM/DD')buy_date,
FROM buyprod b RIGHT OUTER JOIN prod p
     b.buy_date,b.buy_prod,p.prod_id,p.prod_name,b.buy_qty =0
ON b.buy_prod(+) = p.prod_id
AND b.BUY_DATE =  TO_DATE ('2005/01/25','YYYY/MM/DD');


outer join4 

SELECT p.pid, p.pnm, :cid cid, NVL(c.day,0)day, NVL(c.cnt,0) cnt
FROM product p, cycle c
WHERE p.pid = c.pid(+)
AND c.cid (+) = :cid;
--------------------------------------------------------------------------------------------

INNER JOIN: 조인이 성공하는 데이터만 조회가 되는 조인 방식
OUTER JOIN: 조인에 실패해도 기준으로 정한 테이블의 컬럼은 조회가 되는 조인 방식 

EMP 테이블의 행 건수(14) * DEPT 테이블의 행 건수(4) =56건
SELECT *
FROM emp, dept;
WHERE



--258p. cross join 실습 1번

SELECT *
FROM customer,product;


--****중요함 p.259 서브쿼리 ****--

SQL 활용에 있어서 매우 중요
서브쿼리 : 쿼리안에서 실행되는 쿼리
1. 서브쿼리 분류 - 서브쿼리가 사용되는 위치에 따른 분류
1.1 SELECT : 스칼라 서브쿼리(SCALAR SUBQUERY)
1.2 FROM: 인라인 뷰(INLINE-VIEW)
1.3 WHERE: 서브쿼리 (SUB QUERY)

                 (행,행 여러개), (컬럼1, 컬럼 여러개)
2.서브쿼리 분류 - 서브쿼리가 반환하는 행, 컬럼의 개수의 따른 분류
(행,행 여러개), (컬럼1, 컬럼 여러개):
(행, 컬럼) 총 4가지 (행2,컬럼2)
2.1 단일행, 단일 컬럼
2.2 단일행, 복수 컬럼   ===> 잘 안씀.
2.3 복수행, 단일 컬럼
2.4 복수행, 복수 컬럼 

3.서브쿼리 분류 - 메인쿼리의 컬럼을 서브쿼리에서 사용여부에 따른 분류
3.1 상호 연관 서브 쿼리 (CO-RELATED SUB QUERY)
- 메인 쿼리의 컬럼을 서브 쿼리에서 사용하는 경우
3.2 비상호 연관 서브 쿼리(NON-CORELATED SUB QUERY)
- 메인 쿼리의 컬럼을 서브 쿼리에서 사용하지 않는 경우 






SMITH가 속한 부서에 속한 사원들은 누가 있을까?

1. SMITH가 속한 부서번호 구하기
2. 1번에서 구한 부서에 속해 있는 사원들 구하기 


1. 
   SELECT deptno
   FROM emp
   WHERE ename = 'SMITH';
   
2.
   SELECT *
   FROM emp
   WHERE deptno = 20;
   
==> 서브쿼리를 이용하여 하나로 합칠 수가 있다.



   SELECT *
   FROM emp
   WHERE deptno = 
             (SELECT deptno
             FROM emp
             WHERE ename = 'SMITH');

서브쿼리를 사용할 때 주의점
1. 연산자 
2. 서브쿼리의 리턴 형태
서브쿼리가 한개의 행 복수컬럼을 조회하고, 단일 컬럼과 = 비교 하는 경우 ==> X
밑에  이거 실행 안됨.
   SELECT *
   FROM emp
   WHERE deptno = 
             (SELECT deptno, empno
              FROM emp
              WHERE ename = 'SMITH');

서브쿼리가 여러개의 행, 단일 컬럼을 조회하는 경우 
1. 사용되는 위치: WHERE - 서브쿼리
2. 조회되는 행, 컬럼의 개수: 복수행, 단일컬럼
3. 메인쿼리의 컬럼을 서브쿼리에서 사용 유무 : 비상호연관 서브쿼리

 SELECT *
FROM emp
WHERE deptno IN 
             (SELECT deptno
              FROM emp
              WHERE ename = 'SMITH'
                OR ename = 'ALLEN');


밑에 이거 실행 안됨

 SELECT *
   FROM emp
   WHERE deptno = 
             (SELECT deptno, deptno
              FROM emp
              WHERE ename = 'SMITH'
                OR ename = 'ALLEN');
          

 SELECT *
FROM emp
WHERE deptno IN 
             (SELECT deptno
              FROM emp
              WHERE ename = 'SMITH'
                OR ename = 'ALLEN');
          deptno IN (20,30);      
            
         

SUB1] 평균 급여보다 높은 급여를 받는 사원의 수 구하기
1.ㅣ 평균 급여 구하기
2. 1에서 구한 값보다 SAL값이 큰 사원들의 수 카운트하기.

14명의 사원 평균 급여: 2073
SELECT AVG(sal)
FROM emp;

SELECT COUNT(*)
FROM emp
WHERE sal> (SELECT AVG(sal)
            FROM emp);


sub2]

SELECT *
FROM emp
WHERE sal> (SELECT AVG(sal)
            FROM emp);
            
            
SELECT *
FROM emp
WHERE deptno IN (SELECT deptno
                FROM emp
                WHERE ename IN ('SMITH','WARD'));
                
                
복수행 연산자: IN(중요), ANY, ALL (빈도 떨어진다)               

SELECT *
FROM emp            ---800,1250
WHERE SAL < ANY (SELECT sal
                 FROM emp
                 WHERE ename IN ('SMITH','WARD'));
 SAL 컬럼의 값이 800이나 1250 보다 작은 사원
 ==> SAL 컬럼의 값이 1250보다 작은 사원



        
SELECT *
FROM emp               ---800,1250
WHERE SAL > ALL (SELECT sal
                FROM emp
                WHERE ename IN ('SMITH','WARD'));
SAL 컬럼의 값이 800보다 크면서 1250보다 큰 사원
==> SAL 컬럼의 값이 1250 보다 큰 사원 


복습
NOT IN 연산자와 NULL

관리자가 아닌 사원의 정보를 조회
SELECT *
FROM emp
WHERE empno NOT IN (SELECT mgr
                    FROM emp);
                    
pair wise 개념  : 순서쌍, 두가지 조건을 동시에 만족시키는 데이터를 조회 할 때 사용 
                   AND 논리 연산자와 결과 값이 다를 수 있다.(아래 예시 참조)
서브쿼리: 복수행, 복수컬럼 
SELECT *
FROM emp
WHERE (mgr, deptno) IN (SELECT mgr, deptno
                        FROM emp 
                        WHERE empno IN (7499, 7782));

mgr 7698, 7839
detno 30, 10
mgr, deptno ==> (7698,30),(7698,10),(7839,30),(7839,10)
                (7698, 30)                    (7839,10);   

SCALAR SUBQUERY : SELECT 절에 기술된 서브쿼리
                  하나의 컬럼 --- 컬럼 하나여야됨!! 꼭!! --select 뒤에 오는 컬럼 말하는거임.
*** 스칼라 서브 쿼리는 하나의 행, 하나의 컬럼을 조회하는 쿼리 이어야한다 ***
SELECT dummy, (SELECT SYSDATE
               FROM dual), 
FROM dual;        


스칼라 서브쿼리가 복수개의 행(4개), 단일 컬럼을 조회 ==> 에러 
SELECT empno, ename, deptno, (SELECT dname FROM dept)
FROM emp


emp 테이블과 스칼라 서브 쿼리를 이용하여 부서명 가져오기
기존: emp 테이블과 dept 테이블을 조인하여 컬럼을 확장




SELECT empno, ename, dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

SELECT empno, ename, deptno, 
    (SELECT dname FROM dept WHERE deptno = emp.deptno)
FROM emp;

상호연관 서브쿼리: 메인 쿼리의 컬럼을 서브쿼리에서 사용한 서브쿼리
                 - 서브쿼리만 단독으로 실행하는 것이 불가능 하다 
                 - 메인쿼리와 서브 쿼리의 실행 순서가 정해져 있다
                   메인쿼리가 항상 먼저 실행된다
비상연관 서브쿼리: 메인 쿼리의 컬럼을 서브쿼리에서 사용하지 않은 서브쿼리
                 - 서브쿼리만 단독으로 실행하는 것이 가능하다
                - 메인 쿼리와 서브 쿼리의 실행  순서가 정해져 있지 않다
                   메인 ==> 서브, 서브 ==> 메인 둘 다 가능 
 
 SELECT *
 FROM deptno
 WHERE deptno IN (SELECT deptno
                  FROM emp);
                  
                  
                
SELECT dname
FROM dept
WHERE deptno = deptno;















