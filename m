From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unnecessary merge in the ubifs tree
Date: Thu, 26 Mar 2015 11:32:17 +1100
Message-ID: <20150326113217.580fe7e8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WcdNkhp7X=U+vU+UrKHXRXp"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52578 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751347AbbCZAcY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Mar 2015 20:32:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/WcdNkhp7X=U+vU+UrKHXRXp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Artem,

I noticed merge commit 3527a86b7ae1 ("Merge tag 'v4.0-rc5' into
linux-next").  Just a note that if you had merged the commit that the
tag points to, you would have just had a fast forward instead of a
"real" merge.  Merging the tag forces the --no-ff flag on git merge
(and adding --ff does not change that).  You could have merged
"v4.0-rc5^0" (I think) or (apparently) pass --ff-only to get the fast
forward.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/WcdNkhp7X=U+vU+UrKHXRXp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVE1OWAAoJEMDTa8Ir7ZwVy4kP/ippn0W0NFyJPOU9t01UP/bR
dIK1LzCFKz1lD3NLeqsQe4XYGQLmUA7KGVo80NWkZMH+XOt7pCQ31DrwYY6Ft9LQ
Mh3e5NgYCzqvdffk8v7cZj/hVpQhe49zfsCe5onMRgEudS/o62o3cfv2gto04JZm
wIL+6J9TO/dk+RUKcEXCJZBijdQbBDNyy7+nBJmVm8QPEZfBIn8zEtkjFhj/JMB/
VTGuBYKf7772zbU5gtgI7nZ8HbcsIHfVioZOugVEnSga3dVbRLZvCw3bgx2an9pz
RUkPOsIYv+wyxKYv6f58LUsHPxuhxJdy3mZ9hMEzzIfkOxKtPNPvPfx8ZyD+gIrz
eem8SWigr+/W+k55isnftki/q0cDL6huEkbhCXg2FBWb9n+tCGsZNp3QHPAWY1a3
SduRTow9gMmMXv+dM3LRVZM/lY3NCBI7Uh5xRgwmd5XPHCRnBu/VPK8twxeW9426
X+UDTy5J9UDnSSiYMAckBrNzoLFKzKnq32WLxKas9MdkTY96Q73Q80xgx/vHjDjz
0k9bxqf49aqUDouhn35XKWExueKkoyczEtVb9AgFVD4t74qGQ6xNsNCXDq1+7IcO
oJ1l2d7h8i6cpdayZeBeiac2lxj3oh8SBL/Da9AY0vUNRf4HqDgXPPq8qTjs1pd5
oO3U8qYdiD6hLVwHWDyA
=BKvh
-----END PGP SIGNATURE-----

--Sig_/WcdNkhp7X=U+vU+UrKHXRXp--
