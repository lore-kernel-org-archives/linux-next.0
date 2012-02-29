From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: rtl2830: __udivdi3 undefined
Date: Wed, 29 Feb 2012 22:30:22 +0100
Message-ID: <CAMuHMdVmiqY9uh574_uTK76+28bvhEL0BPnzjDF-bf-0mgj4gg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-media@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

http://kisskb.ellerman.id.au/kisskb/buildresult/5759200/
ERROR: "__udivdi3" [drivers/media/dvb/frontends/rtl2830.ko] undefined!

I didn't look too deeply into it, but I think it's caused by the "num
/=3D priv->cfg.xtal"
in rtl2830_init() (with num being u64).

Can't it use do_div() instead?

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
