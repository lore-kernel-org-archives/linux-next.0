From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the sched tree
Date: Mon, 7 Jul 2008 16:37:40 +1000
Message-ID: <20080707163740.ed34a952.sfr@canb.auug.org.au>
References: <20080707142114.7985a9dd.sfr@canb.auug.org.au>
	<20080707145027.0d83038e.sfr@canb.auug.org.au>
	<20080707061057.GB16144@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_16_37_40_+1000_ZlNb/q4RvwuLkEN9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59012 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751839AbYGGGhr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 02:37:47 -0400
In-Reply-To: <20080707061057.GB16144@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Franck Bui-Huu <fbuihuu@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

--Signature=_Mon__7_Jul_2008_16_37_40_+1000_ZlNb/q4RvwuLkEN9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 7 Jul 2008 08:10:57 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
>=20
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
> > index b65871e..7bfdad7 100644
> > --- a/arch/x86/mm/kmmio.c
> > +++ b/arch/x86/mm/kmmio.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/errno.h>
> >  #include <asm/debugreg.h>
> >  #include <linux/mmiotrace.h>
> > +#include <linux/rculist.h>
>=20
> the same commit existed already for about two months:
>=20
> ------------------->
> commit 668a6c3654560aef8741642478973e205a4f02bf
> Author: Ingo Molnar <mingo@elte.hu>
> Date:   Mon May 19 13:35:24 2008 +0200
>=20
>     - fix mmioftrace + rcu merge interaction
>    =20
>     Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>=20
> diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
> index b65871e..93d8203 100644
> --- a/arch/x86/mm/kmmio.c
> +++ b/arch/x86/mm/kmmio.c
> @@ -6,6 +6,7 @@
>   */
> =20
>  #include <linux/list.h>
> +#include <linux/rculist.h>
>  #include <linux/spinlock.h>
>  #include <linux/hash.h>
>  #include <linux/init.h>
> <----------------------
>=20
> so i've merged the tip/tracing/mmiotrace-mergefixups branch into=20
> tip/tracing/mmiotrace. (after having merged tip/tracing/mmiotrace to=20
> -rc9 so that rculist.h was present already)

Excellent, thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_16_37_40_+1000_ZlNb/q4RvwuLkEN9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhxubQACgkQjjKRsyhoI8xuigCgtAtbB3mEyoUsbo3EIRfyQ+fx
CFkAoKM4NITSnmIjR2G4qpPcDAJb6N7j
=4EpZ
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_16_37_40_+1000_ZlNb/q4RvwuLkEN9--
