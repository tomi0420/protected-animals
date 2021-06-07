// if (location.pathname.match("animals/new",)){
//   document.addEventListener("DOMContentLoaded", () => {
//     const inputElement = document.getElementById("new_animal_kind_name");
//     inputElement.addEventListener("keyup", () => {
//       const keyword = inputElement.value;
//       const XHR = new XMLHttpRequest();
//       XHR.open("GET", `search/?keyword=${keyword}`, true);
//       XHR.responseType = "json";
//       XHR.send();
//       XHR.onload = () => {
//         let searchResult = document.getElementById("search-result");
//         searchResult.innerHTML = "";
//         if (XHR.response) {
//           const tagName = XHR.response.keyword;
//           tagName.forEach((tag) => {
//             // tag.forEach((tag) => {
//               const childElement = document.createElement("div");
//               childElement.setAttribute("class", "child");
//               childElement.setAttribute("id", tag.id);
//               childElement.innerHTML = tag.kind_name;
//               searchResult.appendChild(childElement);
//               const clickElement = document.getElementById(tag.id);
//               clickElement.addEventListener("click", () => {
//                 inputElement.value = clickElement.textContent;
//                 clickElement.remove();
//               });
//             // })
//           });
//         };
//       };
//     });
//   });
// };
