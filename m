From: Ivo van Doorn <ivdoorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Rt2400-devel] next-20080611 rt2x00: build failure
Date: Wed, 11 Jun 2008 20:21:42 +0200
Message-ID: <200806112021.43707.IvDoorn@gmail.com>
References: <20080611100748.d35829f4.randy.dunlap@oracle.com> <200806111948.49976.IvDoorn@gmail.com> <32664704.1213206386295.JavaMail.oracle@acsmt301.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <32664704.1213206386295.JavaMail.oracle-s5rVz5nKm9nKpDp+h9PlwkEOCMrvLtNR@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: rt2400-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Wednesday 11 June 2008, Randy Dunlap wrote:
> --- Original Message ---
> > > when CONFIG_INPUT=n and
> > > # CONFIG_NEW_LEDS is not set
> > > CONFIG_LEDS_CLASS=y
> > 
> > Does below patch help?
> 
> Nope, sorry, same build errors.

Ok this is odd, there is something very strange happening,
the relevant options in your config are:

CONFIG_RFKILL=y
CONFIG_RFKILL_INPUT=y
# CONFIG_INPUT is not set
CONFIG_INPUT_POLLDEV=y
CONFIG_RT2X00_LIB_RFKILL=y

>From net/rfkill/Kconfig:

config RFKILL_INPUT
	tristate "Input layer to RF switch connector"
	depends on RFKILL && INPUT

So RFKILL_INPUT shouldn't not be enabled because it has
a clear dependency on the CONFIG_INPUT option.

>From drivers/net/wireless/rt2x00/Kconfig
config RT2X00_LIB_RFKILL
	boolean
	depends on RT2X00_LIB
	select RFKILL
	select INPUT_POLLDEV

This doesn't mean that the rt2x00 behavior of selecting
CONFIG_INPUT_POLLDEV without dependencies on
CONFIG_INPUT was correct. But more that there is
a secondary bug elsewhere as well, and that is the one
which is causing the build failure now.. :S

Anybody with additional ideas? :)

Ivo
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
