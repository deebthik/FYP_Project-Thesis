<template>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>CodePen - vertical timeline agenda</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/foundation/6.2.0/foundation.min.css" />
    <link rel="stylesheet" href="./style.css" />
  </head>

  <body>
    <center class="agenda"><h2> {{ "Batch Id: " + $route.params.id}}</h2></center>
    <div class="section agenda">
      <div class="row column text-center">
        <div class="agenda__month">
          <h2 class="agenda__month__title">
            <time datetime></time>
          </h2>
          <ol class="agenda__list">
            <li class="agenda__item toiletteur" v-show="response.CultivationData.id !== ''">
              <article class="agenda__item__article">
                <span class="agenda__item__date">&#10003;</span>
                <div class="agenda__item__detail">
                  <div class="horaires">
                    <time datetime v-if="response.CultivationData.id !== ''">
                      {{ response.CultivationData.timestamp.split(" ")[0]}}
                      <br /> {{ 
                        response.CultivationData.timestamp.split(" ")[1].split(".")[0]
                        }}
                    </time>
                  </div>
                  <div class="desc">
                    <h3 class="agenda__item__title">Cultivation</h3>
                    <p>
                      <br />Farmer Name:
                      <b>{{ response.CultivationData['farmer-name'] }}</b>
                      <br />
                      <br />Farmer Address:
                      <b>{{ response.CultivationData['farm-address'] }}</b>
                      <br />
                      <br />Exporter Name:
                      <b>{{ response.CultivationData['exporter-name'] }}</b>
                      <br />
                      <br />Importer Name:
                      <b>{{ response.CultivationData['importer-name'] }}</b>
                      <br />
                    </p>
                  </div>
                  <button class="edit__btn">
                    <i class="fa fa-pencil"></i>
                  </button>
                </div>
              </article>
            </li>
            <li class="agenda__item" v-show="response.FarmInspectorData.id !== ''">
              <article class="agenda__item__article">
                <span class="agenda__item__date">&#10003;</span>
                <div class="agenda__item__detail">
                  <div class="horaires">
                     <time datetime v-if="response.FarmInspectorData.id !== ''">
                      {{ response.FarmInspectorData.timestamp.split(" ")[0]}}
                      <br /> {{ response.FarmInspectorData.timestamp.split(" ")[1].split(".")[0]}}
                    </time>
                  </div>
                  <div class="desc">
                    <h3 class="agenda__item__title">Farm Inspector</h3>
                    <p>
                      <br/>
                      Coffee Family:
                      <b>{{response.FarmInspectorData['coffee-family']}}</b>
                      <br />
                      <br />Type of Seeds:
                      <b>{{response.FarmInspectorData['seed-type']}}</b>
                      <br />
                      <br />Fertilizer Used:
                      <b>{{response.FarmInspectorData['fertilizer-used']}}</b>
                      <br />
                    </p>
                  </div>
                  <button class="edit__btn">
                    <i class="fa fa-pencil"></i>
                  </button>
                </div>
              </article>
            </li>
          </ol>
        </div>
        <div class="agenda__month">
          <h2 class="agenda__month__title">
            <time datetime></time>
          </h2>
          <ol class="agenda__list">
            <li class="agenda__item veterinaire" v-show="response.HarvesterData.id !== ''">
              <article class="agenda__item__article">
                <span class="agenda__item__date">&#10003;</span>
                <div class="agenda__item__detail">
                  <div class="horaires">
                     <time datetime v-if="response.HarvesterData.id !== ''">
                      {{ response.HarvesterData.timestamp.split(" ")[0]}}
                      <br /> {{ response.HarvesterData.timestamp.split(" ")[1].split(".")[0]}}
                    </time>
                  </div>
                  <div class="desc">
                    <h3 class="agenda__item__title">Harvester</h3>
                    <p>
                      Temperature:
                      <b>{{response.HarvesterData.temperature + "°C"}}</b>
                      <br />Humidity:
                      <b>{{response.HarvesterData.humidity + "%"}}</b>
                      <br />
                    </p>
                  </div>
                  <button class="edit__btn">
                    <i class="fa fa-pencil"></i>
                  </button>
                </div>
              </article>
            </li>
            <li class="agenda__item club" v-show="response.ExporterData.id !== ''">
              <article class="agenda__item__article">
                <span class="agenda__item__date">&#10003;</span>
                <div class="agenda__item__detail">
                  <div class="horaires">
                     <time datetime v-if="response.ExporterData.id !== ''">
                      {{ response.ExporterData.timestamp.split(" ")[0]}}
                      <br /> {{ response.ExporterData.timestamp.split(" ")[1].split(".")[0]}}
                    </time>
                  </div>
                  <div class="desc">
                    <h3 class="agenda__item__title">Exporter</h3>
                    <p>
                      <br />
                      Quantity:
                      <b>{{ response.ExporterData.quantity + "kg"}}</b>
                      <br />
                      <br />Destination Address:
                      <b>{{ response.ExporterData['destination-address'] }}</b>
                      <br />
                      <br />Ship Name:
                      <b>{{ response.ExporterData['ship-name'] }}</b>
                      <br />
                      <br />Ship Number:
                      <b>{{ response.ExporterData['ship-no'] }}</b>
                      <br />
                      <br />
                      <br />Departure:
                      <b>{{ response.ExporterData['depature-arrival-time'] }}</b>
                      <br />
                      <br />ETA:
                      <b>{{ response.ExporterData['estimated-arrival-time'] }}</b>
                      <br />
                      <br />Exporter ID:
                      <b> {{ response.ExporterData['exporter-id'] }} </b>
                      <br />
                    </p>
                  </div>
                  <button class="edit__btn">
                    <i class="fa fa-pencil"></i>
                  </button>
                </div>
              </article>
            </li>
          </ol>
        </div>

        <div class="agenda__month">
          <h2 class="agenda__month__title">
            <time datetime></time>
          </h2>
          <ol class="agenda__list">
            <li class="agenda__item toiletteur" v-show="response.ImporterData.id !== ''">
              <article class="agenda__item__article">
                <span class="agenda__item__date">&#10003;</span>
                <div class="agenda__item__detail">
                  <div class="horaires">
                     <time datetime v-if="response.ImporterData.id !== ''">
                      {{ response.ImporterData.timestamp.split(" ")[0]}}
                      <br /> {{ response.ImporterData.timestamp.split(" ")[1].split(".")[0]}}
                    </time>
                  </div>
                  <div class="desc">
                    <h3 class="agenda__item__title">Importer</h3>
                    <p>
                      <br/>
                      Ship Name:
                      <b>{{response.ImporterData['ship-name']}}</b>
                      <br />
                      <br />Ship No:
                      <b>{{response.ImporterData['ship-no']}}</b>
                      <br />
                      <br />ETA:
                      <b>{{response.ImporterData['arrival-date-time']}}</b>
                      <br />
                      <br />Transport Info:
                      <b>{{response.ImporterData['transport-info']}}</b>
                      <br />
                      <br />Warehouse Name:
                      <b>{{response.ImporterData['warehouse-name']}}</b>
                      <br />
                      <br />Warehouse Address:
                      <b>{{response.ImporterData['warehouse-address']}}</b>
                      <br />
                      <br />Importer Id:
                      <b>{{response.ImporterData['importer-id']}}</b>
                      <br />
                    </p>
                  </div>
                  <button class="edit__btn">
                    <i class="fa fa-pencil"></i>
                  </button>
                </div>
              </article>
            </li>
            <li class="agenda__item" v-show="response.ProcessorData.id !== ''">
              <article class="agenda__item__article">
                <span class="agenda__item__date">&#10003;</span>
                <div class="agenda__item__detail">
                  <div class="horaires">
                     <time datetime v-if="response.ProcessorData.id !== ''">
                      {{ response.ProcessorData.timestamp.split(" ")[0]}}
                      <br /> {{ response.ProcessorData.timestamp.split(" ")[1].split(".")[0]}}
                    </time>
                  </div>
                  <div class="desc">
                    <h3 class="agenda__item__title">Processor</h3>
                    <p>
                      <br/>
                      Temperature:
                      <b>{{response.ProcessorData['temperature'] + "°C"}}</b>
                      <br />
                      <br />Roasting Duration:
                      <b>{{response.ProcessorData['roasting-duration']}}</b>
                      <br />
                      <br />Package Date Time:
                      <b>{{response.ProcessorData['package-date-time']}}</b>
                      <br />
                      <br />Processor Name:
                      <b>{{response.ProcessorData['processor-name']}}</b>
                      <br />
                      <br />Warehouse Address:
                      <b>{{response.ProcessorData['warehouse-address']}}</b>
                      <br />
                    </p>
                  </div>
                  <button class="edit__btn">
                    <i class="fa fa-pencil"></i>
                  </button>
                </div>
              </article>
            </li>
          </ol>
        </div>
      </div>
    </div>
  </body>
</html>
</template>

<script>
const API_URL = "http://localhost:4000";
export default {
  data: function() {
    return {
      response: {}
    };
  },
  props: ["id"],
 mounted() {
   let data = {
     id: this.id
   };
   console.log(data)
    fetch(API_URL+"/queryBatch", {
        method: "POST",
        body: JSON.stringify(data),
        headers: {
          "content-type":"application/json"
        }})
    .then(response => response.json()).then((mid) => {
      console.log(mid)
      return mid
    })
    .then(result => {
      this.response = result;
    })
  },
};
</script>

<style scoped>
.agenda {
  background: rgba(225, 225, 225, 0.85);
}

.agenda__month {
  position: relative;
  padding-bottom: 4rem;
}
.agenda__month:before {
  content: "";
  display: block;
  width: 4px;
  height: 100%;
  position: absolute;
  top: 0;
  left: calc(50% - 2px);
  background: #fff;
  z-index: 0;
}

.agenda__month__title {
  position: relative;
  width: 8rem;
  height: 8rem;
  padding: 1em;
  margin: auto;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 4rem;
  background: #fff;
  border-radius: 50%;
  font-weight: bold;
  text-transform: uppercase;
}
.agenda__month__title time {
  display: inline-block;
  line-height: 1.2;
  font-size: 1.6rem;
}

.agenda__list {
  list-style: none;
  margin: 0;
  position: relative;
}
.agenda__list li + li {
  margin-top: 4rem;
}

.agenda__item__detail {
  display: flex;
  flex-direction: column;
  align-items: stretch;
  position: relative;
  background: #fff;
}
@media (min-width: 1024px) {
  .agenda__item__detail {
    flex-direction: row;
  }
}
.agenda__item__detail:before {
  content: "";
  display: block;
  width: 1.2rem;
  height: 1.2rem;
  background: #fff;
  position: absolute;
  transform: rotate(45deg);
  top: calc(50% - 0.6rem);
}
.agenda__item__detail .horaires {
  flex-basis: 40%;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 1.4rem;
  font-weight: bold;
  color: #fff;
  background: #009688;
}
.agenda__item__detail .desc {
  padding: 2rem;
  text-align: left;
}

.agenda__item .agenda__item__detail .edit__btn {
  position: absolute;
  top: -1em;
  right: -1em;
}
@media (min-width: 640px) {
  .agenda__item .agenda__item__article {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .agenda__item .agenda__item__article:before {
    content: "";
    display: block;
    order: 2;
    flex-basis: 40%;
  }
  .agenda__item .agenda__item__date {
    order: 1;
  }
  .agenda__item .agenda__item__detail {
    order: 0;
    flex-basis: 40%;
  }
  .agenda__item:nth-child(1n + 1) .agenda__item__detail:before {
    right: -0.6rem;
  }
  .agenda__item:nth-child(1n + 2) .agenda__item__article:before {
    order: 0;
  }
  .agenda__item:nth-child(1n + 2) .agenda__item__detail {
    order: 2;
  }
  .agenda__item:nth-child(1n + 2) .agenda__item__detail:before {
    left: -0.6rem;
  }
  .agenda__item:nth-child(1n + 2) .agenda__item__detail .edit__btn {
    left: -1em;
  }
}
@media (min-width: 640px) and (min-width: 1024px) {
  .agenda__item:nth-child(1n + 2) .agenda__item__detail .horaires {
    order: 1;
  }
}

.agenda__item__title {
  font-weight: bold;
}

.agenda__item__date {
  display: block;
  line-height: 4rem;
  background: #009688;
  color: #fff;
  font-size: 1.4rem;
}
@media (min-width: 640px) {
  .agenda__item__date {
    width: 4rem;
    border-radius: 50%;
  }
}
</style>