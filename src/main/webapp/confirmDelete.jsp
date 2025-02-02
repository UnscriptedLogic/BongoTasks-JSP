<%--
  Created by IntelliJ IDEA.
  User: terry
  Date: 11/30/2022
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI"
        }

        body {
            color: white;
            display: flex;
            height: 100vh;
            justify-content: center;
            align-items: center;
            background: #0D1117;
            padding: 10px;
        }

        button {
            cursor: pointer;
        }

        .edit-bg {
            max-width: 500px;
            width: 100%;
            padding: 25px 30px;
            border-radius: 15px;
            background: #161B22;
            outline: 2px solid #30363d;
        }

        .delete-title {
            font-size: 25px;
            font-weight: 500;
            position: relative;
            text-align: center;
            padding: 0 0 20px 0;
        }

        .form-label {
            display: block;
            font-weight: 500;
            margin-bottom: 5px;
        }

        .form-input {
            height: 45px;
            width: 100%;
            outline: none;
            border-radius: 5px;
            border: 1px solid white;
            font-size: 16px;
            border-bottom-width: 2px;
            margin-bottom: 20px;
            padding: 10px;
            font-weight: 500;
        }

        .form-textarea {
            resize: none;
            height: 10em;
            font-weight: 500;
        }

        .form-buttons {
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;
            align-items: center;
        }

        .input-button {
            margin-top: 5px;
            height: 3em;
            width: 40%;
            outline: none;
            color: white;
            border: none;
            font-size: 20px;
            font-weight: 500;
            border-radius: 5px;
            letter-spacing: 1px;
            background-color: #30363d;
        }

        .cancel {
            /*outline: 2px solid #da3633;*/
            background-color: #da3633;
        }

        .confirm {
            /*outline: 2px solid #2e9f43;*/
            background-color: #2e9f43;
        }

        .taskdesc-section {
            padding: 0 0 30px 0;
        }

        .details-container {
            display: flex;
            flex-direction: column;
        }

        .solid {
            margin: 15px 0 15px 0;
            border: 1px solid #30363d;
        }

        .scale-up-center {
            -webkit-animation: scale-up-center 0.3s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
            animation: scale-up-center 0.3s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
        }

        @-webkit-keyframes scale-up-center {
            0% {
                -webkit-transform: scale(0.5);
                transform: scale(0.5);
            }
            100% {
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }

        @keyframes scale-up-center {
            0% {
                -webkit-transform: scale(0.5);
                transform: scale(0.5);
            }
            100% {
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }
    </style>
    <head>
        <link rel="icon" type="image/x-icon"
              href="https://cdn.discordapp.com/attachments/1033251577609342988/1049237421121880124/bongo-cat-drum.gif">
        <title>Deletion Confirmation</title>
    </head>
    <body>
        <div class="edit-bg">
            <form action="deleteTask" method="post">
                <div class="details-container">
                    <div class="delete-title">
                        Your task has been deleted successfully
                    </div>
                    <div class="form-buttons">
                        <button
                                id="confirm-delete-button"
                                class="input-button scale-up-center-slow"
                                type="button"
                                onclick="location.href='<%=request.getContextPath()%>/'"
                        >
                            Return to Task Dashboard
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
