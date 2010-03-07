From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH -next] staging/pohmelfs: fix write_inode parameter warning
Date: Sun, 7 Mar 2010 10:22:27 +0100
Message-ID: <10f740e81003070122y32765942y33c167b5ba4ca8ac@mail.gmail.com>
References: <20100225183523.80361261.sfr@canb.auug.org.au>
	 <20100225144122.d9ba8810.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:58920 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751245Ab0CGJW3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 7 Mar 2010 04:22:29 -0500
In-Reply-To: <20100225144122.d9ba8810.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, devel@driverdev.osuosl.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de, Evgeniy Polyakov <zbr@ioremap.net>

On Thu, Feb 25, 2010 at 23:41, Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> sparse warns that:

Not just sparse, plain gcc as well...

> drivers/staging/pohmelfs/inode.c:1797: warning: initialization from i=
ncompatible pointer type
>
> so fix pohmelfs_write_inode() to have the expected parameters.

And now it's in mainline, too...

> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
> =C2=A0drivers/staging/pohmelfs/inode.c | =C2=A0 =C2=A03 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>
> --- linux-next-20100225.orig/drivers/staging/pohmelfs/inode.c
> +++ linux-next-20100225/drivers/staging/pohmelfs/inode.c
> @@ -396,7 +396,8 @@ int pohmelfs_remove_child(struct pohmelf
> =C2=A0/*
> =C2=A0* Writeback for given inode.
> =C2=A0*/
> -static int pohmelfs_write_inode(struct inode *inode, int sync)
> +static int pohmelfs_write_inode(struct inode *inode,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct writeback_control *wbc)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pohmelfs_inode *pi =3D POHMELFS_I(i=
node);
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
> Please read the FAQ at =C2=A0http://www.tux.org/lkml/
>



--=20
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
