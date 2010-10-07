From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the i2c tree
Date: Thu, 7 Oct 2010 13:42:20 +1100
Message-ID: <20101007134220.d926a652.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__7_Oct_2010_13_42_20_+1100_SbWXgJgBoG4t0aNF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38406 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752286Ab0JGCmZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Oct 2010 22:42:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Jean Delvare <khali@linux-fr.org>

--Signature=_Thu__7_Oct_2010_13_42_20_+1100_SbWXgJgBoG4t0aNF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
drivers/gpu/drm/i915/intel_i2c.c between commit
2d3e8209c9d3abf6e831158e9814f50c57275487 ("i2c: Remove unneeded
inclusions of <linux/i2c-id.h>") from the i2c tree and commit
f899fc64cda8569d0529452aafc0da31c042df2e ("drm/i915: use GMBUS to manage
i2c links") from the drm tree.

Again, both commits removed the inclusion of linux/i2.-id.h, so I used
the drm tree verison.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__7_Oct_2010_13_42_20_+1100_SbWXgJgBoG4t0aNF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMrTOMAAoJEDMEi1NhKgbsaMkH/jAO9PHBzbr8mCFHPDsQRNWb
+OS1MhKgh8kmc8GrJzuEWc+Yr3KOZqHM+Bp64aysT+rvlmeX4VEoMHQ/3hKyQKEb
MINg8ZhZ8tzUFwHM7cryvbZEgCzyRQejetjrThtseDnK2LihrhKRoI9TUIxlAxfA
NfkpQqsgOC3BUYXTQDhTEj6LH5bJuYIKnxotc0f84O8qE/MSsoW/Fxx2RD2nD3ff
o0TdO2Lz+ZHazUTcg012RTXtl3xhVoFw+nVoH0aIT0C9YGW/xOKG9z76XnkI+QnR
pmzc7NKAlXdXiIDQk4UTd5qpKhhL2sd5woCR3zaukFwlCSd3TUlgZ3tcD4RXwYw=
=I/f1
-----END PGP SIGNATURE-----

--Signature=_Thu__7_Oct_2010_13_42_20_+1100_SbWXgJgBoG4t0aNF--
