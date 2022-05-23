﻿// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
$(document).ready(function () {

    // jQuery methods go here...

});

//$(document).ready(function () {
//    $("#submit").bind('click', function () {
//        var idiom = $("#add-category").val();
//        $.ajax({
//            type: "POST",
//            url: 'api/Categories',
//            data: { name: idiom },
//            async: true,
//            crossDomain: true,
//            beforeSend: function (request) {
//                request.withCredentials = false;
//            },
//            success: function (data, status, xhr) {
//                alert(xhr.getResponseHeader('Location'));
//            }
//        });

//    });
//});


const uri = 'api/Books';
let category = [];
let book = [];


function getBooks() {
    fetch('api/Books')
        .then(response => response.json())
        .then(data => _displayBook(data))
        .catch(error => console.error('Unable to get books.', error));
}

function addItem() {
    const addNameTextbox = document.getElementById('add-title');
    const addAuthorTextbox = document.getElementById('add-author');
    const addIsbnTextbox = document.getElementById('add-isbn');

    const item = {
        title: addNameTextbox.value.trim(),
        author: addAuthorTextbox.value.trim(),
        isbn: addIsbnTextbox.value.trim()
    };

    fetch(uri, {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
        },
        body: JSON.stringify(item),

    })
        .then(response => response.json())
        .then(() => {
            getBooks();
            addNameTextbox.value = '';
            addAuthorTextbox.value = '';
            addIsbnTextbox.value = '';
        })
        .catch(error => console.error('Unable to add book.', error));
}




function deleteBook(id) {
    fetch(`${uri}/${id}`, {
        method: 'DELETE'
    })
        .then(() => getBooks())
        .catch(error => console.error('Unable to delete item.', error));
}



function displayEditBook(id) {
    const item = book.find(item => item.Id === id);

    document.getElementById('edit-title').value = item.Title;
    document.getElementById('edit-author').value = item.Author;
    document.getElementById('edit-isbn').value = item.ISBN;
    document.getElementById('edit-id').value = item.Id;
    document.getElementById('editForm').style.display = 'block';
}



function updateBook() {
    const itemId = document.getElementById('edit-id').value;
    const item = {
        id: parseInt(itemId, 10),
        Title: document.getElementById('edit-title').value.trim(),
        Author: document.getElementById('edit-author').value.trim(),
        ISBN: document.getElementById('edit-isbn').value.trim(),
    };

    fetch(`${uri}/${itemId}`, {
        method: 'PUT',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(item)
    })
        .then(() => getBooks())
        .catch(error => console.error('Unable to update book.', error));

    closeInput();

    return false;
}

function closeInput() {
    document.getElementById('editForm').style.display = 'none';
}

function _displayCount(itemCount) {
    const name = (itemCount === 1) ? ' Book' : ' Books';

    document.getElementById('counter').innerText = `${itemCount} ${name}`;
}

function _displayBook(data) {
    const tBody = document.getElementById('bookTable');
    tBody.innerHTML = '';

    _displayCount(data.length);

    const button = document.createElement('button');

    data.forEach(item => {

        let editButton = button.cloneNode(false);
        editButton.innerText = 'Edit';
        editButton.setAttribute('onclick', `displayEditBook(${item.Id})`);

        let deleteButton = button.cloneNode(false);
        deleteButton.innerText = 'Delete';
        deleteButton.setAttribute('onclick', `deleteBook(${item.Id})`);

        let tr = tBody.insertRow();

        let td1 = tr.insertCell(0);
        let textNodeId = document.createTextNode(item.Id);
        td1.appendChild(textNodeId);

        let td2 = tr.insertCell(1);
        let textNode = document.createTextNode(item.Title);
        td2.appendChild(textNode);

        let td3 = tr.insertCell(2);
        let textNodeAuth = document.createTextNode(item.Author);
        td3.appendChild(textNodeAuth);

        let td4 = tr.insertCell(3);
        let textNodeIsbn = document.createTextNode(item.ISBN);
        td4.appendChild(textNodeIsbn);

        let td5 = tr.insertCell(4);
        td5.appendChild(editButton);

        let td6 = tr.insertCell(5);
        td6.appendChild(deleteButton);
    });

    book = data;
}

