From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] wireless: make WEXT_SPY and WEXT_PRIV select WEXT_CORE
Date: Fri, 9 Oct 2009 09:32:02 -0700
Message-ID: <20091009163202.GA3342@suse.de>
References: <4ACD0E5A.7060106@oracle.com>
 <1254954842.3713.7.camel@johannes.local>
 <4ACD1C3D.3030506@oracle.com>
 <1254957256.3713.10.camel@johannes.local>
 <20091007171235.d40f0cc2.randy.dunlap@oracle.com>
 <1254995282.3713.18.camel@johannes.local>
 <20091008080615.09c8b803.randy.dunlap@oracle.com>
 <1255026563.3713.28.camel@johannes.local>
 <20091009090601.73de5dc6.randy.dunlap@oracle.com>
 <1255104846.4095.2.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1255104846.4095.2.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Fri, Oct 09, 2009 at 06:14:06PM +0200, Johannes Berg wrote:
> On Fri, 2009-10-09 at 09:06 -0700, Randy Dunlap wrote:
> 
> > >  menuconfig WLAN
> > >  	bool "Wireless LAN"
> > >  	depends on !S390
> > > +	select WIRELESS
> > >  	default y
> > >  	---help---
> > >  	  This section contains all the pre 802.11 and 802.11 wireless
> > 
> > 
> > I suppose that's OK, although I prefer "depends" rather than "select".
> 
> I tend to as well, but in this case the WIRELESS itself is just an
> option that makes other options invisible, it's not used elsewhere, and
> as such I think this is ok -- why hide the wireless drivers unless the
> user first selects the wireless core options?
> 
> OTOH, you already need to select cfg80211/mac80211 for most drivers, so
> I suppose "depends on WIRELESS" would be ok too.
> 
> > I tracked down one of the problems that I was seeing:
> > 
> > net/wireless/wext-priv.c:206: error: implicit declaration of function 'call_commit_handler'
> > 
> > with:
> > # CONFIG_WIRELESS is not set
> > CONFIG_WIRELESS_EXT=y
> > CONFIG_WEXT_PRIV=y
> > 
> > This is being caused by several drivers in drivers/staging/ doing
> > 	select WEXT_PRIV
> > without using either enough dependencies or even more (ugly) selects.
> > (or just because kconfig isn't sufficient)
> 
> Hah, staging/, well, that's kinda hard to solve I guess. Except by
> fixing all the staging/ drivers to depend on WIRELESS too, like the
> patch would do for the regular drivers.

That's fine, I'll gladly take patches to do that.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
