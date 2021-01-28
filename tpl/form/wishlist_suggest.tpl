<div class="wishlistSuggest">
    [{if $oView->getWishList() && $oView->showSuggest()}]
        [{if $Errors.account_whishlist|is_array && !empty($Errors.account_whishlist)}]
            [{foreach from=$Errors.account_whishlist item=oEr key=key}]
                <p class="alert alert-danger">[{$oEr->getOxMessage()}]</p>
            [{/foreach}]
        [{/if}]
        [{assign var="editval" value=$oView->getEnteredData()}]
        <form action="[{$oViewConf->getSelfActionLink()}]" method="post" class="max-600">
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="fnc" value="sendwishlist">
            <input type="hidden" name="cl" value="account_wishlist">
            <input type="hidden" name="blshowsuggest" value="1">
            <input type="hidden" name="editval[send_subject]" value="[{oxmultilang ident="GIFT_REGISTRY_OF"}] [{$oxcmp_shop->oxshops__oxname->value}]">
            <input type="hidden" name="CustomError" value='account_whishlist'>
            <span class="lead">[{oxmultilang ident="SEND_GIFT_REGISTRY"}]</span>

            <div class="mb-3 form-floating">
                <input type="text" id="editval[rec_name]" name="editval[rec_name]" class="form-control" maxlength="70" value="[{$editval->rec_name}]">
                <label for="editval[rec_name]">[{oxmultilang ident="RECIPIENT_NAME"}]</label>
            </div>
            <div class="mb-3 form-floating">
                <input type="email" id="editval[rec_email]" name="editval[rec_email]" class="form-control" maxlength="70" value="[{$editval->rec_email}]">
                <label for="editval[rec_email]">[{oxmultilang ident="RECIPIENT_EMAIL"}]</label>
            </div>
            <div class="mb-3 form-floating">
                <textarea rows="6" class="form-control" id="editval[send_message]" name="editval[send_message]">[{if $editval->send_message}][{$editval->send_message}][{else}][{oxmultilang ident="SHOP_SUGGEST_BUY_FOR_ME" args=$oxcmp_shop->oxshops__oxname->value}][{/if}]</textarea>
                <label for="editval[send_message]">[{oxmultilang ident="MESSAGE"}]</label>
            </div>
            <div class="mb-3">
                <button class="btn btn-primary" type="submit">[{oxmultilang ident="SUBMIT"}]</button>
            </div>
        </form>
    [{/if}]
</div>
