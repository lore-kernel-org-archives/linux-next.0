From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v3.0-rc3
Date: Sat, 18 Jun 2011 14:19:37 +0200
Message-ID: <BANLkTinsa=Wh0_+YBzFRnp4M+FGejiANFw@mail.gmail.com>
References: <alpine.DEB.2.00.1106151111200.18110@ayla.of.borg>
	<BANLkTikBDVR=S5J-=Kjq1QW3OU64WzHYRg@mail.gmail.com>
	<20110618183029.822f4d82.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:59982 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753141Ab1FRMTj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 18 Jun 2011 08:19:39 -0400
In-Reply-To: <20110618183029.822f4d82.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <michael@ellerman.id.au>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>

Hi Stephen,

On Sat, Jun 18, 2011 at 10:30, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> On Wed, 15 Jun 2011 11:19:48 +0200 Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
>> Would it be possible to build with `make -k', so it continues in cas=
e
>> of an error, and
>> tries to build as much as possible?
>> Yes, I know this may increase build time considerably, but in an ide=
al
>> world, there
>> are no compile errors and everything is built anyway ;-)
>
> Done (I think - it required very simple changes to a Python script an=
d I

Thanks!

> only do "monkey see, monkey do" Python programming :-))

Good to know I'm not the only one ;-)

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
