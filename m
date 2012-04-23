From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 2/2] usb/ssb: Add missing #include <linux/slab.h>
Date: Tue, 24 Apr 2012 00:04:13 +0200
Message-ID: <4F95D1DD.70309@hauke-m.de>
References: <1335210932-9565-1-git-send-email-geert@linux-m68k.org> <1335210932-9565-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335210932-9565-2-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On 04/23/2012 09:55 PM, Geert Uytterhoeven wrote:
> m68k/allmodconfig:
>=20
> drivers/usb/host/ssb-hcd.c: In function =E2=80=98ssb_hcd_probe=E2=80=99=
:
> drivers/usb/host/ssb-hcd.c:170: error: implicit declaration of functi=
on =E2=80=98kzalloc=E2=80=99
> drivers/usb/host/ssb-hcd.c:170: warning: assignment makes pointer fro=
m integer without a cast
> drivers/usb/host/ssb-hcd.c:205: error: implicit declaration of functi=
on =E2=80=98kfree=E2=80=99
>=20
> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Acked-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>

Hauke
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
