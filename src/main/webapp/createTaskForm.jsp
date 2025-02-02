<%--
  Created by IntelliJ IDEA.
  User: putty
  Date: 30/11/2022
  Time: 4:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Create a Task</title>
        <link rel="icon" type="image/x-icon"
              href="https://cdn.discordapp.com/attachments/1033251577609342988/1049237421121880124/bongo-cat-drum.gif">
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
                filter: drop-shadow(0 0 6px black);
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
                border: 1px solid #2f2f2f;
                font-size: 16px;
                border-bottom-width: 2px;
                margin-bottom: 20px;
                padding: 10px;
                font-weight: 500;
                background-color: #30363d;
                color: white;
                box-shadow: inset 0 0 5px #252525;
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
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="edit-bg scale-up-center">
            <form action="TaskServlet/addTask" method="post" autocomplete="off">
                <div class="delete-title">
                    Add Task
                </div>
                <div>
                    <label class="form-label">Name</label>
                    <input id="task-name-field" name="taskName" class="form-input" placeholder="e.g. 'Buy Milk'">
                </div>
                <div>
                    <label class="form-label">Description</label>
                    <textarea id="task-desc-field" name="taskDesc" class="form-input form-textarea"
                              placeholder="e.g. 'Go to UnfairPrice buy milk and come back home'"></textarea>
                </div>
                <div class="form-buttons">
                    <button
                            class="input-button cancel"
                            type="button"
                            onclick="location.href='<%=request.getContextPath()%>/'"

                    >
                        <i class="fa fa-ban"></i> Cancel
                    </button>
                    <button
                            id="submit-button"
                            class="input-button confirm"
                            type="submit"
                    >
                        <i class="fa fa-check"></i> Confirm
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>
