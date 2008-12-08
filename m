From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree
Date: Mon, 8 Dec 2008 20:34:03 +1100
Message-ID: <20081208203403.320ea0bb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43933 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751368AbYLHJeJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Dec 2008 04:34:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Wang Chen <wangchen@cn.fujitsu.com>, "David S. Miller" <davem@davemloft.net>

Hi Greg,

Today's linux-next merge of the staging tree got a conflicts in
drivers/staging/wlan-ng/p80211netdev.c and
drivers/staging/wlan-ng/p80211wext.c between commit
979123d5343b4fdcd4c682745b8a0be9b8fac248 ("staging-p80211: Kill directly
reference of netdev->priv") from the net tree and various commits from
the staging tree.

I fixed it up (see below) and can carry the fixes as necessary. (In the
case of the second file, the latter removed the code that the former
modified.)

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/staging/wlan-ng/p80211netdev.c
index 2b705ea,0668471..0000000
--- a/drivers/staging/wlan-ng/p80211netdev.c
+++ b/drivers/staging/wlan-ng/p80211netdev.c
@@@ -696,8 -617,8 +617,8 @@@ static int p80211knetdev_do_ioctl(netde
  {
  	int			result = 0;
  	p80211ioctl_req_t	*req = (p80211ioctl_req_t*)ifr;
 -	wlandevice_t		*wlandev = (wlandevice_t*)dev->priv;
 +	wlandevice_t		*wlandev = dev->ml_priv;
- 	UINT8			*msgbuf;
+ 	u8			*msgbuf;
  	DBFENTER;
  
  	WLAN_LOG_DEBUG(2, "rx'd ioctl, cmd=%d, len=%d\n", cmd, req->len);
@@@ -833,7 -738,7 +738,7 @@@ static int p80211knetdev_set_mac_addres
  	resultcode->data = 0;
  
  	/* now fire the request */
- 	result = p80211req_dorequest(dev->ml_priv, (UINT8 *)&dot11req);
 -	result = p80211req_dorequest(dev->priv, (u8*)&dot11req);
++	result = p80211req_dorequest(dev->ml_priv, (u8*)&dot11req);
  
  	/* If the request wasn't successful, report an error and don't
  	 * change the netdev address
@@@ -914,10 -819,8 +819,8 @@@ int wlan_setup(wlandevice_t *wlandev
  		WLAN_LOG_ERROR("Failed to alloc netdev.\n");
  		result = 1;
  	} else {
- 		memset( dev, 0, sizeof(netdevice_t));
- 		ether_setup(dev);
  		wlandev->netdev = dev;
 -		dev->priv = wlandev;
 +		dev->ml_priv = wlandev;
  		dev->hard_start_xmit =	p80211knetdev_hard_start_xmit;
  		dev->get_stats =	p80211knetdev_get_stats;
  #ifdef HAVE_PRIVATE_IOCTL
@@@ -1416,78 -1192,9 +1192,9 @@@ static int p80211_rx_typedrop( wlandevi
  	return drop;
  }
  
- #ifdef CONFIG_HOTPLUG
- /* Notify userspace when a netdevice event occurs,
-  * by running '/sbin/hotplug net' with certain
-  * environment variables set.
-  */
- int p80211_run_sbin_hotplug(wlandevice_t *wlandev, char *action)
- {
-         char *argv[3], *envp[7], ifname[12 + IFNAMSIZ], action_str[32];
- 	char nsdname[32], wlan_wext[32];
-         int i;
- 
- 	if (wlandev) {
- 		sprintf(ifname, "INTERFACE=%s", wlandev->name);
- 		sprintf(nsdname, "NSDNAME=%s", wlandev->nsdname);
- 	} else {
- 		sprintf(ifname, "INTERFACE=null");
- 		sprintf(nsdname, "NSDNAME=null");
- 	}
- 
- 	sprintf(wlan_wext, "WLAN_WEXT=%s", wlan_wext_write ? "y" : "");
-         sprintf(action_str, "ACTION=%s", action);
- 
-         i = 0;
-         argv[i++] = hotplug_path;
-         argv[i++] = "wlan";
-         argv[i] = NULL;
- 
-         i = 0;
-         /* minimal command environment */
-         envp [i++] = "HOME=/";
-         envp [i++] = "PATH=/sbin:/bin:/usr/sbin:/usr/bin";
-         envp [i++] = ifname;
-         envp [i++] = action_str;
-         envp [i++] = nsdname;
-         envp [i++] = wlan_wext;
-         envp [i] = NULL;
- 
- #if (LINUX_VERSION_CODE < KERNEL_VERSION(2,5,62))
-         return call_usermodehelper(argv [0], argv, envp);
- #else
-         return call_usermodehelper(argv [0], argv, envp, 0);
- #endif
- }
- 
- #endif
- 
- 
- void    p80211_suspend(wlandevice_t *wlandev)
- {
- 	DBFENTER;
- 
- #ifdef CONFIG_HOTPLUG
- 	p80211_run_sbin_hotplug(wlandev, WLAN_HOTPLUG_SUSPEND);
- #endif
- 
- 	DBFEXIT;
- }
- 
- void    p80211_resume(wlandevice_t *wlandev)
- {
- 	DBFENTER;
- 
- #ifdef CONFIG_HOTPLUG
- 	p80211_run_sbin_hotplug(wlandev, WLAN_HOTPLUG_RESUME);
- #endif
- 
- 	DBFEXIT;
- }
- 
  static void p80211knetdev_tx_timeout( netdevice_t *netdev)
  {
 -	wlandevice_t	*wlandev = (wlandevice_t*)netdev->priv;
 +	wlandevice_t	*wlandev = netdev->ml_priv;
  	DBFENTER;
  
  	if (wlandev->tx_timeout) {
diff --cc drivers/staging/wlan-ng/p80211wext.c
index b2c9ea2,44d43e3..0000000
--- a/drivers/staging/wlan-ng/p80211wext.c
+++ b/drivers/staging/wlan-ng/p80211wext.c
