From: reinette chatre <reinette.chatre-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-next: Tree for February 2 (iwlwifi)
Date: Mon, 02 Feb 2009 12:45:23 -0800
Message-ID: <1233607523.2411.174.camel@rc-desk>
References: <20090202201637.28896d2f.sfr@canb.auug.org.au>
	 <20090202103401.a189e8e0.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090202103401.a189e8e0.randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2009-02-02 at 10:34 -0800, Randy Dunlap wrote:
> On Mon, 2 Feb 2009 20:16:37 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> >
> > Changes since 20090126:
> 
> 
> a.  optional drivers such as iwlwifi should not default to 'y':
> 
> config IWLWIFI
>         bool "Intel Wireless Wifi"
>         depends on PCI && MAC80211 && WLAN_80211 && EXPERIMENTAL
>         default y

will fix.

> 
> b.  Are there cases where IWLCORE is not needed?  I.e., why is it
> even a kconfig option?

indeed ... now that 3945 depends on IWLCORE also we could replace
IWLWIFI with it because IWLWIFI is not used in code ... we will have to
see if this is possible.

> 
> 
> c.  The attached config causes beaucoup build errors with:
> CONFIG_IWLWIFI=y
> # CONFIG_IWLCORE is not set
> # CONFIG_IWLAGN is not set
> CONFIG_IWL3945=y
> # CONFIG_IWL3945_SPECTRUM_MEASUREMENT is not set
> CONFIG_IWL3945_LEDS=y

3945 is being ported to iwlwifi and we neglected to change Kconfig to
reflect this. We will fix it.

Thank you very much for this report.

Reinette


--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
