<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="utf-8">
        <title>英単語のテスト</title>
        <style type="text/css">
            html, body {
                margin: 0px;
                width: 100%;
            }

            body {
                background-color: white;
            }

            .window {
                margin: auto;
                max-width: 800px;
                text-align: center;
            }

            input[type="radio"] {
                display: none;
            }

            label {
                display: inline-block;
                width: 300px;
                line-height: 50px;
                padding: auto;
                text-align: center;
                background-color: whitesmoke;
                color: black;
                border-radius: 8px;
                margin: 0px;
                margin-bottom: 8px;
                transition: all 0.2s ease;
            }

            label:last-child {
                margin-bottom: 0px;
            }

            input[type="radio"]:checked + label {
                background-color: yellowgreen;
                color: white;
            }

            button {
                line-height: 40px;
                width: 146px;
                padding: 0px 16px;
                background-color: transparent;
                color: black;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                margin: 4px;
            }

            button:focus {
                outline: 0;
            }
        </style>
        <script>
            function answer() {
                var value = document.forms[0].data.value;
                console.log(document.forms[0].data.value);
                var datas = [["{{datas[0][0]}}", "{{datas[0][1]}}"],
                    ["{{datas[1][0]}}", "{{datas[1][1]}}"],
                    ["{{datas[2][0]}}", "{{datas[2][1]}}"]];
                if (value == "") {
                    console.log("選んでください")
                } else if ("{{word}}" == datas[value][0]) {
                    console.log("正解！！")
                } else {
                    console.log("不正解")
                }
            }
        </script>
    </head>
    <body>
        <div class="window">
            <h1>英単語のテスト</h1>
            <p id="text">{{word}}の意味は？</p>
            <form>
                <input type="radio" name="data" id="data0" value="0">
                <label for="data0">{{datas[0][1]}}</label><br>
                <input type="radio" name="data" id="data1" value="1">
                <label for="data1">{{datas[1][1]}}</label><br>
                <input type="radio" name="data" id="data2" value="2">
                <label for="data2">{{datas[2][1]}}</label><br>
            </form>
            <button onclick="answer();">回答</button><button onclick="location.href = '/test';">次の問題</button>
        </div>
    </body>
</html>