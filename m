From: Luciano Coelho <coelho-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2] wlcore: fix undefined symbols when CONFIG_PM is not
 defined
Date: Tue, 29 May 2012 11:33:05 +0300
Message-ID: <1338280385.15008.74.camel@cumari.coelho.fi>
References: <1338280122-28648-1-git-send-email-eyal@wizery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1338280122-28648-1-git-send-email-eyal-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: eyal-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2012-05-29 at 01:28 -0700, Eyal Shapira wrote:
> commit c21eebb50379a96e1335e933583dcd5b455c6b64
> "wl12xx: add RX filters ACX commands" breaks the build
> when CONFIG_PM isn't defined:
> 
> ERROR: "wl1271_rx_filter_get_fields_size"
> [drivers/net/wireless/ti/wlcore/wlcore.ko] undefined!
> ERROR: "wl1271_rx_filter_flatten_fields"
> [drivers/net/wireless/ti/wlcore/wlcore.ko] undefined!
> 
> code in drivers/net/wireless/ti/wlcore/acx.c is using these
> functions unconditionally while they are #ifdefed CONFIG_PM.
> Fix it by ifdefing all relevant RX filters code with CONFIG_PM.
> 
> Reported-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> Signed-off-by: Eyal Shapira <eyal-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
> ---
> v2: reference the correct commit in linux-next (Thanks Stephen!)

Thanks for the correction.  For v2:

Acked-by: Luciano Coelho <coelho-l0cyMroinI0@public.gmane.org>

-- 
Cheers,
Luca.

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
