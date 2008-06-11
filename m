From: Ivo van Doorn <ivdoorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Rt2400-devel] next-20080611 rt2x00: build failure
Date: Wed, 11 Jun 2008 21:59:00 +0200
Message-ID: <200806112159.00779.IvDoorn@gmail.com>
References: <20080611100748.d35829f4.randy.dunlap@oracle.com> <200806112103.58517.IvDoorn@gmail.com> <20080611123245.4089f47b.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080611123245.4089f47b.randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: rt2400-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Wednesday 11 June 2008, Randy Dunlap wrote:
> On Wed, 11 Jun 2008 21:03:58 +0200 Ivo van Doorn wrote:
> 
> > On Wednesday 11 June 2008, John W. Linville wrote:
> > > On Wed, Jun 11, 2008 at 10:07:48AM -0700, Randy Dunlap wrote:
> > > > when CONFIG_INPUT=n and
> > > > # CONFIG_NEW_LEDS is not set
> > > > CONFIG_LEDS_CLASS=y
> > > > 
> > > > (full config attached)
> > > > 
> > > > vmlinux.o: In function `iwl_rfkill_unregister':
> > > > (.text+0x174cdc): undefined reference to `input_unregister_device'
> > > > vmlinux.o: In function `iwl_rfkill_init':
> > > > (.text+0x174d9f): undefined reference to `input_allocate_device'
> > > > vmlinux.o: In function `iwl_rfkill_init':
> > > > (.text+0x174e2d): undefined reference to `input_register_device'
> > > > vmlinux.o: In function `iwl_rfkill_init':
> > > > (.text+0x174e53): undefined reference to `input_free_device'
> > > > vmlinux.o: In function `rt2x00rfkill_allocate_polldev':
> > > > rt2x00rfkill.c:(.text+0x176dc4): undefined reference to `input_allocate_polled_device'
> > > > vmlinux.o: In function `rt2x00rfkill_poll':
> > > > rt2x00rfkill.c:(.text+0x176e8b): undefined reference to `input_event'
> > > > rt2x00rfkill.c:(.text+0x176e9f): undefined reference to `input_event'
> > > 
> > > <snip>
> > > 
> > > Ick, what a mess...
> > > 
> > > So what combination of depends and select of INPUT, INPUT_POLLDEV,
> > > and RFKILL_INPUT do we need to resolve this?
> > 
> > Well RFKILL_INPUT shouldn't be selected by a driver, in fact any driver that
> > selects or depends on RFKILL_INPUT is wrong. But selecting it only makes
> > matters worse since that will bypass the INPUT dependency.
> > When INPUT_POLLDEV is required I guess it is best to depend on INPUT and
> > select INPUT_POLLDEV.
> > 
> > iwlwifi is selecting RFKILL_INPUT and preferably they should drop the select
> > altogether (not replacing it with a depend), but since I am not sure about the
> > reason for the select
> 
> Yes, that easily causes a build failure.
> 
> > rt2x00 is selecting INPUT_POLLDEV but should depend on INPUT first (as done
> > in the patch in my previous mail).
> > 
> > b43 shouldn't really depend on RFKILL_INPUT but their Kconfig is correct and
> > shouldn't cause the above build failure.
> 
> Patch below fixes the RFKILL/INPUT build problems for me.  I haven't addresses
> the leds_* build problems yet.
> 
> 
> From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> 
> Config symbols that select RFKILL need to depend on INPUT so that
> undefined symbols are not used in the build.
> 
> This patch fixes the input_* symbols build errors.
> 
> (.text+0x174cdc): undefined reference to `input_unregister_device'
> (.text+0x174d9f): undefined reference to `input_allocate_device'
> (.text+0x174e2d): undefined reference to `input_register_device'
> (.text+0x174e53): undefined reference to `input_free_device'
> rt2x00rfkill.c:(.text+0x176dc4): undefined reference to `input_allocate_polled_device'
> rt2x00rfkill.c:(.text+0x176e8b): undefined reference to `input_event'
> rt2x00rfkill.c:(.text+0x176e9f): undefined reference to `input_event'
> (.text+0x176eca): undefined reference to `input_unregister_polled_device'
> (.text+0x176efc): undefined reference to `input_free_polled_device'
> (.text+0x176f37): undefined reference to `input_free_polled_device'
> (.text+0x176fd8): undefined reference to `input_register_polled_device'
> (.text+0x1772c0): undefined reference to `led_classdev_resume'
> (.text+0x1772d4): undefined reference to `led_classdev_resume'
> (.text+0x1772e8): undefined reference to `led_classdev_resume'
> (.text+0x17730a): undefined reference to `led_classdev_suspend'
> (.text+0x17731e): undefined reference to `led_classdev_suspend'
> (.text+0x17732f): undefined reference to `led_classdev_suspend'
> rt2x00leds.c:(.text+0x177348): undefined reference to `led_classdev_unregister'
> rt2x00leds.c:(.text+0x1773c0): undefined reference to `led_classdev_register'
> rfkill-input.c:(.text+0x209e4c): undefined reference to `input_close_device'
> rfkill-input.c:(.text+0x209e53): undefined reference to `input_unregister_handle'
> rfkill-input.c:(.text+0x209ea1): undefined reference to `input_register_handle'
> rfkill-input.c:(.text+0x209eae): undefined reference to `input_open_device'
> rfkill-input.c:(.text+0x209ebb): undefined reference to `input_unregister_handle'
> rfkill-input.c:(.init.text+0x17405): undefined reference to `input_register_handler'
> rfkill-input.c:(.exit.text+0x194f): undefined reference to `input_unregister_handler'
> make[1]: *** [vmlinux] Error 1
> 
> Signed-off-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/net/wireless/rt2x00/Kconfig |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> --- linux-next-20080611.orig/drivers/net/wireless/rt2x00/Kconfig
> +++ linux-next-20080611/drivers/net/wireless/rt2x00/Kconfig
> @@ -36,6 +36,7 @@ config RT2X00_LIB_FIRMWARE
>  config RT2X00_LIB_RFKILL
>  	boolean
>  	depends on RT2X00_LIB
> +	depends on INPUT
>  	select RFKILL
>  	select INPUT_POLLDEV
>  
> @@ -56,7 +57,7 @@ config RT2400PCI
>  
>  config RT2400PCI_RFKILL
>  	bool "Ralink rt2400 rfkill support"
> -	depends on RT2400PCI
> +	depends on RT2400PCI && INPUT
>  	select RT2X00_LIB_RFKILL
>  	---help---
>  	  This adds support for integrated rt2400 hardware that features a
> @@ -84,7 +85,7 @@ config RT2500PCI
>  
>  config RT2500PCI_RFKILL
>  	bool "Ralink rt2500 rfkill support"
> -	depends on RT2500PCI
> +	depends on RT2500PCI && INPUT
>  	select RT2X00_LIB_RFKILL
>  	---help---
>  	  This adds support for integrated rt2500 hardware that features a

Could you include the RT61PCI_RFKILL change as well?
After that you can add:

Acked-by: Ivo van Doorn <IvDoorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Ivo


--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
