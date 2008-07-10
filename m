From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree
Date: Thu, 10 Jul 2008 16:10:56 +1000
Message-ID: <20080710161056.6e65c8b9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__10_Jul_2008_16_10_56_+1000_Kz/YHqm08E2D01xS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49021 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751171AbYGJGLO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Jul 2008 02:11:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Thu__10_Jul_2008_16_10_56_+1000_Kz/YHqm08E2D01xS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in include/Kbuild
between commit 4896a02e1e6d4f0ae5b23c24eff0ba10e26caab4 ("kbuild: only
one call for include/ in make headers_*") from the kbuild tree and commit
ae74c0f7f4abab0cf1e943c562b52df8868dc1ee ("drm: reorganise drm tree to be
more future proof") from the drm tree.

The former removes a line just where the latter is adding one. I fixed it
up and can carry the fix.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__10_Jul_2008_16_10_56_+1000_Kz/YHqm08E2D01xS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh1p/AACgkQjjKRsyhoI8xghgCfbFgaNIjaeJZCMilYnd45ceys
UlcAnRjOOhUUT26204ky3pzTvdybNlz9
=aRQD
-----END PGP SIGNATURE-----

--Signature=_Thu__10_Jul_2008_16_10_56_+1000_Kz/YHqm08E2D01xS--
