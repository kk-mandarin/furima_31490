window.addEventListener('load', function(){

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  

  const profitPrice = document.getElementById("profit");
    const taxValue = inputValue * 0.1;
    profitPrice.innerHTML = Math.floor(inputValue - taxValue);
})