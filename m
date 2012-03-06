From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: rtl2830: __udivdi3 undefined
Date: Tue, 6 Mar 2012 19:02:02 +0100
Message-ID: <CAMuHMdVE2m-Q+ikyEE5V9dd9cbqCbCC2+CtnkDhq=UTQg2detQ@mail.gmail.com>
References: <CAMuHMdVmiqY9uh574_uTK76+28bvhEL0BPnzjDF-bf-0mgj4gg@mail.gmail.com>
	<4F53EA7D.4090402@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:55958 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752592Ab2CFSCE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Mar 2012 13:02:04 -0500
In-Reply-To: <4F53EA7D.4090402@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gennarone@gmail.com
Cc: linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@redhat.com>, Linux-Next <linux-next@vger.kernel.org>

On Sun, Mar 4, 2012 at 23:19, Gianluca Gennari <gennarone@gmail.com> wr=
ote:
> Probably the best solution is to use div_u64.
> The following patch fixed the warning on my 32 bit system.
>
> Signed-off-by: Gianluca Gennari <gennarone@gmail.com>

Thanks, that fixes it (div_u64() is do_div() on 32-bit).

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> ---
> =C2=A0drivers/media/dvb/frontends/rtl2830.c | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/media/dvb/frontends/rtl2830.c
> b/drivers/media/dvb/frontends/rtl2830.c
> index f971d94..45196c5 100644
> --- a/drivers/media/dvb/frontends/rtl2830.c
> +++ b/drivers/media/dvb/frontends/rtl2830.c
> @@ -244,7 +244,7 @@ static int rtl2830_init(struct dvb_frontend *fe)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0num =3D priv->cfg.if_dvbt % priv->cfg.xtal=
;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0num *=3D 0x400000;
> - =C2=A0 =C2=A0 =C2=A0 num /=3D priv->cfg.xtal;
> + =C2=A0 =C2=A0 =C2=A0 num =3D div_u64(num, priv->cfg.xtal);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0num =3D -num;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if_ctl =3D num & 0x3fffff;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dbg("%s: if_ctl=3D%08x", __func__, if_ctl)=
;

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
