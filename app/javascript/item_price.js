window.addEventListener('load', () => {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const inputValue = itemPrice.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));


  const saleProfit = document.getElementById("profit"); 
    const value_result = inputValue * 0.1
    saleProfit.innerHTML = (Math.floor(inputValue * 0.9));
  })
});
