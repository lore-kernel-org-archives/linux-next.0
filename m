From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: print_ssid undefined (linux-next 20081103)
Date: Mon, 3 Nov 2008 11:42:22 -0800
Message-ID: <20081103114222.b257f711.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

Hi,

I'm seeing a few instances of

ERROR: "print_ssid" [drivers/net/wireless/ipw2100.ko] undefined!

with ipw2100 & ipw2200 in today's linux-next (20081103).

These configs have
# CONFIG_WIRELESS is not set
CONFIG_WIRELESS_EXT=y

In looking into this more, I see that the wireless drivers can be enabled
& built even when CONFIG_WIRELESS=n.  Is this the expected behavior?
Seems a bit odd.

Thanks,
---
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
