<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
</head>
<body>
    <h1>주문 보기</h1>
    
    <table>
        <thead>
            <tr><th>주문 ID</th><th>고객 ID</th><th>고객 이름</th><th>주문 휴대폰</th><th>주문 시간</th></tr>
        </thead>
        <tbody id="orderTbody">              
        </tbody>
    </table>
<!--     <hr> -->
<!--     <form> -->
<!--         <input type="text" name="orderId" id="orderId" placeholder="주문 ID"><br> -->
<!--         <input type="text" name="customerId" id="customerId" placeholder="고객 ID"><br> -->
<!--         <input type="text" name="customerName" id="customerName" placeholder="고객 이름"><br> -->
<!--         <input type="text" name="orderPhoneString" id="orderPhoneString" placeholder="주문 휴대폰"><br> -->
<!--         <input type="text" name="orderTime" id="orderTime" placeholder="주문 시간"><br> -->
<!--     </form> -->
<!--     <hr> -->
    
    <button onclick="location.href='/'">홈</button>
    <script>
        window.onload = function(){
            listOrders();
           
        }   
        
        async function listOrders(){
            let url = '/orders/list';
            try{
                let response = await fetch(url);
                let data = await response.json();
                makeListHtml(data);
            }catch(error){
                console.log(error);
                alert('주문 목록 처리 중 오류 발생!');
            }           
        }
        
        async function makeListHtml(list){
            let listHTML = ``;
            list.forEach(el => {
                listHTML +=
                    `<tr style="cursor:pointer" data-orderId=\${el.orderId}>
                        <td>\${el.orderId}</td>
                        <td>\${el.customerId}</td>
                        <td>\${el.customerName}</td>
                        <td>\${el.orderPhoneString}</td>
                        <td>\${el.orderTime}</td> 
                    </tr>`;
            });
            
            document.querySelector("#orderTbody").innerHTML = listHTML;
        }   
              
    </script>
</body>
</html>
