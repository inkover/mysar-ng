<nobr>[
<a href="{$smarty.server.PHP_SELF}?a=IPSitesSummary&date={$pageVars.date}&hostiplong={$pageVars.hostiplong}&usersID={$pageVars.usersID}">&lt;&lt;&lt; Статистика посещений для Хостов и Пользователей за день</a>
|
<a href="{$pageVars.uri}">Обновить страницу</a>
]</nobr>

<div class="table-responsive"><table class="table table-condensed"><tr><th style="font-size: 20px";>Статистика посещений для Хостов, Пользователей по Датам</th></tr></table></div>
<p>
<div class="table-responsive"><table class="table table-condensed"><tr><td style="font-size: 20px;">{$pageVars.thisDateFormatted}</td></tr></table></div>
<p>
<div class="table-responsive"><table class="table table-condensed">
  <tr><td>Имя Хоста</td><td style="text-align:left;">{$pageVars.host.hostname}</td></tr>
  <tr><td>IP-адрес Хоста</td><td style="text-align:left;">{$pageVars.host.ip}</td></tr>
  <tr><td>Описание Хоста</td><td style="text-align:left;">{$pageVars.host.description}</td></tr>
  <tr><td>Имя пользователя Squid</td><td style="text-align:left;">{$pageVars.user.authuser}</tr>
  <tr><td>Сайт</td><td style="text-align:left;"><a href="{$pageVars.site}" target="_blank">{$pageVars.site}</a></tr>
</table></div>
<p>
      [
        <a href="{$smarty.server.PHP_SELF}?a={$pageVars.thisPage}&action=setDefaultView&OrderMethod={$pageVars.orderMethod}&OrderBy={$pageVars.orderBy}&ByteUnit={$pageVars.byteUnit}&date={$pageVars.date}&ipID={$pageVars.ipID}&siteID={$pageVars.siteID}">
          Установить вид по-умолчанию
        </a>
      ]
  <div class="table-responsive"><table class="table table-condensed">
    <tr>
      <th>
        <a href="{$smarty.server.PHP_SELF}?{$pageVars.url.timeASC}"><img border="{$pageVars.timeASCImageBorder}" src="images/up-arrow.gif"></a>
          {$pageVars.timeLabelStart}Время{$pageVars.timeLabelEnd}
        <a href="{$smarty.server.PHP_SELF}?{$pageVars.url.timeDESC}"><img border="{$pageVars.timeDESCImageBorder}" src="images/down-arrow.gif"></a>
      </th>
      <th width="110">
        <a href="{$smarty.server.PHP_SELF}?{$pageVars.url.bytesASC}"><img border="{$pageVars.bytesASCImageBorder}" src="images/up-arrow.gif"></a>
          {$pageVars.bytesLabelStart}Объем{$pageVars.bytesLabelEnd}
        <a href="{$smarty.server.PHP_SELF}?{$pageVars.url.bytesDESC}"><img border="{$pageVars.bytesDESCImageBorder}" src="images/down-arrow.gif"></a>
        <br>
        <a href="{$smarty.server.PHP_SELF}?{$pageVars.url.B}">{$pageVars.BLabelStart}B{$pageVars.BLabelEnd}</a>
        |
        <a href="{$smarty.server.PHP_SELF}?{$pageVars.url.K}">{$pageVars.KLabelStart}K{$pageVars.KLabelEnd}</a>
        |
        <a href="{$smarty.server.PHP_SELF}?{$pageVars.url.M}">{$pageVars.MLabelStart}M{$pageVars.MLabelEnd}</a>
        |
        <a href="{$smarty.server.PHP_SELF}?{$pageVars.url.G}">{$pageVars.GLabelStart}G{$pageVars.GLabelEnd}</a>
      </th>
      <th>
        <a href="{$smarty.server.PHP_SELF}?{$pageVars.url.urlASC}"><img border="{$pageVars.urlASCImageBorder}" src="images/up-arrow.gif"></a>
          {$pageVars.urlLabelStart}URL{$pageVars.urlLabelEnd}
        <a href="{$smarty.server.PHP_SELF}?{$pageVars.url.urlDESC}"><img border="{$pageVars.urlDESCImageBorder}" src="images/down-arrow.gif"></a>
      </th>
      <th>
        <a href="{$smarty.server.PHP_SELF}?{$pageVars.url.statusASC}"><img border="{$pageVars.statusASCImageBorder}" src="images/up-arrow.gif"></a>
          {$pageVars.statusLabelStart}Статус{$pageVars.statusLabelEnd}
        <a href="{$smarty.server.PHP_SELF}?{$pageVars.url.statusDESC}"><img border="{$pageVars.statusDESCImageBorder}" src="images/down-arrow.gif"></a>
      </th>
    </tr>
  {foreach from=$pageVars.siteDetails item=record}
  <tr onMouseOver="this.bgColor='#C5D3E7';" onMouseOut="this.bgColor='#DAE3F0';">
    <td>{$record.time}</td>
    <td>{$record.bytes|bytesToHRF:$pageVars.byteUnit}</td>
    <td style="text-align: left;"><a href="{$record.url}">{$record.url|string_trim:80:"..."}</a></td>
    <td style="text-align: left;">{$record.resultCode}</td>
  </tr>
  {/foreach}
  </table></div>
