From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] wireless: make WEXT_SPY and WEXT_PRIV select WEXT_CORE
Date: Wed, 7 Oct 2009 17:12:35 -0700
Message-ID: <20091007171235.d40f0cc2.randy.dunlap@oracle.com>
References: <20091007105720.a2457e5b.randy.dunlap@oracle.com>
	<1254949672-24022-1-git-send-email-linville@tuxdriver.com>
	<4ACD0E5A.7060106@oracle.com>
	<1254954842.3713.7.camel@johannes.local>
	<4ACD1C3D.3030506@oracle.com>
	<1254957256.3713.10.camel@johannes.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1254957256.3713.10.camel-YfaajirXv2244ywRPIzf9A@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Thu, 08 Oct 2009 01:14:16 +0200 Johannes Berg wrote:

> On Wed, 2009-10-07 at 15:54 -0700, Randy Dunlap wrote:
> 
> > > But they also select WIRELESS_EXT, which should cause WEXT_CORE to be
> > > turned on. Is it possible that is failing?
> > 
> > # CONFIG_WIRELESS is not set
> > CONFIG_WIRELESS_EXT=y
> > CONFIG_WEXT_SPY=y
> > CONFIG_WEXT_PRIV=y
> > 
> > WEXT_CORE is not enabled.  I haven't found the culprit, but I suspect "select".
> 
> Interesting.
> 
> > but what in WIRELESS_EXT would also cause WEXT_CORE to be enabled?
> 
> Well, the way WEXT_CORE is defined as def_bool y ought to, no?

Ah, I see what you mean.

Here's what's happening:

net/wireless/Kconfig says:

config WEXT_CORE
	def_bool y
	depends on CFG80211_WEXT || WIRELESS_EXT


and net/Kconfig says:

if WIRELESS

source "net/wireless/Kconfig"
source "net/mac80211/Kconfig"

endif # WIRELESS


so WEXT_CORE actually depends on NET && WIRELESS && (CFG80211_WEXT || WIRELESS_EXT)
(that's what xconfig shows me).
But WIRELESS is not enabled.  Pooh.

I was already toying with making CONFIG_WIRELESS a real/usable kconfig symbol.
That may have to be done unless someone else comes up with another solution.

---
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
