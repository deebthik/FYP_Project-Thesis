<template>
<html lang="en" class="background_1">
  <head>
    <meta charset="UTF-8" />
    <title>User Dashboard</title>
    <link rel="stylesheet" href="./style.css" />
  </head>
  <body>
    <div id="main">
      <!-- partial:index.partial.html -->
      <h1>
        <span class="blue">USER DASHBOARD</span>
        <span class="blue"></span>
        <span class="yellow">
          <br />
          <br />Batches Overview
        </span>
      </h1>

      <table class="container">
        <thead>
          <tr>
            <th>
              <h1>Batch ID</h1>
            </th>
            <th>
              <h1>Admin</h1>
            </th>
            <th>
              <h1>Farm-Inspector</h1>
            </th>
            <th>
              <h1>Harvester</h1>
            </th>
            <th>
              <h1>Exporter</h1>
            </th>
            <th>
              <h1>Importer</h1>
            </th>
            <th>
              <h1>Processor</h1>
            </th>
            <th>
              <h1>Timeline</h1>
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(data,index) in dataList" :key="index">
            <td>{{ data.BatchId }}</td>
            <td>{{ data.CultivationStage }}</td>
            <td>{{ data.FarmInspectorStage }}</td>
            <td>{{ data.HarvesterStage }}</td>
            <td>{{ data.ExporterStage }}</td>
            <td>{{ data.ImporterStage}}</td>
            <td>{{ data.ProcessorStage }}</td>
            <td>
              <router-link :to="{ name: 'timeline', params: {id: data.BatchId }, props: {id: data.BatchId}}">&#128065;</router-link>
            </td>
          </tr>
        </tbody>
      </table>
      <center>
        <button class="button" @click="openNav()">
          <span>Add Details</span>
        </button>
      </center>
    </div>

     <div id="mySidenav" class="sidenav">
      <a  class="closebtn" @click="closeNav()">&times;</a>

      <form onsubmit="return false">
        <center>
          <h1>BATCH DETAILS</h1>
          <br />
          <h2>
            <label>
              <font size="6">Batch Id</font>
            </label>
            <br />
            <br />
            <input type="text" style="height:30px; width:200px" v-model="batchDetails.id" />
            <br />
            <br />
            <br />

            <label >
              <font size="6">Quantity</font>
            </label>
            <br />
            <br />
            <input type="text" style="height:30px; width:200px" v-model="batchDetails.quantity"/>
            <br />
            <br />
            <br />

            <label >
              <font size="6">Destination Address</font>
            </label>
            <br />
            <br />
            <input type="text" style="height:30px; width:200px" v-model="batchDetails.destinationAddress"/>
            <br />
            <br />
            <br />

            <label>
              <font size="6">Ship Name</font>
            </label>
            <br />
            <br />
            <input type="text" style="height:30px; width:200px" v-model="batchDetails.shipName" />
            <br />
            <br />
            <br />

            <label>
              <font size="6">Ship No</font>
            </label>
            <br />
            <br />
            <input type="text"  style="height:30px; width:200px" v-model="batchDetails.shipNo" />
            <br />
            <br />
            <br />

            <label>
              <font size="6">Departure Date Time</font>
            </label>
            <br />
            <br />
            <input type="text"  style="height:30px; width:200px" v-model="batchDetails.departureDateTime" />
            <br />
            <br />
            <br />

            <label>
              <font size="6">Estimated Arrival Time</font>
            </label>
            <br />
            <br />
            <input type="text"  style="height:30px; width:200px" v-model="batchDetails.estimatedArrivalTime" />
            <br />
            <br />
            <br />

             <label>
              <font size="6">Exporter Id</font>
            </label>
            <br />
            <br />
            <input type="text"  style="height:30px; width:200px" v-model="batchDetails.exporterId" />
            <br />
            <br />
            <br />

            <button style="height:50px; width:200px" @click="addBatch">Add Details</button>
          </h2>
        </center>
      </form>
    </div>

  </body>
</html>
</template>

<script>

const API_URL = "http://localhost:4000";
export default {
  data: function() {
    return {
       dataList: "",
       batchDetails: {
       id:"",
       quantity: 0,
       destinationAddress: "",
       shipName : "",
       shipNo: "",
       departureDateTime: "",
       estimatedArrivalTime: "",
       exporterId: 0
      }
    };
  },

   mounted() {
    fetch(API_URL+"/queryResponse")
    .then(response => response.json())
    .then(result => {
      this.dataList = result;
    })
  }, 

  methods: {

    openNav: function() {
       this.batchDetails.id = ''
       this.batchDetails.quantity = 0
       this.batchDetails.destinationAddress = ''
       this.batchDetails.shipName = ''
       this.batchDetails.shipNo =  ''
       this.batchDetails.departureDateTime = ''
       this.batchDetails.estimatedArrivalTime = ''
       this.batchDetails.exporterId = 0
      document.getElementById("mySidenav").style.width = "750px";
      document.getElementById("main").style.marginLeft = "750px";
    },

    closeNav: function() {
      document.getElementById("mySidenav").style.width = "0";
      document.getElementById("main").style.marginLeft = "0";
    },
    
    addBatch: function() {
      let data = {
        id: this.batchDetails.id,
        stage: "exporter",
        data: {
          quantity: parseFloat(this.batchDetails.quantity),
          'destination-address': this.batchDetails.destinationAddress,
          'ship-name': this.batchDetails.shipName,
          'ship-no': this.batchDetails.shipNo,
          'departure-date-time': this.batchDetails.departureDateTime,
          'estimated-arrival-time': this.batchDetails.estimatedArrivalTime,
          'exporter-id': parseInt(this.batchDetails.exporterId)
      }};
      console.log(data);

      fetch(API_URL+"/updateBatch", {
        method: "POST",
        body: JSON.stringify(data),
        headers: {
          "content-type":"application/json"
        }
      });
      this.closeNav()
    }
  }
};
</script>

<style scoped>
@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

input[type="submit"] {
  font-size: 20px;
}

/* The side navigation menu */
.sidenav {
  height: 100%; /* 100% Full-height */
  width: 0; /* 0 width - change this with JavaScript */
  position: fixed; /* Stay in place */
  z-index: 1; /* Stay on top */
  top: 0; /* Stay at the top */
  left: 0;
  background-color: #111; /* Black*/
  overflow-x: hidden; /* Disable horizontal scroll */
  padding-top: 60px; /* Place content 60px from the top */
  transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
}

/* The navigation menu links */
.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover {
  color: #f1f1f1;
}

/* Position and style the close button (top right corner) */
.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

/* Style page content - use this if you want to push the page content to the right when you open the side navigation */
#main {
  transition: margin-left 0.5s;
  padding: 20px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidenav {
    padding-top: 15px;
  }
  .sidenav a {
    font-size: 18px;
  }
}

/* The side navigation menu */
.sidenav_user {
  height: 100%; /* 100% Full-height */
  width: 0; /* 0 width - change this with JavaScript */
  position: fixed; /* Stay in place */
  z-index: 1; /* Stay on top */
  top: 0; /* Stay at the top */
  left: 0;
  background-color: #111; /* Black*/
  overflow-x: hidden; /* Disable horizontal scroll */
  padding-top: 60px; /* Place content 60px from the top */
  transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
}

/* The navigation menu links */
.sidenav_user a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

/* When you mouse over the navigation links, change their color */
.sidenav_user a:hover {
  color: #f1f1f1;
}

/* Position and style the close button (top right corner) */
.sidenav_user .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

/* Style page content - use this if you want to push the page content to the right when you open the side navigation */
#main {
  transition: margin-left 0.5s;
  padding: 20px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidenav_user {
    padding-top: 15px;
  }
  .sidenav_user a {
    font-size: 18px;
  }
}

.button {
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #ffffff;
  text-align: center;
  font-size: 28px;
  padding: 20px;
  width: 300px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: "\00bb";
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}

background_1 {
  background-color: #1f2739;
  width: 100%;
  height: 100%;
}

body {
  font-family: "Open Sans", sans-serif;
  font-weight: 300;
  line-height: 1.42em;
  color: #a7a1ae;
  background-color: #1f2739;
}

h1 {
  font-size: 3em;
  font-weight: 300;
  line-height: 1em;
  text-align: center;
  color: #4dc3fa;
}

h2 {
  font-size: 1em;
  font-weight: 300;
  text-align: center;
  display: block;
  line-height: 1em;
  padding-bottom: 2em;
  color: #fb667a;
}

h2 a {
  font-weight: 700;
  text-transform: uppercase;
  color: #fb667a;
  text-decoration: none;
}

.blue {
  color: #185875;
}
.yellow {
  color: #fff842;
}

.container th h1 {
  font-weight: bold;
  font-size: 1em;
  text-align: left;
  color: #185875;
}

.container td {
  font-weight: normal;
  font-size: 1em;
  -webkit-box-shadow: 0 2px 2px -2px #0e1119;
  -moz-box-shadow: 0 2px 2px -2px #0e1119;
  box-shadow: 0 2px 2px -2px #0e1119;
}

.container {
  text-align: left;
  overflow: hidden;
  width: 80%;
  margin: 0 auto;
  display: table;
  padding: 0 0 8em 0;
}

.container td,
.container th {
  padding-bottom: 2%;
  padding-top: 2%;
  padding-left: 2%;
}

/* Background-color of the odd rows */
.container tr:nth-child(odd) {
  background-color: #323c50;
}

/* Background-color of the even rows */
.container tr:nth-child(even) {
  background-color: #2c3446;
}

.container th {
  background-color: #1f2739;
}

.container td:first-child {
  color: #fb667a;
}

.container tr:hover {
  background-color: #464a52;
  -webkit-box-shadow: 0 6px 6px -6px #0e1119;
  -moz-box-shadow: 0 6px 6px -6px #0e1119;
  box-shadow: 0 6px 6px -6px #0e1119;
}

.container td:hover {
  background-color: #fff842;
  color: #403e10;
  font-weight: bold;

  box-shadow: #7f7c21 -1px 1px, #7f7c21 -2px 2px, #7f7c21 -3px 3px,
    #7f7c21 -4px 4px, #7f7c21 -5px 5px, #7f7c21 -6px 6px;
  transform: translate3d(6px, -6px, 0);

  transition-delay: 0s;
  transition-duration: 0.4s;
  transition-property: all;
  transition-timing-function: line;
}

@media (max-width: 800px) {
  .container td:nth-child(4),
  .container th:nth-child(4) {
    display: none;
  }
}
</style>