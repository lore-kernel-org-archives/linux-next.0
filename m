From: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Subject: Re: linux-next: Tree for April 24 (p54 build error) (and pull
	request: wireless-next-2.6 2009-04-24)
Date: Thu, 30 Apr 2009 14:30:51 -0400
Message-ID: <20090430183051.GC9323@tuxdriver.com>
References: <20090424150456.ff35e4ea.sfr@canb.auug.org.au> <49F1FD4B.2020909@oracle.com> <200904242247.15042.chunkeey@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <200904242247.15042.chunkeey-S0/GAf8tV78@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Lamparter <chunkeey-S0/GAf8tV78@public.gmane.org>
Cc: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: linux-next.vger.kernel.org

If you want patches to be noticed and applied, it would be most
helpful if you could submit them in a regular and recognizable way.

	http://linux.yyz.us/patch-format.html

John

On Fri, Apr 24, 2009 at 10:47:14PM +0200, Christian Lamparter wrote:
> On Friday 24 April 2009 19:56:27 Randy Dunlap wrote:
> > 
> > drivers/net/wireless/p54/p54.h:193: error: array type has incomplete element type
> > 
> > struct p54_led_dev definition is controlled by
> > #ifdef CONFIG_P54_LEDS (is not set)
> > 
> > but the struct declaration is controlled by
> > #ifdef CONFIG_MAC80211_LEDS (=y)
> > 
> meh, [p54: more SoftLED updates] broke it
> ( dce072580e095d1fb7be59a1be30dc0e8307821b )
> 
> this also affects "pull request: wireless-next-2.6 2009-04-24"
> 
> and the current wireless-testing!
> 
> however the patches on the linux-wireless are all fine?!
> (see: http://osdir.com/ml/linux-wireless/2009-03/msg01240.html )
> 
> I guess there was merge conflict with [p54: more SoftLED updates] 
> and [p54: replace MAC80211_LEDS with P54_LEDS in p54.h] ?
> 
> Regards,
> 	Chr
> ---
> In case someone want to fix it manually... here's the undo:
> ---
> diff --git a/drivers/net/wireless/p54/p54.h b/drivers/net/wireless/p54/p54.h
> index 7fda1a9..db3df94 100644
> --- a/drivers/net/wireless/p54/p54.h
> +++ b/drivers/net/wireless/p54/p54.h
> @@ -189,10 +189,10 @@ struct p54_common {
>  	unsigned long *used_rxkeys;
>  
>  	/* LED management */
> -#ifdef CONFIG_MAC80211_LEDS
> +#ifdef CONFIG_P54_LEDS
>  	struct p54_led_dev leds[4];
>  	struct delayed_work led_work;
> -#endif /* CONFIG_MAC80211_LEDS */
> +#endif /* CONFIG_P54_LEDS */
>  	u16 softled_state;		/* bit field of glowing LEDs */
>  
>  	/* statistics */
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
John W. Linville		Someday the world will need a hero, and you
linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org			might be all we have.  Be ready.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
