From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: failed to fetch block tree
Date: Thu, 7 Apr 2011 10:26:02 +1000
Message-ID: <20110407102602.f0ef8b5c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__7_Apr_2011_10_26_02_+1000_GZsTD2KYmL1hNm.Z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34784 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755636Ab1DGA0L (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Apr 2011 20:26:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__7_Apr_2011_10_26_02_+1000_GZsTD2KYmL1hNm.Z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

[Yes, I understand that this may not get to you either .. :-(]

Trying to fetch the block tree yesterday and today produced this error:

git.kernel.dk[0: 95.166.99.235]: errno=3DConnection timed out

I am using the block tree from next-20110405.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__7_Apr_2011_10_26_02_+1000_GZsTD2KYmL1hNm.Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNnQSaAAoJEDMEi1NhKgbsJbkH/1jKxdbRZewLiE263RJGN7cs
Z4+eH0OWitesRxH4Gk4Rh5YD2efElyRFvyVYV5wLbLVJzeYZMBJ6OSjoy8Gp4CHj
vdZui/wOIOiB3Sz1pkHRplAPJ6/KINcL29QNonWYt/8cheBA8KbFDGEPn3RVndaY
CGxmNlwcLby2WpSZBgwnNKFkEA4+6kiy7Eq3tb22gdi8EacmPbeb2OnP3rj8Rj2z
bbwCHAmO8tlJLR61rXYHHaEnLF8ucqEiiZX9LLrWomr2L3HirgkfeweDMf0BWuSf
EMWNSSzX2EUxyHO9CHETXH3dRKT1a9BiH0yV0mmpjnwxj7EA1n3tT4mAd3qAg1Q=
=9OJa
-----END PGP SIGNATURE-----

--Signature=_Thu__7_Apr_2011_10_26_02_+1000_GZsTD2KYmL1hNm.Z--
