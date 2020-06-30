<jsp:include page="header.jsp"/>

                    <style>
                        .empDetails input{
                            background: transparent;
                            border:0px;
                            border-bottom: 1px solid black;
                            padding: 10px;
                            height: 40px;
                        }
                        .empDetails label{
                            font-size: Large;
                            color: black;
                            padding: 15px;
                        }
                    </style>

        <!--================Header Area =================-->
        <div style="margin-left: 300px;
    margin-top: 100px;
    width: 800px;"><center><h1>Enter Employee Details Here!!!</h1></center>
            </div>
        <div  class="empDetails" style="margin-left: 300px;
    margin-top: 10px;
    border: 2px solid black;
    background-color: gainsboro;
    text-align:center;
    padding: 20px;
    width: 800px;">
            <form action="hrReg.jsp" method="post">
                
                <div class="row">           
    <label class="col-4" for="User" name="Name">Name: </label>
        <input class="col-6" name="User" type="text" required><br>
                </div>   
              <div class="row">  
              <label class="col-4" for="DOB" name="DOB">DOB: </label>
              <input class="col-6" name="DOB" type="date" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="email" name="email">Email: </label>
              <input class="col-6" name="email" type="text" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="phone1" name="phone1">Phone: </label>
              <input class="col-6" name="phone1" type="number" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="phone2" name="phone2">Alternate Phone Number: </label>
              <input class="col-6" name="phone2" type="number" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="join" >Joining Date: </label>
              <input class="col-6" name="join" type="date" placeholder="dd/mm/yyyy" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="Qualification" >Qualification: </label>
              <input class="col-6" name="Qualification" type="text" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="Designation" >Designation: </label>
              <input class="col-6" name="Designation" type="text" required><br>
              </div>
              
              <div class="row">  
              <label  class="col-4" for="Salary" >Salary: </label>
              <input class="col-6" name="Salary" type="Number" required><br>
              </div>
                <br><br>
                <input type="submit" style="background: gray;
                            border: 1px solid black;
                            border-radius: 20px;
                            color: white;
                            width:200px;
                            ">
              
            </form>
        </div>
        