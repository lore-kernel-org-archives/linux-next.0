From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [-next] ERROR: "usb_unanchor_urb" [drivers/net/wireless/rtlwifi/rtlwifi.ko]
 undefined!
Date: Thu, 17 Feb 2011 13:56:14 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1102171354200.16788@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: George <george0505-Rasf1IRRPZFBDgjK7y7TUQ@public.gmane.org>, Larry Finger <Larry.Finger-tQ5ms3gMjBLk1uMJSBkQmQ@public.gmane.org>George <george0505-Rasf1IRRPZFBDgjK7y7TUQ@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

m68k/allmodconfig:

http://kisskb.ellerman.id.au/kisskb/buildresult/3914133/

ERROR: "usb_unanchor_urb" [drivers/net/wireless/rtlwifi/rtlwifi.ko] undefined!
ERROR: "usb_control_msg" [drivers/net/wireless/rtlwifi/rtlwifi.ko] undefined!
ERROR: "usb_submit_urb" [drivers/net/wireless/rtlwifi/rtlwifi.ko] undefined!
ERROR: "usb_get_dev" [drivers/net/wireless/rtlwifi/rtlwifi.ko] undefined!
ERROR: "usb_kill_anchored_urbs" [drivers/net/wireless/rtlwifi/rtlwifi.ko] undefined!
ERROR: "usb_put_dev" [drivers/net/wireless/rtlwifi/rtlwifi.ko] undefined!
ERROR: "usb_free_urb" [drivers/net/wireless/rtlwifi/rtlwifi.ko] undefined!
ERROR: "usb_anchor_urb" [drivers/net/wireless/rtlwifi/rtlwifi.ko] undefined!
ERROR: "usb_alloc_urb" [drivers/net/wireless/rtlwifi/rtlwifi.ko] undefined!
make[2]: *** [__modpost] Error 1
make[1]: *** [modules] Error 2
make: *** [sub-make] Error 2

The USB-part of rtlwifi should depend on CONFIG_USB.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
