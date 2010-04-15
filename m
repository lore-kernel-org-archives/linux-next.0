From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the final tree (tip
 tree related)
Date: Thu, 15 Apr 2010 16:17:22 +1000
Message-ID: <20100415161722.e4528e88.sfr@canb.auug.org.au>
References: <20100415143609.834da268.sfr@canb.auug.org.au>
	<1271309399.14779.17.camel@marge.simson.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__15_Apr_2010_16_17_22_+1000_R=duj=MBlDIK41W9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52264 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755423Ab0DOGR1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Apr 2010 02:17:27 -0400
In-Reply-To: <1271309399.14779.17.camel@marge.simson.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Galbraith <efault@gmx.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__15_Apr_2010_16_17_22_+1000_R=duj=MBlDIK41W9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Thu, 15 Apr 2010 07:29:59 +0200 Mike Galbraith <efault@gmx.de> wrote:
>
> Oops.
>=20
> sched: fix UP update_avg() build warning.
>=20
> update_avg() is only used for SMP builds, move it to the nearest SMP bloc=
k.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__15_Apr_2010_16_17_22_+1000_R=duj=MBlDIK41W9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvGr3IACgkQjjKRsyhoI8zq0ACfXVwEjWn8G+JBw+mSV1V9vMgZ
wbMAn2lqlD9Lga3Hi2D1YJkshx78IfJb
=pOPZ
-----END PGP SIGNATURE-----

--Signature=_Thu__15_Apr_2010_16_17_22_+1000_R=duj=MBlDIK41W9--
