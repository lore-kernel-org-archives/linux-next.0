From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Thu, 28 Aug 2008 13:55:14 +1000
Message-ID: <20080828135514.2d046f29.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33751 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753709AbYH1DzX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Aug 2008 23:55:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Jouni Malinen <jouni.malinen@atheros.com>, Jasper Bryant-Greene <jasper@amiton.co.nz>, "John W. Linville" <linville@tuxdriver.com>

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
net/mac80211/mlme.c between commit
087d833e5a9f67ba933cb32eaf5a2279c1a5b47c ("mac80211: Use IWEVASSOCREQIE
instead of IWEVCUSTOM") from the net-current tree and commit
f698d856f65c3fea091cc303a135967965c5b880 ("replace net_device arguments
with ieee80211_{local,sub_if_data} as appropriate") from the net tree.

The former moved some code that the latter modified.  I fixed it up
(see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc net/mac80211/mlme.c
index 9bb68c6,8499979..0000000
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@@ -475,24 -474,54 +474,24 @@@ int ieee80211_ht_addt_info_ie_to_ht_bss
  	return 0;
  }
  
- static void ieee80211_sta_send_associnfo(struct net_device *dev,
+ static void ieee80211_sta_send_associnfo(struct ieee80211_sub_if_data *sdata,
  					 struct ieee80211_if_sta *ifsta)
  {
 -	char *buf;
 -	size_t len;
 -	int i;
  	union iwreq_data wrqu;
  
 -	if (!ifsta->assocreq_ies && !ifsta->assocresp_ies)
 -		return;
 -
 -	buf = kmalloc(50 + 2 * (ifsta->assocreq_ies_len +
 -				ifsta->assocresp_ies_len), GFP_KERNEL);
 -	if (!buf)
 -		return;
 -
 -	len = sprintf(buf, "ASSOCINFO(");
  	if (ifsta->assocreq_ies) {
 -		len += sprintf(buf + len, "ReqIEs=");
 -		for (i = 0; i < ifsta->assocreq_ies_len; i++) {
 -			len += sprintf(buf + len, "%02x",
 -				       ifsta->assocreq_ies[i]);
 -		}
 +		memset(&wrqu, 0, sizeof(wrqu));
 +		wrqu.data.length = ifsta->assocreq_ies_len;
- 		wireless_send_event(dev, IWEVASSOCREQIE, &wrqu,
++		wireless_send_event(sdata->dev, IWEVASSOCREQIE, &wrqu,
 +				    ifsta->assocreq_ies);
  	}
 -	if (ifsta->assocresp_ies) {
 -		if (ifsta->assocreq_ies)
 -			len += sprintf(buf + len, " ");
 -		len += sprintf(buf + len, "RespIEs=");
 -		for (i = 0; i < ifsta->assocresp_ies_len; i++) {
 -			len += sprintf(buf + len, "%02x",
 -				       ifsta->assocresp_ies[i]);
 -		}
 -	}
 -	len += sprintf(buf + len, ")");
  
 -	if (len > IW_CUSTOM_MAX) {
 -		len = sprintf(buf, "ASSOCRESPIE=");
 -		for (i = 0; i < ifsta->assocresp_ies_len; i++) {
 -			len += sprintf(buf + len, "%02x",
 -				       ifsta->assocresp_ies[i]);
 -		}
 +	if (ifsta->assocresp_ies) {
 +		memset(&wrqu, 0, sizeof(wrqu));
 +		wrqu.data.length = ifsta->assocresp_ies_len;
- 		wireless_send_event(dev, IWEVASSOCRESPIE, &wrqu,
++		wireless_send_event(sdata->dev, IWEVASSOCRESPIE, &wrqu,
 +				    ifsta->assocresp_ies);
  	}
 -
 -	memset(&wrqu, 0, sizeof(wrqu));
 -	wrqu.data.length = len;
 -	wireless_send_event(sdata->dev, IWEVCUSTOM, &wrqu, buf);
 -
 -	kfree(buf);
  }
  
  
@@@ -2838,13 -2876,13 +2846,13 @@@ static void ieee80211_rx_bss_info(struc
  		       jiffies);
  #endif /* CONFIG_MAC80211_IBSS_DEBUG */
  		if (beacon_timestamp > rx_timestamp) {
 -#ifndef CONFIG_MAC80211_IBSS_DEBUG
 +#ifdef CONFIG_MAC80211_IBSS_DEBUG
  			printk(KERN_DEBUG "%s: beacon TSF higher than "
  			       "local TSF - IBSS merge with BSSID %s\n",
- 			       dev->name, print_mac(mac, mgmt->bssid));
+ 			       sdata->dev->name, print_mac(mac, mgmt->bssid));
  #endif
- 			ieee80211_sta_join_ibss(dev, &sdata->u.sta, bss);
- 			ieee80211_ibss_add_sta(dev, NULL,
+ 			ieee80211_sta_join_ibss(sdata, &sdata->u.sta, bss);
+ 			ieee80211_ibss_add_sta(sdata, NULL,
  					       mgmt->bssid, mgmt->sa,
  					       BIT(rx_status->rate_idx));
  		}
