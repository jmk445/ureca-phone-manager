<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Management</title>
</head>
<body>
    <h1>Customer Management</h1>
    
    <table>
        <thead>
            <tr><th>Customer ID</th><th>Customer Name</th><th>Customer Email</th></tr>
        </thead>
        <tbody id="customerTbody">              
        </tbody>
    </table>
    <hr>
    <form>
        <input type="text" name="customerId" id="customerId" placeholder="Customer ID"><br>
        <input type="text" name="customerName" id="customerName" placeholder="Customer Name"><br>
        <input type="text" name="email" id="email" placeholder="Customer Email"><br>
    </form>
    <hr>
    <button type="button" id="btnInsert">Register</button>
    <button type="button" id="btnUpdate">Update</button>
    <button type="button" id="btnDelete">Delete</button>
    <button onclick="location.href='/'">홈</button>
    <script>
        window.onload = function(){
            listCustomers();
            document.querySelector("#btnInsert").onclick = insertCustomer;
            document.querySelector("#btnUpdate").onclick = updateCustomer;
            document.querySelector("#btnDelete").onclick = deleteCustomer;
        }   
        
        async function listCustomers(){
            let url = '/customers/list';
            try{
                let response = await fetch(url);
                let data = await response.json();
                makeListHtml(data);
            }catch(error){
                console.log(error);
                alert('Error loading customer list!');
            }           
        }
        
        async function makeListHtml(list){
            let listHTML = ``;
            list.forEach(el => {
                listHTML +=
                    `<tr style="cursor:pointer" data-customerId=\${el.customerId}>
                        <td>\${el.customerId}</td>
                        <td>\${el.customerName}</td>
                        <td>\${el.email}</td>
                    </tr>`;
            });
            document.querySelector("#customerTbody").innerHTML = listHTML;
            
            document.querySelectorAll("#customerTbody tr").forEach(el => {
                el.onclick = function(){
                    let customerId = this.getAttribute("data-customerId");    
                    detailCustomer(customerId);
                }
            });
        }   
        async function detailCustomer(customerId){
            let url = '/customers/detail/' + customerId;
            try{
                let response = await fetch(url);
                let data = await response.json();       
                document.querySelector("#customerId").value = data.customerId;
                document.querySelector("#customerName").value = data.customerName;
                document.querySelector("#email").value = data.email;                
            }catch(error){
                console.error(error);
                alert('휴대폰 상세 처리 중 오류 발생!');
            }           
        }   
        
        async function insertCustomer(){
            let urlParams = new URLSearchParams({
                customerId: document.querySelector("#customerId").value,
                customerName: document.querySelector("#customerName").value,
                email: document.querySelector("#email").value,
            });
            
            let fetchOptions = {
                method: "POST",
                body: urlParams,
            }
            
            let url = '/customers/insert';
            
            try{
                let response = await fetch(url, fetchOptions);
                let data = await response.json();
                alert('Customer Registered!');
                listCustomers();
            }catch(error){
                console.error(error);
                alert('Error registering customer!');
            }           
        }
        
        async function updateCustomer(){
            let urlParams = new URLSearchParams({
                customerId: document.querySelector("#customerId").value,
                customerName: document.querySelector("#customerName").value,
                email: document.querySelector("#email").value,
            });
            
            let fetchOptions = {
                method: "POST",
                body: urlParams,
            }
            
            let url = '/customers/update';
            
            try{
                let response = await fetch(url, fetchOptions);
                let data = await response.json();
                alert('Customer Updated!');
                listCustomers();
            }catch(error){
                console.error(error);
                alert('Error updating customer!');
            }           
        }
        
        async function deleteCustomer(){
            let customerId = document.querySelector("#customerId").value;
            let url = '/customers/delete/' + customerId;
            try{
                let response = await fetch(url);
                let data = await response.json();       
                alert('Customer Deleted!');
                listCustomers();
            }catch(error){
                console.error(error);
                alert('Error deleting customer!');
            }           
        }
    </script>
</body>
</html>
