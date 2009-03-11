From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: linux-next: block/proc tree build failure
Date: Wed, 11 Mar 2009 13:28:57 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0903111328340.1040@vixen.sonytel.be>
References: <20090311224418.f1a7cb5f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vervifontaine.sonytel.be ([80.88.33.193]:56888 "EHLO
	vervifontaine.sonycom.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751395AbZCKM27 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Mar 2009 08:28:59 -0400
In-Reply-To: <20090311224418.f1a7cb5f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, Alexey Dobriyan <adobriyan@gmail.com>, linux-next@vger.kernel.org, Geoff Levand <geoffrey.levand@am.sony.com>

On Wed, 11 Mar 2009, Stephen Rothwell wrote:
> Today's linux-next build (powerpc allyesconfig) failed like this:
>=20
> drivers/block/ps3vram.c: In function 'ps3vram_proc_init':
> drivers/block/ps3vram.c:555: error: 'struct proc_dir_entry' has no me=
mber named 'owner'
>=20
> Caused by the interaction of commit
> ce12b152a2e5c0f831853180e84f3ba6e3fee4a1 ("ps3/block: Replace mtd/ps3=
vram
> by block/ps3vram") from the block tree with commit
> 773c363c5607e8713efe49e1df11317dfa8f48fc ("proc 2/2: remove struct
> proc_dir_entry::owner") from the proc tree.
>=20
> I have applied the following patch that I will add as a merge fixup f=
or
> the proc tree tomorrow and apply as long as necessary.
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 11 Mar 2009 22:22:04 +1100
> Subject: [PATCH] proc: remove a new user of proc_dir_entry::owner
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

> ---
>  drivers/block/ps3vram.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/block/ps3vram.c b/drivers/block/ps3vram.c
> index 393ed67..23fc853 100644
> --- a/drivers/block/ps3vram.c
> +++ b/drivers/block/ps3vram.c
> @@ -552,7 +552,6 @@ static void __devinit ps3vram_proc_init(struct ps=
3_system_bus_device *dev)
>  		return;
>  	}
> =20
> -	pde->owner =3D THIS_MODULE;
>  	pde->data =3D priv;
>  }

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village =B7 Da Vincilaan 7-D1 =B7 B-1935 Zaventem =B7 Bel=
gium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =B7 RPR Brussels
=46ortis =B7 BIC GEBABEBB =B7 IBAN BE41293037680010
