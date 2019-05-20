<form class="col-lg-7">
            <input type="hidden" id="result_url"      name="result_url"     value="{$result_url|escape}"/>
            <input type="hidden" id="data"            name="data"           value="{$data|escape}"/>
            <input type="hidden" id="accountId"       name="accountId"      value="{$accountId|escape}"/>
            <input type="hidden" id="publicId"        name="publicId"       value="{$publicId|escape}"/>
            <input type="hidden" id="amount"          name="amount"         value="{$amount|escape}"/>
            <input type="hidden" id="currency"        name="currency"       value="{$currency|escape}"/>
            <input type="hidden" id="description"     name="description"    value="{$description|escape}"/>
            <input type="hidden" id="order_id"        name="invoiceId"      value="{$order_id|escape}"/>
            <input type="hidden" id="email"           name="email"          value="{$email|escape}"/>
            <input type="hidden" id="language"        name="language"       value="{$language|escape}"/>
            <input type="hidden" id="skin"            name="skin"           value="{$skin|escape}"/>
            <input type="button" class="button"       onclick="payHandler()"   value="{$lang->form_to_pay}"/>
        </form>
        {literal}
        <script src="https://widget.cloudpayments.ru/bundles/cloudpayments"></script>
        <script>
            var payHandler = function ()
            {
                //чек
                var data = $('#data').val();
                data = JSON.parse(data);
                //виджет
                var widget = new cp.CloudPayments
                (
                    {   //локализация виджета
                        language: $('#language').val()
                    }
                );
                widget.charge
                (
                    { // параметры виджета
                        publicId:    $('#publicId').val(),//id из личного кабинета
                        description: $('#description').val(),//назначение
                        amount:      parseFloat($('#amount').val()), //сумма
                        currency:    $('#currency').val(), //валюта
                        invoiceId:   $('#order_id').val(), //номер заказа  (необязательно)
                        accountId:   $('#accountId').val(), //идентификатор плательщика (необязательно)
                        skin:        $('#skin').val(), //дизайн
                        email:       $('#email').val(), //почта (необязательно)
                        data:        data//чек
                    },
                    '{}',//действие при успешной оплате
                    '{}'//действие при неуспешной оплате
                );
            };
        </script>
        {/literal}