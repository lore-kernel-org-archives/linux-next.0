From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build warnings
Date: Tue, 6 Jan 2009 14:43:05 +1100
Message-ID: <20090106144305.81e65295.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__6_Jan_2009_14_43_05_+1100_cXJ/A3mny8qaJYP7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55664 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750725AbZAFDnP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Jan 2009 22:43:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__6_Jan_2009_14_43_05_+1100_cXJ/A3mny8qaJYP7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc ppc64_defconfig) produced these new
warnings:

arch/powerpc/platforms/cell/interrupt.c: In function 'iic_eoi':
arch/powerpc/platforms/cell/interrupt.c:85: warning: initialization from in=
compatible pointer type
arch/powerpc/platforms/cell/interrupt.c: In function 'iic_get_irq':
arch/powerpc/platforms/cell/interrupt.c:149: warning: assignment from incom=
patible pointer type
arch/powerpc/platforms/cell/interrupt.c: In function 'init_one_iic':
arch/powerpc/platforms/cell/interrupt.c:353: warning: initialization from i=
ncompatible pointer type
arch/powerpc/kernel/sysfs.c:28: warning: 'cache_toplevel' defined but not u=
sed

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__6_Jan_2009_14_43_05_+1100_cXJ/A3mny8qaJYP7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkli00kACgkQjjKRsyhoI8wx2ACgqHK3qCgO8rwE1wL6sYCM/nFr
WnMAoIs0gQLZ2UOmp1poNEbnkraAc+ym
=Wnt0
-----END PGP SIGNATURE-----

--Signature=_Tue__6_Jan_2009_14_43_05_+1100_cXJ/A3mny8qaJYP7--
