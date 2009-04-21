function display_adsense(client, slot, width, height, element_id) {
  var referrers = ["/search", "search.live.com", "ask.com", "images.google", "soso.com", "baidu"];

  if (!document.referrer.match(referrers))
    return;

  google_ad_client = client;
  google_ad_slot = slot;
  google_ad_width = width;
  google_ad_height = height;

   document.write('<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>');
}
