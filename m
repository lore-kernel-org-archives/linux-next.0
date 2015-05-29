From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the ipsec tree
Date: Fri, 29 May 2015 14:21:34 +1000
Message-ID: <20150529142134.5206b395@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5ugmyrEC0oQ6Z1.FPPPnsfb"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55570 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750701AbbE2EVl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 May 2015 00:21:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, Steffen Klassert <steffen.klassert@secunet.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/5ugmyrEC0oQ6Z1.FPPPnsfb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

Today's linux-next merge of the crypto tree got a conflict in
net/ipv4/esp4.c between commit 64aa42338e9a ("esp4: Use high-order
sequence number bits for IV generation") from the ipsec tree and commit
7021b2e1cddd ("esp4: Switch to new AEAD interface") from the crypto
tree.

I fixed it up (the latter seems to have incorporated the change from
the former) and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/5ugmyrEC0oQ6Z1.FPPPnsfb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZ+lSAAoJEMDTa8Ir7ZwVGcgP/2AIiXOYW/TTC2NMDdYIC/ac
EM6zWOqbiKyU7OQfBEU/Jk7S/DuwGyQiwqMRcIBgTAgdEWGqQ0b9m4S6Z5pbd7zq
T1facRpFhO2Z8DTvYnkKTlJPEnGS8KT6aDz7Jp1HRz+7EZOcTRnELj4sNqeq6r9B
asjaQ6en/FEl2jIU2ADJQLtMP58/zEtB64Y6slFG1C6JfX8lGfzhheiar+VqXFTf
rslHGfBuxIDp4y80OZ2I98CVO6Oteg722EbnzC4lst8bFLitFu1PK+jxXwxvyFaE
Lsi18l37LxMljgMxUN1HSB7/lhTvDUV3u+egNBB9Mon4HMiuKNJQiaP7THlXNvLl
nJedbztCtm9INo+UexTyJTDCvtPaYv917qMtmT4ErJMuZBDUsau4t6QJOKjJCAtF
rPosuL7pRi3kP8c9y+v12cN8IuNeRf2+BNvry2KrDMjO2OEqXqGECZMVnq/Py6qr
hUKF1bJWbElMDZetS6WztSZVKRCd/mRzKA4WvbS/CgVCuYo7hOHFXorMbtLZL8v2
xNlpQ4Bepc89y3neJ0mrYsVzOclddUwGMbD9ecwg+HNVr/XZlN//bWjAHQSoqjz8
ONGNF7NAEctycUvAfGvEOxAWLGgp1WMfsHoteaMuKxh3Hlfdkfo/78WWNjqLY4u9
ij2nwSEdZFBdnMb6w9/L
=HhiE
-----END PGP SIGNATURE-----

--Sig_/5ugmyrEC0oQ6Z1.FPPPnsfb--
