window.addEventListener("DOMContentLoaded", () => {

  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  
  const form = document.getElementById("charge-form");
  
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const sendWithoutCardInfo = () => {
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    }
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
  
    const card = {
      number: formData.get("number"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
      cvc: formData.get("cvc"),
    };

    Payjp.createToken(card, (status, response) => {
      console.log(response.error)
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        sendWithoutCardInfo()
      } else {
        //window.alert('購入処理に失敗しました。\nお手数ですが最初からやり直してください。');
        sendWithoutCardInfo()
      }
    });
  });
});