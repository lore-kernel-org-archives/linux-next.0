From: Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>
Subject: Re: linux-next: Tree for March 19 (wireless/p54)
Date: Thu, 19 Mar 2009 18:50:17 +0100
Message-ID: <200903191850.17825.mb@bu3sch.de>
References: <20090319221024.5e2ad6e5.sfr@canb.auug.org.au> <49C280BE.8090106@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49C280BE.8090106-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Thursday 19 March 2009 18:28:30 Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20090318:
> 
> 
> ERROR: "led_classdev_register" [drivers/net/wireless/p54/p54common.ko] undefined!
> ERROR: "led_classdev_unregister" [drivers/net/wireless/p54/p54common.ko] undefined!
> 
> One possible option (fix) is to have CONFIG_MAC80211_LEDS also select
> LEDS_CLASS (that would build the missing functions).

Does p54 select CONFIG_MAC80211_LEDS? If that's the case, I think it should
probably do it the other way around. p54 should build its LED code if CONFIG_MAC80211_LEDS
is available. Otherwise it should not.

This way you don't enter the SELECT dependency hell and still have automagic configuration.

Take a look at b43 for an example.

-- 
Greetings, Michael.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
