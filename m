From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [next] xfs: error: called object 'panic' is not a function
Date: Fri, 11 Mar 2011 13:21:52 +0100
Message-ID: <AANLkTi=Hg4s5kEMQZu_KGePf4W_7jAFm0_WifM9W3PR6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xfs-masters@oss.sgi.com, xfs@oss.sgi.com
Cc: Linux-Next <linux-next@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

http://kisskb.ellerman.id.au/kisskb/buildresult/3977742/:

| fs/xfs/linux-2.6/xfs_message.c:116: error: called object 'panic' is
not a function
| make[3]: *** [fs/xfs/linux-2.6/xfs_message.o] Error 1

Lemme guess, the problem fixed by commit
cf78859f520f8275318f47d7864f4459d940cb6b (xfs: Do not name variables "p=
anic")
has reincarnated somewhere else?

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
