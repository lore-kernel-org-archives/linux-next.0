From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: drm tree build warning
Date: Fri, 11 Sep 2009 18:08:09 +1000
Message-ID: <20090911180809.4c372992.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__11_Sep_2009_18_08_09_+1000_O4+IqYNPYKvU86Os"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46062 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752272AbZIKIIS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Sep 2009 04:08:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__11_Sep_2009_18_08_09_+1000_O4+IqYNPYKvU86Os
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

drivers/gpu/drm/radeon/r100.c: In function 'r100_cs_parse':
drivers/gpu/drm/radeon/r100.c:1623: warning: the frame size of 3120 bytes i=
s larger than 2048 bytes
drivers/gpu/drm/radeon/r300.c: In function 'r300_cs_parse':
drivers/gpu/drm/radeon/r300.c:1270: warning: the frame size of 3104 bytes i=
s larger than 2048 bytes

Probably caused by commit 551ebd837c75fc75df81811a18b7136c39cab487
("drm/radeon/kms: add rn50/r100/r200 CS tracker") which added a very
large structure to the stack of each of these functions.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__11_Sep_2009_18_08_09_+1000_O4+IqYNPYKvU86Os
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkqqBWkACgkQjjKRsyhoI8zzWQCfUnF2LZrFoIVAveV03scwKIrR
1HAAn2nSGgvHa7XW++2Z3Fb9fnMgIwxn
=+tkk
-----END PGP SIGNATURE-----

--Signature=_Fri__11_Sep_2009_18_08_09_+1000_O4+IqYNPYKvU86Os--
