[{*oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"*}]

<form class="max-600" action="[{$oViewConf->getSslSelfLink()}]" name="order" method="post" novalidate>
        [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="registeruser">
        <input type="hidden" name="cl" value="register">
        <input type="hidden" name="lgn_cook" value="0">
        <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
        <input type="hidden" name="option" value="3">

    <h3 class="blockHead">[{oxmultilang ident="ACCOUNT_INFORMATION"}]</h3>
    [{include file="form/fieldset/user_account.tpl"}]

    [{if $oView->isActive('PsLogin')}]
        <div class="mb-3 row">
            <label>[{oxmultilang ident="TERMS_AND_CONDITIONS"}]</label>
            <input type="hidden" name="ord_agb" value="0">
            <div class="checkbox">
                <label>
                    <input id="orderConfirmAgbBottom" type="checkbox" class="checkbox" name="ord_agb" value="1">
                    [{oxifcontent ident="oxagb" object="oCont"}]
                        [{oxmultilang ident="FORM_REGISTER_IAGREETOTERMS1"}]
                            <a href="#" data-toggle="modal" data-target="#popup1">[{oxmultilang ident="TERMS_AND_CONDITIONS"}]</a>
                        [{oxmultilang ident="FORM_REGISTER_IAGREETOTERMS3"}],&nbsp;
                    [{/oxifcontent}]
                    [{oxifcontent ident="oxrightofwithdrawal" object="oCont"}]
                        [{oxmultilang ident="FORM_REGISTER_IAGREETORIGHTOFWITHDRAWAL1"}]
                            <a href="#" data-toggle="modal" data-target="#popup2">[{$oCont->oxcontents__oxtitle->value}]</a>
                        [{oxmultilang ident="FORM_REGISTER_IAGREETORIGHTOFWITHDRAWAL3"}]
                    [{/oxifcontent}]
                </label>
            </div>
        </div>
    [{/if}]

    <h3 class="blockHead">[{oxmultilang ident="BILLING_ADDRESS"}]</h3>
    [{include file="form/fieldset/user_billing.tpl"}]
</form>
[{if $oView->isActive('PsLogin')}]
    [{oxifcontent ident="oxagb" object="oContent"}]
        <div class="modal fade" id="popup1" tabindex="-1" role="dialog" aria-labelledby="popup1Label" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <span class="h4 modal-title" id="popup1Label">[{$oContent->oxcontents__oxtitle->value}]</span>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">[{$oContent->oxcontents__oxcontent->value}]</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">[{oxmultilang ident="CLOSE"}]</button>
                    </div>
                </div>
            </div>
        </div>
    [{/oxifcontent}]

    [{oxifcontent ident="oxrightofwithdrawal" object="oContent"}]
        <div class="modal fade" id="popup2" tabindex="-1" role="dialog" aria-labelledby="popup2Label" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <span class="h4 modal-title" id="popup2Label">[{$oContent->oxcontents__oxtitle->value}]</span>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">[{$oContent->oxcontents__oxcontent->value}]</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">[{oxmultilang ident="CLOSE"}]</button>
                    </div>
                </div>
            </div>
        </div>
    [{/oxifcontent}]
[{/if}]
