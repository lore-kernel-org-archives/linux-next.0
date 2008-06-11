From: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Subject: Re: next-20080611 rt2x00: build failure
Date: Wed, 11 Jun 2008 14:10:00 -0400
Message-ID: <20080611181000.GA32331@tuxdriver.com>
References: <20080611100748.d35829f4.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080611100748.d35829f4.randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rt2400-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Wed, Jun 11, 2008 at 10:07:48AM -0700, Randy Dunlap wrote:
> when CONFIG_INPUT=n and
> # CONFIG_NEW_LEDS is not set
> CONFIG_LEDS_CLASS=y
> 
> (full config attached)
> 
> vmlinux.o: In function `iwl_rfkill_unregister':
> (.text+0x174cdc): undefined reference to `input_unregister_device'
> vmlinux.o: In function `iwl_rfkill_init':
> (.text+0x174d9f): undefined reference to `input_allocate_device'
> vmlinux.o: In function `iwl_rfkill_init':
> (.text+0x174e2d): undefined reference to `input_register_device'
> vmlinux.o: In function `iwl_rfkill_init':
> (.text+0x174e53): undefined reference to `input_free_device'
> vmlinux.o: In function `rt2x00rfkill_allocate_polldev':
> rt2x00rfkill.c:(.text+0x176dc4): undefined reference to `input_allocate_polled_device'
> vmlinux.o: In function `rt2x00rfkill_poll':
> rt2x00rfkill.c:(.text+0x176e8b): undefined reference to `input_event'
> rt2x00rfkill.c:(.text+0x176e9f): undefined reference to `input_event'

<snip>

Ick, what a mess...

So what combination of depends and select of INPUT, INPUT_POLLDEV,
and RFKILL_INPUT do we need to resolve this?

-- 
John W. Linville
linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
