window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  })

  const addTaxDom = document.getElementById("add-tax-price");
    priceInput.addEventListener("input", () => {
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1)
    console.log(addTaxDom.innerHTML);
  })




  const addProfitDom = document.getElementById("profit");
    priceInput.addEventListener("input", () => {
    addProfitDom.innerHTML = Math.floor(priceInput.value - priceInput.value * 0.1)
    console.log(addProfitDom.innerHTML);
  })
})

