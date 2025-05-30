<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
</head>
<body>
    <h1>휴대폰 관리</h1>
    
    <table>
        <thead>
            <tr><th>phoneId</th><th>phoneName</th><th>phonePrice</th><th>phoneMaker</th><th>phoneRemain</th></tr>
        </thead>
        <tbody id="phoneTbody">              
        </tbody>
    </table>
    <hr>
    <form>
        <input type="text" name="phoneId" id="phoneId"><br>
        <input type="text" name="phoneName" id="phoneName"><br>
        <input type="text" name="phonePrice" id="phonePrice"><br>
        <input type="text" name="phoneMaker" id="phoneMaker"><br>
        <input type="text" name="phoneRemain" id="phoneRemain"><br>
    </form>
    <hr>
    <button type="button" id="btnInsert">등록</button> <button type="button" id="btnUpdate">수정</button> <button type="button" id="btnDelete">삭제</button> <button onclick="location.href='/'">홈</button>

    
    <script>
        window.onload = function(){
            listPhone();
            
            document.querySelector("#btnInsert").onclick = insertPhone;
            document.querySelector("#btnUpdate").onclick = updatePhone;
            document.querySelector("#btnDelete").onclick = deletePhone;
        }   
        
        async function listPhone(){
            let url = '/phones/list';
            try{
                let response = await fetch(url);
                let data = await response.json();
                makeListHtml(data);
            }catch(error){
                console.log(error);
                alert('휴대폰 목록 처리 중 오류 발생!');
            }           
        }
        
        async function makeListHtml(list){
            let listHTML = ``;
            list.forEach(el => {
                listHTML +=
                    `<tr style="cursor:pointer" data-phoneId=\${el.phoneId}>
                        <td>\${el.phoneId}</td>
                        <td>\${el.phoneName}</td>
                        <td>\${el.phonePrice}</td>
                        <td>\${el.phoneMaker}</td>
                        <td>\${el.phoneRemain}</td>
                    </tr>`;
            });
            
            document.querySelector("#phoneTbody").innerHTML = listHTML;
            
            document.querySelectorAll("#phoneTbody tr").forEach(el => {
                el.onclick = function(){
                    let phoneId = this.getAttribute("data-phoneId");    
                    detailPhone(phoneId);
                }
            });
        }   
        
        async function detailPhone(phoneId){
            let url = '/phones/detail/' + phoneId;
            try{
                let response = await fetch(url);
                let data = await response.json();       
                document.querySelector("#phoneId").value = data.phoneId;
                document.querySelector("#phoneName").value = data.phoneName;
                document.querySelector("#phonePrice").value = data.phonePrice;
                document.querySelector("#phoneMaker").value = data.phoneMaker;
                document.querySelector("#phoneRemain").value = data.phoneRemain;
            }catch(error){
                console.error(error);
                alert('휴대폰 상세 처리 중 오류 발생!');
            }           
        }   
        
        async function insertPhone(){
            let urlParams = new URLSearchParams({
                phoneId: document.querySelector("#phoneId").value,
                phoneName: document.querySelector("#phoneName").value,
                phonePrice: document.querySelector("#phonePrice").value,
                phoneMaker: document.querySelector("#phoneMaker").value,
                phoneRemain: document.querySelector("#phoneRemain").value,
            });
            
            let fetchOptions = {
                method: "POST",
                body: urlParams,
            }
            
            let url = '/phones/insert';
            
            try{
                let response = await fetch(url, fetchOptions);
                let data = await response.json();
                alert('휴대폰 등록!');
                listPhone();
            }catch(error){
                console.error(error);
                alert('휴대폰 등록 처리 중 오류 발생!');
            }           
        }
        
        async function updatePhone(){
            let urlParams = new URLSearchParams({
                phoneId: document.querySelector("#phoneId").value,
                phoneName: document.querySelector("#phoneName").value,
                phonePrice: document.querySelector("#phonePrice").value,
                phoneMaker: document.querySelector("#phoneMaker").value,
                phoneRemain: document.querySelector("#phoneRemain").value,
            });
            
            let fetchOptions = {
                method: "POST",
                body: urlParams,
            }
            
            let url = '/phones/update';
            
            try{
                let response = await fetch(url, fetchOptions);
                let data = await response.json();
                alert('휴대폰 수정!');
                listPhone();
            }catch(error){
                console.error(error);
                alert('휴대폰 수정 처리 중 오류 발생!');
            }               
        }
        
        async function deletePhone(){
            let phoneId = document.querySelector("#phoneId").value;
            let url = '/phones/delete/' + phoneId;
            try{
                let response = await fetch(url);
                let data = await response.json();       
                alert('휴대폰 삭제!');
                listPhone();
            }catch(error){
                console.error(error);
                alert('휴대폰 삭제 처리 중 오류 발생!');
            }               
        }
    </script>
</body>
</html>
