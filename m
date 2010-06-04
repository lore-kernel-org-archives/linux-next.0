From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: Tree for June 4 (mac80211)
Date: Fri, 4 Jun 2010 09:56:51 -0700
Message-ID: <20100604095651.5f59119e.randy.dunlap@oracle.com>
References: <20100604153006.fa15c770.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100604153006.fa15c770.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Fri, 4 Jun 2010 15:30:06 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100603:
> 
> My fixes tree contains:
>       v4l-dvb: update gfp/slab.h includes
>       arm: update gfp/slab.h includes
>       davinci: update gfp/slab.h includes
>       ocfs2: update gfp/slab.h includes
>       acpi: update gfp/slab.h includes
> 
> The wireless tree gained a conflict against the net tree.
> 
> The rr tree gained a build failure for which I applied a patch.


when CONFIG_INET is not enabled:


ERROR: "register_inetaddr_notifier" [net/mac80211/mac80211.ko] undefined!
ERROR: "unregister_inetaddr_notifier" [net/mac80211/mac80211.ko] undefined!

or

(.text+0xb9585): undefined reference to `unregister_inetaddr_notifier'
(.text+0xb9b84): undefined reference to `register_inetaddr_notifier'


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
