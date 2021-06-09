const operations = [
  {
    "operationType": "PayOut",
    "date": "2021-02-18T12:50:17+03:00",
    "isMarginCall": false,
    "payment": -6947,
    "currency": "RUB",
    "status": "Done",
    "id": "827742857"
  },
  {
    "operationType": "Sell",
    "date": "2021-02-18T12:48:29.278+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S684M6",
    "quantity": 20,
    "quantityExecuted": 20,
    "price": 347.35,
    "payment": 6947,
    "currency": "RUB",
    "trades": [
      {
        "tradeId": "3626862244",
        "date": "2021-02-18T12:48:29.278+03:00",
        "quantity": 20,
        "price": 347.35
      }
    ],
    "status": "Done",
    "id": "22839065261"
  },
  {
    "operationType": "PayOut",
    "date": "2021-02-06T14:36:31+03:00",
    "isMarginCall": false,
    "payment": -1E+2,
    "currency": "RUB",
    "status": "Done",
    "id": "768386634"
  },
  {
    "operationType": "TaxBack",
    "date": "2021-01-28T20:57:03+03:00",
    "isMarginCall": false,
    "payment": 4,
    "currency": "RUB",
    "status": "Done",
    "id": "736775352"
  },
  {
    "operationType": "TaxDividend",
    "date": "2021-01-20T21:40:38+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S684M6",
    "payment": -13,
    "currency": "RUB",
    "status": "Done",
    "id": "703296710"
  },
  {
    "operationType": "Dividend",
    "date": "2021-01-20T15:57:51+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S684M6",
    "payment": 1E+2,
    "currency": "RUB",
    "status": "Done",
    "id": "703295418"
  },
  {
    "operationType": "TaxBack",
    "date": "2021-01-19T04:56:33+03:00",
    "isMarginCall": false,
    "payment": 9,
    "currency": "RUB",
    "status": "Done",
    "id": "695729038"
  },
  {
    "operationType": "PayOut",
    "date": "2021-01-13T15:02:55+03:00",
    "isMarginCall": false,
    "payment": -730.63,
    "currency": "RUB",
    "status": "Done",
    "id": "695728069"
  },
  {
    "operationType": "Sell",
    "date": "2021-01-13T15:01:53.629+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S683W7",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 73.36,
    "payment": 733.6,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -2.2},
    "trades": [
      {
        "tradeId": "3479573093",
        "date": "2021-01-13T15:01:53.629+03:00",
        "quantity": 10,
        "price": 73.36
      }
    ],
    "status": "Done",
    "id": "22424824786"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2021-01-13T15:01:53.629+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S683W7",
    "payment": -2.2,
    "currency": "RUB",
    "status": "Done",
    "id": "681055384"
  },
  {
    "operationType": "TaxBack",
    "date": "2021-01-12T04:41:24+03:00",
    "isMarginCall": false,
    "payment": 1E+1,
    "currency": "RUB",
    "status": "Done",
    "id": "674304905"
  },
  {
    "operationType": "PayOut",
    "date": "2021-01-06T17:22:01+03:00",
    "isMarginCall": false,
    "payment": -34.75,
    "currency": "USD",
    "status": "Done",
    "id": "658265041"
  },
  {
    "operationType": "PayOut",
    "date": "2021-01-06T17:21:34+03:00",
    "isMarginCall": false,
    "payment": -2082,
    "currency": "RUB",
    "status": "Done",
    "id": "674304577"
  },
  {
    "operationType": "Sell",
    "date": "2021-01-06T17:19:39.861+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 33.2,
    "payment": 33.2,
    "currency": "USD",
    "commission": {"currency": "USD", "value": -0.1},
    "trades": [
      {
        "tradeId": "2701103950",
        "date": "2021-01-06T17:19:39.861+03:00",
        "quantity": 1,
        "price": 33.2
      }
    ],
    "status": "Done",
    "id": "189943926150"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2021-01-06T17:19:39.861+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "payment": -0.1,
    "currency": "USD",
    "status": "Done",
    "id": "658254207"
  },
  {
    "operationType": "Sell",
    "date": "2021-01-06T17:19:21.592+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 2455.8,
    "payment": 2455.8,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -7.37},
    "trades": [
      {
        "tradeId": "3459982111",
        "date": "2021-01-06T17:19:21.592+03:00",
        "quantity": 1,
        "price": 2455.8
      }
    ],
    "status": "Done",
    "id": "22358372105"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2021-01-06T17:19:21.592+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "payment": -7.37,
    "currency": "RUB",
    "status": "Done",
    "id": "658253919"
  },
  {
    "operationType": "PayIn",
    "date": "2020-12-29T12:51:25+03:00",
    "isMarginCall": false,
    "payment": 6.76E+3,
    "currency": "RUB",
    "status": "Done",
    "id": "639531033"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-29T03:00:28.662+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "638455013"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-28T02:24:22.899+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "634599698"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-27T02:25:06.523+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "634036493"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-26T02:24:49.727+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "633384635"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-25T02:23:38.415+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "632430136"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-24T02:23:27.275+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "633047136"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-23T02:23:37.455+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "624113068"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-22T02:23:38.702+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "620694034"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-21T02:31:24.576+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "616182687"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-20T02:31:48.641+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "615644745"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-19T02:31:48.328+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "615030859"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-18T02:24:15.655+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "611489699"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-17T02:25:34.047+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "607935540"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-16T02:24:24.966+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "604670250"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-15T02:23:56.863+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "601123588"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-14T02:25:03.474+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "597339131"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-13T02:25:24.77+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "596827282"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-12T02:25:35.643+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "596220138"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-11T02:44:00.459+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "592418090"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-10T02:25:49.529+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "588923737"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-09T02:26:19.221+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "584727039"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-08T02:26:43.667+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "581027769"
  },
  {
    "operationType": "Dividend",
    "date": "2020-12-07T11:53:06+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "payment": 0.25,
    "currency": "USD",
    "status": "Done",
    "id": "578323121"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-07T02:30:13.778+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "576720002"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-06T02:30:44.131+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "576241498"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-05T02:31:00.384+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "575654297"
  },
  {
    "operationType": "Dividend",
    "date": "2020-12-04T11:30:16+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "payment": 0.25,
    "currency": "USD",
    "status": "Done",
    "id": "575492814"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-04T02:27:28.916+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "571909824"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-03T02:26:03.243+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "568009334"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-02T02:24:47.891+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "564325474"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-12-01T02:24:13.065+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "558416690"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-11-30T02:24:16.809+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "552548257"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-11-29T02:25:31.705+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "552081300"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-11-28T02:24:58.545+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "551321390"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-11-27T02:25:17.431+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "545861602"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-11-26T02:23:25.611+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "543533625"
  },
  {
    "operationType": "PayOut",
    "date": "2020-11-25T10:19:54+03:00",
    "isMarginCall": false,
    "payment": -3.6E+3,
    "currency": "RUB",
    "status": "Done",
    "id": "556542890"
  },
  {
    "operationType": "PayOut",
    "date": "2020-10-06T17:12:54+03:00",
    "isMarginCall": false,
    "payment": -2.3E+3,
    "currency": "RUB",
    "status": "Done",
    "id": "414655454"
  },
  {
    "operationType": "PayOut",
    "date": "2020-10-06T15:41:19+03:00",
    "isMarginCall": false,
    "payment": -2E+3,
    "currency": "RUB",
    "status": "Done",
    "id": "414657936"
  },
  {
    "operationType": "Sell",
    "date": "2020-10-06T15:40:06.505+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 2000.8,
    "payment": 2000.8,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -6},
    "trades": [
      {
        "tradeId": "3320306384",
        "date": "2020-10-06T15:40:06.505+03:00",
        "quantity": 1,
        "price": 2000.8
      }
    ],
    "status": "Done",
    "id": "21437572811"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-10-06T15:40:06.505+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "payment": -6,
    "currency": "RUB",
    "status": "Done",
    "id": "408529803"
  },
  {
    "operationType": "Sell",
    "date": "2020-10-06T13:22:25.926+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "quantity": 1,
    "quantityExecuted": 0,
    "price": 2.02E+3,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "21435512569"
  },
  {
    "operationType": "Dividend",
    "date": "2020-09-01T13:39:52+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "payment": 0.2,
    "currency": "USD",
    "status": "Done",
    "id": "346357806"
  },
  {
    "operationType": "PayOut",
    "date": "2020-08-28T17:49:21+03:00",
    "isMarginCall": false,
    "payment": -344.4,
    "currency": "RUB",
    "status": "Done",
    "id": "340393814"
  },
  {
    "operationType": "Dividend",
    "date": "2020-08-28T12:55:41+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "payment": 0.4,
    "currency": "USD",
    "status": "Done",
    "id": "340373476"
  },
  {
    "operationType": "TaxDividend",
    "date": "2020-07-14T15:50:41+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S684M6",
    "payment": -52,
    "currency": "RUB",
    "status": "Done",
    "id": "271227291"
  },
  {
    "operationType": "Dividend",
    "date": "2020-07-14T10:52:55+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S684M6",
    "payment": 396.4,
    "currency": "RUB",
    "status": "Done",
    "id": "271227625"
  },
  {
    "operationType": "Dividend",
    "date": "2020-06-16T15:56:41+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "payment": 0.14,
    "currency": "USD",
    "status": "Done",
    "id": "240605241"
  },
  {
    "operationType": "Dividend",
    "date": "2020-06-16T15:56:41+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "payment": 0.28,
    "currency": "USD",
    "status": "Done",
    "id": "240848164"
  },
  {
    "operationType": "PayOut",
    "date": "2020-05-07T14:29:40+03:00",
    "isMarginCall": false,
    "payment": -1815.74,
    "currency": "RUB",
    "status": "Done",
    "id": "190602358"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-22T15:56:11+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 76.083,
    "payment": 760.83,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -2.28},
    "trades": [
      {
        "tradeId": "231430718",
        "date": "2020-04-22T15:56:11.888+03:00",
        "quantity": 10,
        "price": 76.0825
      }
    ],
    "status": "Done",
    "id": "19785160386"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-22T15:56:11+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "payment": -2.28,
    "currency": "RUB",
    "status": "Done",
    "id": "174252846"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-22T15:39:09+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 76.283,
    "payment": 762.83,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -2.29},
    "trades": [
      {
        "tradeId": "231423669",
        "date": "2020-04-22T15:39:09.089+03:00",
        "quantity": 10,
        "price": 76.2825
      }
    ],
    "status": "Done",
    "id": "19784826184"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-22T15:39:09+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "payment": -2.29,
    "currency": "RUB",
    "status": "Done",
    "id": "174222918"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-21T11:02:49+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "quantity": 5,
    "quantityExecuted": 5,
    "price": 76.63,
    "payment": -383.15,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.15},
    "trades": [
      {
        "tradeId": "230951421",
        "date": "2020-04-21T11:02:49.54+03:00",
        "quantity": 5,
        "price": 76.63
      }
    ],
    "status": "Done",
    "id": "19765322627"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-21T11:02:49+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "payment": -1.15,
    "currency": "RUB",
    "status": "Done",
    "id": "172490260"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-20T21:17:07+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "quantity": 15,
    "quantityExecuted": 15,
    "price": 75.06,
    "payment": -1125.9,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -3.38},
    "trades": [
      {
        "tradeId": "230871690",
        "date": "2020-04-20T21:17:07.648+03:00",
        "quantity": 15,
        "price": 75.06
      }
    ],
    "status": "Done",
    "id": "19762823427"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-20T21:17:07+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "payment": -3.38,
    "currency": "RUB",
    "status": "Done",
    "id": "172024148"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-20T21:16:44+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "quantity": 4,
    "quantityExecuted": 4,
    "price": 75.0325,
    "payment": -300.13,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.9},
    "trades": [
      {
        "tradeId": "230871490",
        "date": "2020-04-20T21:16:44.573+03:00",
        "quantity": 4,
        "price": 75.0325
      }
    ],
    "status": "Done",
    "id": "19762819876"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-20T21:16:44+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "payment": -0.9,
    "currency": "RUB",
    "status": "Done",
    "id": "172024069"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-15T17:35:59.508+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG000CGC1X8",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 74.65,
    "payment": -74.65,
    "currency": "USD",
    "commission": {"currency": "USD", "value": -0.04},
    "trades": [
      {
        "tradeId": "494584120",
        "date": "2020-04-15T17:35:59.508+03:00",
        "quantity": 1,
        "price": 74.65
      }
    ],
    "status": "Done",
    "id": "119823687970"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-15T17:35:59.508+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG000CGC1X8",
    "payment": -0.04,
    "currency": "USD",
    "status": "Done",
    "id": "167899736"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-15T16:56:16.707+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG000CGC1X8",
    "quantity": 2,
    "quantityExecuted": 2,
    "price": 74.21,
    "payment": 148.42,
    "currency": "USD",
    "commission": {"currency": "USD", "value": -0.08},
    "trades": [
      {
        "tradeId": "494035170",
        "date": "2020-04-15T16:56:16.707+03:00",
        "quantity": 1,
        "price": 74.21
      },
      {
        "tradeId": "494035160",
        "date": "2020-04-15T16:56:16.707+03:00",
        "quantity": 1,
        "price": 74.21
      }
    ],
    "status": "Done",
    "id": "119793753720"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-15T16:56:16.707+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG000CGC1X8",
    "payment": -0.08,
    "currency": "USD",
    "status": "Done",
    "id": "167809802"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-04-15T02:24:46.625+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "166938407"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-15T01:24:13.627+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG000CGC1X8",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 78,
    "payment": -78,
    "currency": "USD",
    "commission": {"currency": "USD", "value": -0.04},
    "trades": [
      {
        "tradeId": "490599210",
        "date": "2020-04-15T01:24:13.627+03:00",
        "quantity": 1,
        "price": 78
      }
    ],
    "status": "Done",
    "id": "119560651960"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-15T01:24:13.627+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG000CGC1X8",
    "payment": -0.04,
    "currency": "USD",
    "status": "Done",
    "id": "166919626"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-10T10:04:28.535+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S684M6",
    "quantity": 50,
    "quantityExecuted": 50,
    "price": 3.4E+2,
    "payment": -1.7E+4,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -8.5},
    "trades": [
      {
        "tradeId": "3158445906",
        "date": "2020-04-10T10:04:28.535+03:00",
        "quantity": 50,
        "price": 3.4E+2
      }
    ],
    "status": "Done",
    "id": "20006512409"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-10T10:04:28.535+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S684M6",
    "payment": -8.5,
    "currency": "RUB",
    "status": "Done",
    "id": "163755589"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-10T10:03:42.753+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S684M6",
    "quantity": 40,
    "quantityExecuted": 40,
    "price": 338.4875,
    "payment": 13539.5,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -6.77},
    "trades": [
      {
        "tradeId": "3158441491",
        "date": "2020-04-10T10:03:42.753+03:00",
        "quantity": 30,
        "price": 338.5
      },
      {
        "tradeId": "3158441492",
        "date": "2020-04-10T10:03:42.753+03:00",
        "quantity": 10,
        "price": 338.45
      }
    ],
    "status": "Done",
    "id": "20006456255"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-10T10:03:42.753+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S684M6",
    "payment": -6.77,
    "currency": "RUB",
    "status": "Done",
    "id": "163754633"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-10T10:02:36+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "quantity": 70,
    "quantityExecuted": 70,
    "price": 74.09,
    "payment": -5186.3,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -2.59},
    "trades": [
      {
        "tradeId": "229213881",
        "date": "2020-04-10T10:02:36.563+03:00",
        "quantity": 70,
        "price": 74.09
      }
    ],
    "status": "Done",
    "id": "19710665895"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-10T10:02:36+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "payment": -2.59,
    "currency": "RUB",
    "status": "Done",
    "id": "163750256"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-10T10:00:47+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "quantity": 100,
    "quantityExecuted": 100,
    "price": 74.2225,
    "payment": 7422.25,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -3.71},
    "trades": [
      {
        "tradeId": "229212856",
        "date": "2020-04-10T10:00:47.505+03:00",
        "quantity": 100,
        "price": 74.2225
      }
    ],
    "status": "Done",
    "id": "19710635372"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-10T10:00:47+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "payment": -3.71,
    "currency": "RUB",
    "status": "Done",
    "id": "163745302"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-09T11:09:31.002+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 20,
    "quantityExecuted": 20,
    "price": 134.38,
    "payment": -2687.6,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.34},
    "trades": [
      {
        "tradeId": "3157044251",
        "date": "2020-04-09T11:09:31.002+03:00",
        "quantity": 20,
        "price": 134.38
      }
    ],
    "status": "Done",
    "id": "19990651861"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-09T11:09:31.002+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -1.34,
    "currency": "RUB",
    "status": "Done",
    "id": "162249668"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-09T10:15:29.265+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 20,
    "quantityExecuted": 0,
    "price": 131,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19989088626"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-09T10:09:24+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "quantity": 42,
    "quantityExecuted": 42,
    "price": 74.63,
    "payment": 3134.46,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.57},
    "trades": [
      {
        "tradeId": "228870740",
        "date": "2020-04-09T10:09:24.731+03:00",
        "quantity": 42,
        "price": 74.63
      }
    ],
    "status": "Done",
    "id": "19701265995"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-09T10:09:24+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "payment": -1.57,
    "currency": "RUB",
    "status": "Done",
    "id": "162025437"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-08T15:15:56.845+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 132.02,
    "payment": 1320.2,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.66},
    "trades": [
      {
        "tradeId": "3156126263",
        "date": "2020-04-08T15:15:56.845+03:00",
        "quantity": 10,
        "price": 132.02
      }
    ],
    "status": "Done",
    "id": "19983055060"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-08T15:15:56.845+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.66,
    "currency": "RUB",
    "status": "Done",
    "id": "161209823"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-08T10:03:37.637+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 20,
    "quantityExecuted": 20,
    "price": 130.52,
    "payment": 2610.4,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.31},
    "trades": [
      {
        "tradeId": "3155424455",
        "date": "2020-04-08T10:03:37.637+03:00",
        "quantity": 20,
        "price": 130.52
      }
    ],
    "status": "Done",
    "id": "19975428020"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-08T10:03:37.637+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -1.31,
    "currency": "RUB",
    "status": "Done",
    "id": "160801821"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-07T10:38:25.967+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 1014.6,
    "payment": -1014.6,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.51},
    "trades": [
      {
        "tradeId": "3153889985",
        "date": "2020-04-07T10:38:25.967+03:00",
        "quantity": 1,
        "price": 1014.6
      }
    ],
    "status": "Done",
    "id": "19961481070"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-07T10:38:25.967+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "payment": -0.51,
    "currency": "RUB",
    "status": "Done",
    "id": "159445819"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-07T10:29:48+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "quantity": 7,
    "quantityExecuted": 7,
    "price": 75.495714,
    "payment": -528.47,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.26},
    "trades": [
      {
        "tradeId": "228401782",
        "date": "2020-04-07T10:29:48.224+03:00",
        "quantity": 7,
        "price": 75.495
      }
    ],
    "status": "Done",
    "id": "19686364570"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-07T10:29:48+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "payment": -0.26,
    "currency": "RUB",
    "status": "Done",
    "id": "159425414"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-07T10:19:37.555+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 120,
    "quantityExecuted": 120,
    "price": 132.02,
    "payment": 15842.4,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -7.92},
    "trades": [
      {
        "tradeId": "3153787036",
        "date": "2020-04-07T10:19:37.555+03:00",
        "quantity": 120,
        "price": 132.02
      }
    ],
    "status": "Done",
    "id": "19960618675"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-07T10:19:37.555+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -7.92,
    "currency": "RUB",
    "status": "Done",
    "id": "159371388"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-07T10:16:10.204+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 130,
    "quantityExecuted": 0,
    "price": 132.62,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19960440937"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-07T10:00:50.374+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 240,
    "quantityExecuted": 240,
    "price": 132.62,
    "payment": -31828.8,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -15.91},
    "trades": [
      {
        "tradeId": "3153640002",
        "date": "2020-04-07T10:00:50.374+03:00",
        "quantity": 240,
        "price": 132.62
      }
    ],
    "status": "Done",
    "id": "19959340143"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-07T10:00:50.374+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -15.91,
    "currency": "RUB",
    "status": "Done",
    "id": "159262243"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-04-07T02:24:28.292+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "159235031"
  },
  {
    "operationType": "Dividend",
    "date": "2020-04-06T15:56:41+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "payment": 0.42,
    "currency": "USD",
    "status": "Done",
    "id": "158950645"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-06T15:28:51.793+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 128.56,
    "payment": 1285.6,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.64},
    "trades": [
      {
        "tradeId": "3153046915",
        "date": "2020-04-06T15:28:51.793+03:00",
        "quantity": 10,
        "price": 128.56
      }
    ],
    "status": "Done",
    "id": "19953812358"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-06T15:28:51.793+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.64,
    "currency": "RUB",
    "status": "Done",
    "id": "158492457"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-06T12:54:13.882+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 128,
    "payment": 1.28E+3,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.64},
    "trades": [
      {
        "tradeId": "3152729988",
        "date": "2020-04-06T12:54:21.157+03:00",
        "quantity": 10,
        "price": 128
      }
    ],
    "status": "Done",
    "id": "19950389519"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-06T12:54:13.882+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.64,
    "currency": "RUB",
    "status": "Done",
    "id": "158304158"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-06T12:45:33.849+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 20,
    "quantityExecuted": 0,
    "price": 128,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19950125388"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-06T10:33:59.249+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 127.5,
    "payment": 1275,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.64},
    "trades": [
      {
        "tradeId": "3152350540",
        "date": "2020-04-06T10:34:17.792+03:00",
        "quantity": 10,
        "price": 127.5
      }
    ],
    "status": "Done",
    "id": "19946089723"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-06T10:33:59.249+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.64,
    "currency": "RUB",
    "status": "Done",
    "id": "158056373"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-06T10:11:38.176+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 127,
    "payment": 1.27E+3,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.64},
    "trades": [
      {
        "tradeId": "3152322262",
        "date": "2020-04-06T10:27:39.64+03:00",
        "quantity": 10,
        "price": 127
      }
    ],
    "status": "Done",
    "id": "19945099128"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-06T10:11:38.176+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.64,
    "currency": "RUB",
    "status": "Done",
    "id": "158035331"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-06T10:02:22.291+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 127.2,
    "payment": 1272,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.64},
    "trades": [
      {
        "tradeId": "3152198241",
        "date": "2020-04-06T10:02:22.291+03:00",
        "quantity": 10,
        "price": 127.2
      }
    ],
    "status": "Done",
    "id": "19944443925"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-06T10:02:22.291+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.64,
    "currency": "RUB",
    "status": "Done",
    "id": "157923328"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-04-06T02:24:08.498+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "157888589"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-04-05T02:24:16.647+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "157859467"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-04-04T02:24:30.968+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "157827967"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-03T17:51:07.741+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 0,
    "price": 125,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19942497369"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-03T17:50:16.625+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 124.68,
    "payment": 1246.8,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.62},
    "trades": [
      {
        "tradeId": "3152019125",
        "date": "2020-04-03T17:50:16.625+03:00",
        "quantity": 10,
        "price": 124.68
      }
    ],
    "status": "Done",
    "id": "19942467116"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-03T17:50:16.625+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.62,
    "currency": "RUB",
    "status": "Done",
    "id": "157457595"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-03T17:15:42.71+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 124.86,
    "payment": 1248.6,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.62},
    "trades": [
      {
        "tradeId": "3151905644",
        "date": "2020-04-03T17:15:42.71+03:00",
        "quantity": 10,
        "price": 124.86
      }
    ],
    "status": "Done",
    "id": "19941106136"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-03T17:15:42.71+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.62,
    "currency": "RUB",
    "status": "Done",
    "id": "157394645"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-03T16:10:07.37+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 124.82,
    "payment": 1248.2,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.62},
    "trades": [
      {
        "tradeId": "3151721983",
        "date": "2020-04-03T16:10:07.37+03:00",
        "quantity": 10,
        "price": 124.82
      }
    ],
    "status": "Done",
    "id": "19938548365"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-03T16:10:07.37+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.62,
    "currency": "RUB",
    "status": "Done",
    "id": "157277144"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-03T16:00:58.421+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 124.64,
    "payment": 1246.4,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.62},
    "trades": [
      {
        "tradeId": "3151685617",
        "date": "2020-04-03T16:00:58.421+03:00",
        "quantity": 10,
        "price": 124.64
      }
    ],
    "status": "Done",
    "id": "19938118665"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-03T16:00:58.421+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.62,
    "currency": "RUB",
    "status": "Done",
    "id": "157261267"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-03T12:06:14.291+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 20,
    "quantityExecuted": 20,
    "price": 124.5,
    "payment": 2.49E+3,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.25},
    "trades": [
      {
        "tradeId": "3151115153",
        "date": "2020-04-03T12:08:54.465+03:00",
        "quantity": 20,
        "price": 124.5
      }
    ],
    "status": "Done",
    "id": "19929904863"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-03T12:06:14.291+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -1.25,
    "currency": "RUB",
    "status": "Done",
    "id": "156965556"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-03T10:47:43+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 77.215,
    "payment": -772.15,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.39},
    "trades": [
      {
        "tradeId": "227869570",
        "date": "2020-04-03T10:47:43.084+03:00",
        "quantity": 10,
        "price": 77.215
      }
    ],
    "status": "Done",
    "id": "19669056603"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-03T10:47:43+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "payment": -0.39,
    "currency": "RUB",
    "status": "Done",
    "id": "156829228"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-02T10:34:10+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "quantity": 20,
    "quantityExecuted": 20,
    "price": 77.875,
    "payment": -1557.5,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.78},
    "trades": [
      {
        "tradeId": "227549366",
        "date": "2020-04-02T10:34:10.282+03:00",
        "quantity": 20,
        "price": 77.875
      }
    ],
    "status": "Done",
    "id": "19658625263"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-02T10:34:10+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "payment": -0.78,
    "currency": "RUB",
    "status": "Done",
    "id": "155590125"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-02T10:32:46.741+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 30,
    "quantityExecuted": 30,
    "price": 123.3,
    "payment": -3699,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.85},
    "trades": [
      {
        "tradeId": "3149006944",
        "date": "2020-04-02T10:33:09.753+03:00",
        "quantity": 30,
        "price": 123.3
      }
    ],
    "status": "Done",
    "id": "19904569670"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-02T10:32:46.741+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -1.85,
    "currency": "RUB",
    "status": "Done",
    "id": "155586848"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-02T10:04:50.407+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 20,
    "quantityExecuted": 20,
    "price": 124.88,
    "payment": 2497.6,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.25},
    "trades": [
      {
        "tradeId": "3148851086",
        "date": "2020-04-02T10:04:50.407+03:00",
        "quantity": 20,
        "price": 124.88
      }
    ],
    "status": "Done",
    "id": "19902835650"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-02T10:04:50.407+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -1.25,
    "currency": "RUB",
    "status": "Done",
    "id": "155491514"
  },
  {
    "operationType": "Sell",
    "date": "2020-04-02T10:04:32.236+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 20,
    "quantityExecuted": 20,
    "price": 124.94,
    "payment": 2498.8,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.25},
    "trades": [
      {
        "tradeId": "3148848238",
        "date": "2020-04-02T10:04:32.236+03:00",
        "quantity": 20,
        "price": 124.94
      }
    ],
    "status": "Done",
    "id": "19902806615"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-02T10:04:32.236+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -1.25,
    "currency": "RUB",
    "status": "Done",
    "id": "155490222"
  },
  {
    "operationType": "Buy",
    "date": "2020-04-01T10:56:50.929+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 50,
    "quantityExecuted": 50,
    "price": 122.4,
    "payment": -6.12E+3,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -3.06},
    "trades": [
      {
        "tradeId": "3147770525",
        "date": "2020-04-01T10:56:50.929+03:00",
        "quantity": 50,
        "price": 122.4
      }
    ],
    "status": "Done",
    "id": "19890153392"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-04-01T10:56:50.929+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -3.06,
    "currency": "RUB",
    "status": "Done",
    "id": "154579415"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-04-01T02:26:21.617+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "154410954"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-31T16:57:10.366+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 123,
    "payment": 1.23E+3,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.62},
    "trades": [
      {
        "tradeId": "3147163673",
        "date": "2020-03-31T17:14:00.969+03:00",
        "quantity": 10,
        "price": 123
      }
    ],
    "status": "Done",
    "id": "19882527579"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-31T16:57:10.366+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.62,
    "currency": "RUB",
    "status": "Done",
    "id": "154016348"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-31T16:56:44.04+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 0,
    "price": 122.5,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19882512484"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-31T11:19:53.243+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 121.96,
    "payment": 1219.6,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.61},
    "trades": [
      {
        "tradeId": "3146212708",
        "date": "2020-03-31T11:19:53.243+03:00",
        "quantity": 10,
        "price": 121.96
      }
    ],
    "status": "Done",
    "id": "19870891118"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-31T11:19:53.243+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.61,
    "currency": "RUB",
    "status": "Done",
    "id": "153512122"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-31T11:18:19.137+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 121.78,
    "payment": 1217.8,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.61},
    "trades": [
      {
        "tradeId": "3146208083",
        "date": "2020-03-31T11:18:19.137+03:00",
        "quantity": 10,
        "price": 121.78
      }
    ],
    "status": "Done",
    "id": "19870841228"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-31T11:18:19.137+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.61,
    "currency": "RUB",
    "status": "Done",
    "id": "153509154"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-30T16:09:41.215+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 30,
    "quantityExecuted": 30,
    "price": 117.46,
    "payment": 3523.8,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.76},
    "trades": [
      {
        "tradeId": "3145438770",
        "date": "2020-03-30T16:09:41.215+03:00",
        "quantity": 30,
        "price": 117.46
      }
    ],
    "status": "Done",
    "id": "19861446381"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-30T16:09:41.215+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -1.76,
    "currency": "RUB",
    "status": "Done",
    "id": "152787481"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-30T11:29:07.737+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 20,
    "quantityExecuted": 0,
    "price": 117,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19851754766"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-27T17:08:00.095+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 30,
    "quantityExecuted": 30,
    "price": 116.5,
    "payment": -3495,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.75},
    "trades": [
      {
        "tradeId": "3144065875",
        "date": "2020-03-27T17:08:00.095+03:00",
        "quantity": 30,
        "price": 116.5
      }
    ],
    "status": "Done",
    "id": "19841031488"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-27T17:08:00.095+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -1.75,
    "currency": "RUB",
    "status": "Done",
    "id": "151817192"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-27T15:58:12.221+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 20,
    "quantityExecuted": 20,
    "price": 118.02,
    "payment": 2360.4,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.18},
    "trades": [
      {
        "tradeId": "3143821088",
        "date": "2020-03-27T15:58:12.221+03:00",
        "quantity": 20,
        "price": 118.02
      }
    ],
    "status": "Done",
    "id": "19837579003"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-27T15:58:12.221+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -1.18,
    "currency": "RUB",
    "status": "Done",
    "id": "151684094"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-26T12:35:09.814+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "quantity": 3,
    "quantityExecuted": 3,
    "price": 4590.5,
    "payment": -13771.5,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -6.89},
    "trades": [
      {
        "tradeId": "3141795413",
        "date": "2020-03-26T12:35:09.814+03:00",
        "quantity": 3,
        "price": 4590.5
      }
    ],
    "status": "Done",
    "id": "19804542729"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-26T12:35:09.814+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "payment": -6.89,
    "currency": "RUB",
    "status": "Done",
    "id": "148443533"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-26T12:03:33.423+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 4646.5,
    "payment": 4646.5,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -2.32},
    "trades": [
      {
        "tradeId": "3141689018",
        "date": "2020-03-26T12:03:33.423+03:00",
        "quantity": 1,
        "price": 4646.5
      }
    ],
    "status": "Done",
    "id": "19802665487"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-26T12:03:33.423+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "payment": -2.32,
    "currency": "RUB",
    "status": "Done",
    "id": "148404597"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-26T12:00:40+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "quantity": 20,
    "quantityExecuted": 20,
    "price": 78.1675,
    "payment": -1563.35,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.78},
    "trades": [
      {
        "tradeId": "226339544",
        "date": "2020-03-26T12:00:40.411+03:00",
        "quantity": 20,
        "price": 78.1675
      }
    ],
    "status": "Done",
    "id": "19611513054"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-26T12:00:40+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "payment": -0.78,
    "currency": "RUB",
    "status": "Done",
    "id": "148400148"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-26T11:31:49.979+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "quantity": 2,
    "quantityExecuted": 0,
    "price": 4.57E+3,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19800707335"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-26T11:31:14.519+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "quantity": 2,
    "quantityExecuted": 2,
    "price": 4612,
    "payment": 9224,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -4.61},
    "trades": [
      {
        "tradeId": "3141586956",
        "date": "2020-03-26T11:31:14.519+03:00",
        "quantity": 2,
        "price": 4612
      }
    ],
    "status": "Done",
    "id": "19800652934"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-26T11:31:14.519+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "payment": -4.61,
    "currency": "RUB",
    "status": "Done",
    "id": "148363332"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-26T11:28:21.966+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 4.6E+3,
    "payment": 4.6E+3,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -2.3},
    "trades": [
      {
        "tradeId": "3141582785",
        "date": "2020-03-26T11:30:37.808+03:00",
        "quantity": 1,
        "price": 4.6E+3
      }
    ],
    "status": "Done",
    "id": "19800431141"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-26T11:28:21.966+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "payment": -2.3,
    "currency": "RUB",
    "status": "Done",
    "id": "148359120"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-26T11:26:42.225+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "quantity": 2,
    "quantityExecuted": 0,
    "price": 4.6E+3,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19800315944"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-26T11:23:05.159+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "quantity": 2,
    "quantityExecuted": 2,
    "price": 4575,
    "payment": -9.15E+3,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -4.58},
    "trades": [
      {
        "tradeId": "3141544961",
        "date": "2020-03-26T11:23:05.196+03:00",
        "quantity": 2,
        "price": 4575
      }
    ],
    "status": "Done",
    "id": "19800069437"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-26T11:23:05.159+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "payment": -4.58,
    "currency": "RUB",
    "status": "Done",
    "id": "148350237"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-26T11:10:59.864+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 4601.5,
    "payment": 4601.5,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -2.3},
    "trades": [
      {
        "tradeId": "3141506745",
        "date": "2020-03-26T11:10:59.864+03:00",
        "quantity": 1,
        "price": 4601.5
      }
    ],
    "status": "Done",
    "id": "19799230155"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-26T11:10:59.864+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004731032",
    "payment": -2.3,
    "currency": "RUB",
    "status": "Done",
    "id": "148334181"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-25T15:00:31.526+03:00",
    "isMarginCall": false,
    "instrumentType": "Etf",
    "figi": "BBG00KMXFK61",
    "quantity": 1,
    "quantityExecuted": 0,
    "price": 1.45E+3,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19779346315"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-25T14:54:24.392+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S686N0",
    "quantity": 1,
    "quantityExecuted": 0,
    "price": 1.25E+3,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19779019981"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-25T14:53:58.475+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S686N0",
    "quantity": 4,
    "quantityExecuted": 4,
    "price": 1287.5,
    "payment": -5.15E+3,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -2.58},
    "trades": [
      {
        "tradeId": "3140313547",
        "date": "2020-03-25T14:53:58.475+03:00",
        "quantity": 4,
        "price": 1287.5
      }
    ],
    "status": "Done",
    "id": "19778999555"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-25T14:53:58.475+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S686N0",
    "payment": -2.58,
    "currency": "RUB",
    "status": "Done",
    "id": "149719332"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-25T14:29:39.164+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S686N0",
    "quantity": 4,
    "quantityExecuted": 0,
    "price": 1265,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19777447965"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-25T13:58:47.256+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S686N0",
    "quantity": 4,
    "quantityExecuted": 0,
    "price": 1.25E+3,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19774899565"
  },
  {
    "operationType": "MarginCommission",
    "date": "2020-03-25T02:24:32.671+03:00",
    "isMarginCall": false,
    "payment": -25,
    "currency": "RUB",
    "status": "Done",
    "id": "147035613"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-24T16:51:08.83+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S686N0",
    "quantity": 4,
    "quantityExecuted": 4,
    "price": 1.25E+3,
    "payment": 5E+3,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -2.5},
    "trades": [
      {
        "tradeId": "3138388130",
        "date": "2020-03-24T16:51:53.047+03:00",
        "quantity": 4,
        "price": 1.25E+3
      }
    ],
    "status": "Done",
    "id": "19754325660"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-24T16:51:08.83+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S686N0",
    "payment": -2.5,
    "currency": "RUB",
    "status": "Done",
    "id": "146579251"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-24T16:48:19.016+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S68758",
    "quantity": 3,
    "quantityExecuted": 3,
    "price": 1533,
    "payment": -4599,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -2.3},
    "trades": [
      {
        "tradeId": "3138379043",
        "date": "2020-03-24T16:48:19.016+03:00",
        "quantity": 3,
        "price": 1533
      }
    ],
    "status": "Done",
    "id": "19754181722"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-24T16:48:19.016+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S68758",
    "payment": -2.3,
    "currency": "RUB",
    "status": "Done",
    "id": "146573153"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-24T11:28:46.843+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S68758",
    "quantity": 3,
    "quantityExecuted": 3,
    "price": 1.56E+3,
    "payment": 4.68E+3,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -2.34},
    "trades": [
      {
        "tradeId": "3137498263",
        "date": "2020-03-24T11:32:10.858+03:00",
        "quantity": 3,
        "price": 1.56E+3
      }
    ],
    "status": "Done",
    "id": "19741420856"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-24T11:28:46.843+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S68758",
    "payment": -2.34,
    "currency": "RUB",
    "status": "Done",
    "id": "146118420"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-24T11:22:28.166+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004RVFCY3",
    "quantity": 2,
    "quantityExecuted": 2,
    "price": 3024,
    "payment": -6048,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -3.02},
    "trades": [
      {
        "tradeId": "3137467889",
        "date": "2020-03-24T11:22:28.166+03:00",
        "quantity": 1,
        "price": 3024
      },
      {
        "tradeId": "3137467890",
        "date": "2020-03-24T11:22:28.166+03:00",
        "quantity": 1,
        "price": 3024
      }
    ],
    "status": "Done",
    "id": "19741023263"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-24T11:22:28.166+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004RVFCY3",
    "payment": -3.02,
    "currency": "RUB",
    "status": "Done",
    "id": "146101863"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-24T10:07:11.996+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004RVFCY3",
    "quantity": 2,
    "quantityExecuted": 2,
    "price": 3055,
    "payment": 6.11E+3,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -3.06},
    "trades": [
      {
        "tradeId": "3137138002",
        "date": "2020-03-24T10:07:11.996+03:00",
        "quantity": 2,
        "price": 3055
      }
    ],
    "status": "Done",
    "id": "19736708369"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-24T10:07:11.996+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004RVFCY3",
    "payment": -3.06,
    "currency": "RUB",
    "status": "Done",
    "id": "145907844"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-23T16:50:35.88+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004RVFCY3",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 2969,
    "payment": 2969,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.48},
    "trades": [
      {
        "tradeId": "3136650245",
        "date": "2020-03-23T16:50:35.88+03:00",
        "quantity": 1,
        "price": 2969
      }
    ],
    "status": "Done",
    "id": "19729530740"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-23T16:50:35.88+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004RVFCY3",
    "payment": -1.48,
    "currency": "RUB",
    "status": "Done",
    "id": "145434829"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-19T10:17:06+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "quantity": 15,
    "quantityExecuted": 15,
    "price": 80.8,
    "payment": -1212,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.61},
    "trades": [
      {
        "tradeId": "224840455",
        "date": "2020-03-19T10:17:06.646+03:00",
        "quantity": 15,
        "price": 80.8
      }
    ],
    "status": "Done",
    "id": "19540424062"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-19T10:17:06+03:00",
    "isMarginCall": false,
    "instrumentType": "Currency",
    "figi": "BBG0013HGFT4",
    "payment": -0.61,
    "currency": "RUB",
    "status": "Done",
    "id": "142414929"
  },
  {
    "operationType": "PayIn",
    "date": "2020-03-19T10:17:05+03:00",
    "isMarginCall": false,
    "payment": 1212.61,
    "currency": "RUB",
    "status": "Done",
    "id": "142376589"
  },
  {
    "operationType": "BuyCard",
    "date": "2020-03-18T10:38:25.608+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004RVFCY3",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 2.82E+3,
    "payment": -2.82E+3,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.41},
    "trades": [
      {
        "tradeId": "3128786285",
        "date": "2020-03-18T10:38:25.608+03:00",
        "quantity": 1,
        "price": 2.82E+3
      }
    ],
    "status": "Done",
    "id": "19627387190"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-18T10:38:25.608+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004RVFCY3",
    "payment": -1.41,
    "currency": "RUB",
    "status": "Done",
    "id": "141334518"
  },
  {
    "operationType": "PayIn",
    "date": "2020-03-18T10:38:24+03:00",
    "isMarginCall": false,
    "payment": 2829.92,
    "currency": "RUB",
    "status": "Done",
    "id": "141277903"
  },
  {
    "operationType": "BuyCard",
    "date": "2020-03-18T10:38:09.293+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004RVFCY3",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 2819.5,
    "payment": -2819.5,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.41},
    "trades": [
      {
        "tradeId": "3128785157",
        "date": "2020-03-18T10:38:09.293+03:00",
        "quantity": 1,
        "price": 2819.5
      }
    ],
    "status": "Done",
    "id": "19627369734"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-18T10:38:09.293+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004RVFCY3",
    "payment": -1.41,
    "currency": "RUB",
    "status": "Done",
    "id": "141336620"
  },
  {
    "operationType": "PayIn",
    "date": "2020-03-18T10:38:08+03:00",
    "isMarginCall": false,
    "payment": 2828.42,
    "currency": "RUB",
    "status": "Done",
    "id": "141279883"
  },
  {
    "operationType": "BuyCard",
    "date": "2020-03-17T16:33:14.688+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 105.44,
    "payment": -1054.4,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -0.53},
    "trades": [
      {
        "tradeId": "3128094846",
        "date": "2020-03-17T16:33:14.688+03:00",
        "quantity": 10,
        "price": 105.44
      }
    ],
    "status": "Done",
    "id": "19618773394"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-17T16:33:14.688+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S681B4",
    "payment": -0.53,
    "currency": "RUB",
    "status": "Done",
    "id": "140751422"
  },
  {
    "operationType": "PayIn",
    "date": "2020-03-17T16:33:14+03:00",
    "isMarginCall": false,
    "payment": 1058.13,
    "currency": "RUB",
    "status": "Done",
    "id": "140748758"
  },
  {
    "operationType": "Sell",
    "date": "2020-03-17T10:33:36.671+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004RVFCY3",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 2733,
    "payment": 2733,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -1.37},
    "trades": [
      {
        "tradeId": "3126875373",
        "date": "2020-03-17T10:33:36.671+03:00",
        "quantity": 1,
        "price": 2733
      }
    ],
    "status": "Done",
    "id": "19599015621"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-17T10:33:36.671+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004RVFCY3",
    "payment": -1.37,
    "currency": "RUB",
    "status": "Done",
    "id": "140321743"
  },
  {
    "operationType": "ServiceCommission",
    "date": "2020-03-17T07:33:36+03:00",
    "isMarginCall": false,
    "payment": -2.9E+2,
    "currency": "RUB",
    "status": "Done",
    "id": "140319974"
  },
  {
    "operationType": "PayOut",
    "date": "2020-03-12T11:26:18+03:00",
    "isMarginCall": false,
    "payment": -174.61,
    "currency": "RUB",
    "status": "Done",
    "id": "137086763"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-12T10:55:40.494+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 1097.8,
    "payment": -1097.8,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -3.29},
    "trades": [
      {
        "tradeId": "3120137622",
        "date": "2020-03-12T10:55:40.494+03:00",
        "quantity": 1,
        "price": 1097.8
      }
    ],
    "status": "Done",
    "id": "19517922844"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-12T10:55:40.494+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "payment": -3.29,
    "currency": "RUB",
    "status": "Done",
    "id": "137152251"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-11T11:21:49.241+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "quantity": 1,
    "quantityExecuted": 0,
    "price": 1.1E+3,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19494719531"
  },
  {
    "operationType": "BuyCard",
    "date": "2020-03-10T18:05:26.054+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S683W7",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 80.52,
    "payment": -805.2,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -2.42},
    "trades": [
      {
        "tradeId": "3117586463",
        "date": "2020-03-10T18:05:26.054+03:00",
        "quantity": 10,
        "price": 80.52
      }
    ],
    "status": "Done",
    "id": "19487355661"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-10T18:05:26.054+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S683W7",
    "payment": -2.42,
    "currency": "RUB",
    "status": "Done",
    "id": "135930157"
  },
  {
    "operationType": "PayIn",
    "date": "2020-03-10T18:05:25+03:00",
    "isMarginCall": false,
    "payment": 811.03,
    "currency": "RUB",
    "status": "Done",
    "id": "135711136"
  },
  {
    "operationType": "Buy",
    "date": "2020-03-10T18:04:59.312+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S684M6",
    "quantity": 10,
    "quantityExecuted": 10,
    "price": 325.15,
    "payment": -3251.5,
    "currency": "RUB",
    "commission": {"currency": "RUB", "value": -9.75},
    "trades": [
      {
        "tradeId": "3117582475",
        "date": "2020-03-10T18:04:59.312+03:00",
        "quantity": 10,
        "price": 325.15
      }
    ],
    "status": "Done",
    "id": "19487327150"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-10T18:04:59.312+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S684M6",
    "payment": -9.75,
    "currency": "RUB",
    "status": "Done",
    "id": "135935476"
  },
  {
    "operationType": "BuyCard",
    "date": "2020-03-10T18:02:43.353+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG000BNGBW9",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 3.31,
    "payment": -3.31,
    "currency": "USD",
    "commission": {"currency": "USD", "value": -0.01},
    "trades": [
      {
        "tradeId": "343735570",
        "date": "2020-03-10T18:02:43.353+03:00",
        "quantity": 1,
        "price": 3.31
      }
    ],
    "status": "Done",
    "id": "107041697120"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-10T18:02:43.353+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG000BNGBW9",
    "payment": -0.01,
    "currency": "USD",
    "status": "Done",
    "id": "135936779"
  },
  {
    "operationType": "PayIn",
    "date": "2020-03-10T18:02:42+03:00",
    "isMarginCall": false,
    "payment": 3.33,
    "currency": "USD",
    "status": "Done",
    "id": "135697533"
  },
  {
    "operationType": "BuyCard",
    "date": "2020-03-10T18:02:26.201+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG000BNGBW9",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 3.31,
    "payment": -3.31,
    "currency": "USD",
    "commission": {"currency": "USD", "value": -0.01},
    "trades": [
      {
        "tradeId": "343733780",
        "date": "2020-03-10T18:02:26.201+03:00",
        "quantity": 1,
        "price": 3.31
      }
    ],
    "status": "Done",
    "id": "107041414950"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-10T18:02:26.201+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG000BNGBW9",
    "payment": -0.01,
    "currency": "USD",
    "status": "Done",
    "id": "135933471"
  },
  {
    "operationType": "PayIn",
    "date": "2020-03-10T18:02:25+03:00",
    "isMarginCall": false,
    "payment": 3.33,
    "currency": "USD",
    "status": "Done",
    "id": "135692643"
  },
  {
    "operationType": "BuyCard",
    "date": "2020-03-10T17:32:54.853+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S683W7",
    "quantity": 10,
    "quantityExecuted": 0,
    "price": 82,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19485845943"
  },
  {
    "operationType": "PayIn",
    "date": "2020-03-10T17:32:54+03:00",
    "isMarginCall": false,
    "payment": 822.46,
    "currency": "RUB",
    "status": "Done",
    "id": "135646275"
  },
  {
    "operationType": "BuyCard",
    "date": "2020-03-10T17:32:19.221+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004S683W7",
    "quantity": 10,
    "quantityExecuted": 0,
    "price": 8E+1,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19485821024"
  },
  {
    "operationType": "PayIn",
    "date": "2020-03-10T17:32:18+03:00",
    "isMarginCall": false,
    "payment": 802.4,
    "currency": "RUB",
    "status": "Done",
    "id": "135655898"
  },
  {
    "operationType": "BuyCard",
    "date": "2020-03-10T12:30:18.322+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "quantity": 1,
    "quantityExecuted": 0,
    "price": 1E+3,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19470101718"
  },
  {
    "operationType": "PayIn",
    "date": "2020-03-10T12:30:17+03:00",
    "isMarginCall": false,
    "payment": 1003,
    "currency": "RUB",
    "status": "Done",
    "id": "135246141"
  },
  {
    "operationType": "BuyCard",
    "date": "2020-03-10T12:29:48.438+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG004730N88",
    "quantity": 10,
    "quantityExecuted": 0,
    "price": 1.9E+2,
    "payment": 0,
    "currency": "RUB",
    "status": "Decline",
    "id": "19470080784"
  },
  {
    "operationType": "PayIn",
    "date": "2020-03-10T12:29:47+03:00",
    "isMarginCall": false,
    "payment": 1905.7,
    "currency": "RUB",
    "status": "Done",
    "id": "135243814"
  },
  {
    "operationType": "BuyCard",
    "date": "2020-03-09T10:44:31.626+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "quantity": 1,
    "quantityExecuted": 1,
    "price": 16.82,
    "payment": -16.82,
    "currency": "USD",
    "commission": {"currency": "USD", "value": -0.05},
    "trades": [
      {
        "tradeId": "338016340",
        "date": "2020-03-09T10:44:31.626+03:00",
        "quantity": 1,
        "price": 16.82
      }
    ],
    "status": "Done",
    "id": "106175072290"
  },
  {
    "operationType": "BrokerCommission",
    "date": "2020-03-09T10:44:31.626+03:00",
    "isMarginCall": false,
    "instrumentType": "Stock",
    "figi": "BBG005DXJS36",
    "payment": -0.05,
    "currency": "USD",
    "status": "Done",
    "id": "134555038"
  },
  {
    "operationType": "PayIn",
    "date": "2020-03-09T10:44:31+03:00",
    "isMarginCall": false,
    "payment": 16.95,
    "currency": "USD",
    "status": "Done",
    "id": "134517197"
  }
];
