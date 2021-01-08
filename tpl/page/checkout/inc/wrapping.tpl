[{oxscript include="js/wrapping.min.js" priority=10}]

[{assign var="currency" value=$oView->getActCurrency()}]

<div class="modal fade gift-options" id="giftoptions" tabindex="-1" role="dialog" aria-labelledby="giftoptions_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                [{block name="checkout_wrapping_header"}]
                <span class="h4 modal-title float-start" id="giftoptions_modal_label">[{oxmultilang ident="GIFT_OPTION"}]</span>
                [{/block}]

                <button type="button" class="close float-end" data-bs-dismiss="modal" aria-hidden="true"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-4">
                        <img src="[{$oViewConf->getImageUrl('gift-wrapping.jpg')}]" alt="[{oxmultilang ident="ADD_WRAPPING"}]" class="img-thumbnail">
                    </div>
                    <div class="col-md-8">
                        <p>[{oxmultilang ident="WRAPPING_DESCRIPTION"}]</p>
                    </div>
                </div>

                [{block name="checkout_wrapping_contents"}]
                    <h3 class="page-header blockHead">[{oxmultilang ident="ADD_WRAPPING"}]</h3>

                    [{if !$oxcmp_basket->getProductsCount()}]
                        <div class="alert alert-danger">[{oxmultilang ident="BASKET_EMPTY"}]</div>
                    [{else}]
                        <form name="basket" action="[{$oViewConf->getSelfActionLink()}]" method="post"  id="giftoptions_modal_form">
                                [{$oViewConf->getHiddenSid()}]
                                <input type="hidden" name="cl" value="basket">
                                <input type="hidden" name="fnc" value="changewrapping">

                            [{assign var="oWrapList" value=$oView->getWrappingList()}]
                            [{if $oWrapList->count()}]
                                [{* basket items *}]
                                [{assign var="icounter" value="0"}]
                                [{assign var="basketitemlist" value=$oView->getBasketArticles()}]
                                [{foreach key=basketindex from=$oxcmp_basket->getContents() item=basketitem name=wrappArt}]
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="row">
                                            [{block name="checkout_wrapping_item"}]
                                                [{assign var="basketproduct" value=$basketitemlist.$basketindex}]

                                                <div class="col-4">
                                                    <img src="[{$basketproduct->getIconUrl()}]" alt="[{$basketitem->getTitle()|strip_tags}]" class="img-thumbnail img-fluid">
                                                </div>

                                                <div class="col-8">
                                                    <p class="lead">[{$basketitem->getTitle()}]</p>
                                                </div>

                                        </div>
                                        </div>
                                        <div class="card-body">
                                            <div id="wrapp_[{$smarty.foreach.wrappArt.iteration}]" class="row">
                                            <div class="col-12">
                                                <div class="row">
                                                <div class="col-3"></div>
                                                    <div class="col-9 offset-sm-3">
                                                        <div class="mb-3">
                                                            <div class="radio">
                                                                <label>
                                                                    <input class="radiobox" type="radio" name="wrapping[[{$basketindex}]]" id="wrapping_[{$basketindex}]" value="0" [{if !$basketitem->getWrappingId()}]CHECKED[{/if}]>
                                                                    [{oxmultilang ident="NONE"}] <strong>0,00 [{$currency->sign}]</strong>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            [{assign var="ictr" value="1"}]
                                            [{foreach from=$oView->getWrappingList() item=wrapping name=Wraps}]
                                                <div class="col-md-12">
                                                    [{if $wrapping->oxwrapping__oxpic->value}]
                                                    <div class="row">
                                                        <div class="col-3">
                                                            <img data-bs-target="wrapping_[{$wrapping->oxwrapping__oxid->value}]"  src="[{$wrapping->getPictureUrl()}]" alt="[{$wrapping->oxwrapping__oxname->value}]" class="img-thumbnail wrappingTargetImg">
                                                        </div>
                                                        <div class="col-9">
                                                    [{else}]
                                                        <div class="col-12">
                                                    [{/if}]
                                                            <div class="mb-3">
                                                                <div class="radio">
                                                                    <label>
                                                                        <input class="radiobox" type="radio" name="wrapping[[{$basketindex}]]" id="wrapping_[{$wrapping->oxwrapping__oxid->value}]" value="[{$wrapping->oxwrapping__oxid->value}]" [{if $basketitem->getWrappingId() == $wrapping->oxwrapping__oxid->value}]CHECKED[{/if}]>
                                                                        [{$wrapping->oxwrapping__oxname->value}] <strong>[{$wrapping->getFPrice()}] [{$currency->sign}]</strong>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                [{assign var="ictr" value="`$ictr+1`"}]
                                            [{/foreach}]
                                        </div>

                                                [{assign var="icounter" value="`$icounter+1`"}]
                                            [{/block}]
                                        </div>
                                        </div>
                                [{/foreach}]
                            [{/if}]

                            [{assign var="oCardList" value=$oView->getCardList()}]
                            [{if $oCardList->count()}]
                                [{block name="checkout_wrapping_cards"}]
                                    <h3 class="page-header blockHead">[{oxmultilang ident="GREETING_CARD"}]</h3>
                                    <div class="wrappingCard" id="wrappCard">
                                        <div class="card">
                                            <div class="card-header">
                                                <div class="row">
                                                    <div class="col-sm-9 offset-sm-3">
                                                        <div class="mb-3">
                                                            <div class="radio">
                                                                <label>
                                                                    <input type="radio" class="radiobox" name="chosencard" id="chosencard" value="0" [{if !$oxcmp_basket->getCardId()}]CHECKED[{/if}]> [{oxmultilang ident="NO_GREETING_CARD"}]
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        [{assign var="icounter" value="0"}]
                                        [{counter start=0 print=false}]
                                        [{assign var="icounter" value="0"}]
                                        [{foreach from=$oCardList item=card name=GreetCards}]
                                            <div class="card">
                                                <div class="card-header">
                                                    <div class="row">
                                                    [{if $card->oxwrapping__oxpic->value}]
                                                        <div class="col-3">
                                                            <img src="[{$card->getPictureUrl()}]" alt="[{$card->oxwrapping__oxname->value}]" class="img-thumbnail">
                                                        </div>
                                                        <div class="col-9">
                                                    [{else}]
                                                        <div class="col-12">
                                                    [{/if}]
                                                        <div class="mb-3">
                                                            <div class="radio">
                                                                <label>
                                                                    <input class="radiobox" type="radio" name="chosencard" id="chosen_[{$card->oxwrapping__oxid->value}]" value="[{$card->oxwrapping__oxid->value}]" [{if $oxcmp_basket->getCardId() == $card->oxwrapping__oxid->value}]CHECKED[{/if}]> [{$card->oxwrapping__oxname->value}] <strong>[{$card->getFPrice()}] [{$currency->sign}]</strong>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                                </div>
                                            [{assign var="icounter" value="`$icounter+1`"}]
                                        [{/foreach}]
                                    </div>

                                [{/block}]
                                [{block name="checkout_wrapping_comment"}]
                                    <div class="mb-3 wrappingComment">
                                        <label for="giftmessage" class="form-label">[{oxmultilang ident="GREETING_MESSAGE"}]</label>
                                        <textarea cols="102" rows="5" name="giftmessage" id="giftmessage" class="form-control">[{$oxcmp_basket->getCardMessage()}]</textarea>
                                    </div>
                                [{/block}]
                            [{/if}]
                        </form>
                    [{/if}]
                [{/block}]
            </div>
            <div class="modal-footer">
                [{block name="checkout_wrapping_submit"}]
                    <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">[{oxmultilang ident="CANCEL"}]</button>
                    <button type="submit" class="btn btn-primary" onclick="window.giftoptions_modal_form.submit();return false;">[{oxmultilang ident="APPLY"}]</button>
                [{/block}]
            </div>
        </div>
    </div>
</div>
