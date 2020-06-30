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
    width: 800px;"><center><h1>Add Bus Details Here!!!</h1></center>
            </div>
        <div  class="empDetails" style="margin-left: 300px;
    margin-top: 10px;
    border: 2px solid black;
    background-color: gainsboro;
    text-align:center;
    padding: 20px;
    width: 800px;">
            <form action="Add.jsp" method="post">
                
                <div class="row">           
    <label class="col-4" for="bus" name="Name">Bus Name: </label>
        <input class="col-6" name="bus" type="text" required><br>
                </div>   
              <div class="row">  
              <label class="col-4" for="source" name="source">Source: </label>
              <input class="col-6" name="source" type="text" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="dest" name="dest">Destination: </label>
              <input class="col-6" name="dest" type="text" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="departDate: " name="departDate">Departure: </label>
              <input class="col-6" name="departDate" type="dateDate" required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="arrivalDate" name="arrivalDate">Arrival: </label>
              <input class="col-6" name="arrivalDate" type="date" required><br>
              </div>
                  
                    <div class="row">
              <label class="col-4" for="departTime: " name="departTime">Departure Time: </label>
              <input class="col-4" name="departTime" type="time" required><br>
                    </div>
                    <div class="row">
              <label class="col-4" for="arrivalTime" name="arrivalTime">Arrival Time: </label>
              <input class="col-4" name="arrivalTime" type="time" required><br>
              </div>
              
                
              
              <div class="row">  
              <label class="col-4" for="seat" >No of Seats: </label>
              <input class="col-6" name="seat" type="number"  required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="type" >Bus Type: </label>
              <input class="col-6" name="type" type="text"  required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="BusNo" >Bus Number: </label>
              <input class="col-6" name="BusNo" type="text"  required><br>
              </div>
              <div class="row">  
              <label class="col-4" for="BusStatus" >Bus Status: </label>
              <input class="col-6" name="BusStatus" type="text"  required><br>
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
        