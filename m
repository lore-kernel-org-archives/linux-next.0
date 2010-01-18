From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for January 14 (drm header files)
Date: Mon, 18 Jan 2010 13:42:21 +1100
Message-ID: <20100118134221.0c36feb3.sfr@canb.auug.org.au>
References: <20100114172047.406ebda8.sfr@canb.auug.org.au>
	<20100117151718.f88c5f21.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__18_Jan_2010_13_42_21_+1100_kIT1TFen_YF2N9Vv"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46048 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752373Ab0ARCme (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Jan 2010 21:42:34 -0500
In-Reply-To: <20100117151718.f88c5f21.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@linux.ie>

--Signature=_Mon__18_Jan_2010_13_42_21_+1100_kIT1TFen_YF2N9Vv
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Just cc'd Dave]

On Sun, 17 Jan 2010 15:17:18 -0800 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>=20
> Is anything being done about these?
> or does anything need to be done?
>=20
>=20
> usr/include/drm/drm_mode.h:84: found __[us]{8,16,32,64} type without #inc=
lude <linux/types.h>
> usr/include/drm/i915_drm.h:119: found __[us]{8,16,32,64} type without #in=
clude <linux/types.h>
> usr/include/drm/mga_drm.h:260: found __[us]{8,16,32,64} type without #inc=
lude <linux/types.h>
> usr/include/drm/radeon_drm.h:758: found __[us]{8,16,32,64} type without #=
include <linux/types.h>
> usr/include/drm/via_drm.h:117: found __[us]{8,16,32,64} type without #inc=
lude <linux/types.h>
>=20
>=20
> Thanks,
> ---
> ~Randy

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__18_Jan_2010_13_42_21_+1100_kIT1TFen_YF2N9Vv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktTyo0ACgkQjjKRsyhoI8y99QCgtucuf3EKHUPcWaEpGrOv3zIT
lg8AoKffatVEyzqokOpRuN+zVqYozcdY
=7zje
-----END PGP SIGNATURE-----

--Signature=_Mon__18_Jan_2010_13_42_21_+1100_kIT1TFen_YF2N9Vv--
