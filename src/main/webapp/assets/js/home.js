var sorted = []; // Biến toàn cục lưu trữ danh sách các phần tử đã được sắp xếp
var notSort = []; // Biến toàn cục lưu trữ danh sách các phần tử chưa được sắp xếp

$(document).ready(function() {
  notSort = document.querySelectorAll("div[id^='food-']"); // Lưu trữ danh sách ban đầu vào biến notSort
});

$(document).on("click", ".btn-cate", function() {
  let foodTypeID = $(this).data("food-type-id");

  if (sorted.length === 0) {
    // Nếu mảng sorted rỗng, đây là lần nhấn đầu tiên
    sorted = Array.from(notSort); // Sao chép danh sách chưa được sắp xếp vào sorted
    sorted.sort(function(a, b) {
      let aId = a.id.substring(5);
      let bId = b.id.substring(5);
      return aId.localeCompare(bId);
    });

    for (var i = 0; i < sorted.length; i++) {
      let idString = sorted[i].id;
      let idFood = idString.substring(5);
      if (idFood != foodTypeID) {
        sorted[i].style.display = 'none';
      } else {
        sorted[i].style.display = 'block';
      }
    }
  } else {
    // Nếu mảng sorted chứa các phần tử, đây là lần nhấn thứ hai
    for (var i = 0; i < notSort.length; i++) {
      notSort[i].style.display = 'block'; // Hiển thị tất cả các phần tử chưa được sắp xếp
    }
    sorted = []; // Xóa tất cả các phần tử đã được sắp xếp
  }
});


function searchFood() {
  var searchTerm = document.getElementById("btn-search").value.toLowerCase();
  var foodList = document.getElementById("foodList").querySelectorAll(".col-sm-6");

  for (var i = 0; i < foodList.length; i++) {
    var foodName = foodList[i].querySelector(".card-title").textContent.toLowerCase();
    var foodContainer = foodList[i];

    if (searchTerm === "") {
      foodContainer.style.display = "block"; // Hiển thị tất cả giá trị food nếu tìm kiếm rỗng
    } else {
      if (foodName.includes(searchTerm)) {
        foodContainer.style.display = "block"; // Hiển thị phần tử nếu tìm thấy kết quả
      } else {
        foodContainer.style.display = "none"; // Ẩn phần tử nếu không tìm thấy kết quả
      }
    }
  }
}


