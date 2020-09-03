[{assign var="blFirstTab" value=true}]

[{block name="details_tabs_longdescription"}]
    [{oxhasrights ident="SHOWLONGDESCRIPTION"}]
        [{assign var="oLongdesc" value=$oDetailsProduct->getLongDescription()}]
        [{if $oLongdesc->value}]
            [{capture append="tabs"}]<a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#description" data-toggle="tab">[{oxmultilang ident="DESCRIPTION"}]</a>[{/capture}]
            [{capture append="tabsContent"}]
                <div id="description" class="tab-pane[{if $blFirstTab}] active[{/if}]">
                    <div class="container-xxl">
                        [{oxeval var=$oLongdesc}]
                        [{if $oDetailsProduct->oxarticles__oxexturl->value}]
                            <a id="productExturl" class="js-external" href="[{$oDetailsProduct->oxarticles__oxexturl->value}]">
                            [{if $oDetailsProduct->oxarticles__oxurldesc->value}]
                                [{$oDetailsProduct->oxarticles__oxurldesc->value}]
                            [{else}]
                                [{$oDetailsProduct->oxarticles__oxexturl->value}]
                            [{/if}]
                            </a>
                        [{/if}]
                    </div>
                </div>
            [{/capture}]
            [{assign var="blFirstTab" value=false}]
        [{/if}]
    [{/oxhasrights}]
[{/block}]

[{block name="details_tabs_attributes"}]
    [{if $oView->getAttributes()}]
        [{capture append="tabs"}]<a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#attributes" data-toggle="tab">[{oxmultilang ident="SPECIFICATION"}]</a>[{/capture}]
        [{capture append="tabsContent"}]
            <div id="attributes" class="tab-pane[{if $blFirstTab}] active[{/if}]">
                <div class="container-xxl">
                    [{include file="page/details/inc/attributes.tpl"}]
                </div>
            </div>
            [{assign var="blFirstTab" value=false}]
        [{/capture}]
    [{/if}]
[{/block}]

[{block name="details_tabs_pricealarm"}]
    [{if $oView->isPriceAlarm() && !$oDetailsProduct->isParentNotBuyable()}]
        [{capture append="tabs"}]<a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#pricealarm" data-toggle="tab">[{oxmultilang ident="PRICE_ALERT"}]</a>[{/capture}]
        [{capture append="tabsContent"}]
            <div id="pricealarm" class="tab-pane[{if $blFirstTab}] active[{/if}]">
                <div class="container-xxl">
                    [{include file="form/pricealarm.tpl"}]
                </div>
            </div>
            [{assign var="blFirstTab" value=false}]
        [{/capture}]
    [{/if}]
[{/block}]

[{block name="details_tabs_tags"}]
[{/block}]

[{block name="details_tabs_media"}]
    [{if $oView->getMediaFiles() || $oDetailsProduct->oxarticles__oxfile->value}]
        [{capture append="tabs"}]<a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#media" data-toggle="tab">[{oxmultilang ident="MEDIA"}]</a>[{/capture}]
        [{capture append="tabsContent"}]
            <div id="media" class="tab-pane[{if $blFirstTab}] active[{/if}]">
                <div class="container-xxl">
                    [{include file="page/details/inc/media.tpl"}]
                </div>
            </div>
            [{assign var="blFirstTab" value=false}]
        [{/capture}]
    [{/if}]
[{/block}]

[{block name="details_tabs_comments"}]
[{/block}]

[{block name="details_tabs_invite"}]
[{/block}]

[{block name="details_tabs_main"}]
    [{if $tabs}]
        <div class="details-tabs">
            <ul class="nav nav-tabs justify-content-center">
                [{foreach from=$tabs item="tab" name="tabs"}]
                    <li class="nav-item">[{$tab}]</li>
                [{/foreach}]
                [{block name="details_tabs_social_navigation"}][{/block}]
            </ul>
            <div class="tab-content py-5">
                [{foreach from=$tabsContent item="tabContent" name="tabsContent"}]
                    [{$tabContent}]
                [{/foreach}]
                [{block name="details_tabs_social_content"}][{/block}]
            </div>
        </div>
    [{/if}]
[{/block}]

