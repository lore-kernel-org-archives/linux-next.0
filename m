From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the device-mapper tree with the block
 tree
Date: Mon, 10 Dec 2018 14:43:22 +1100
Message-ID: <20181210144322.11a94d25@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/q1Kzo215pGJ.Yz=WAKt/TmG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/q1Kzo215pGJ.Yz=WAKt/TmG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

It appears that there are a series of shared patches between the block
and device-mapper trees that are not the same commits.  I assume that the
block tree has been rebased, while the device mapper tree that was based
(or includes) part of the block tree has not bee rebased (yet).

--=20
Cheers,
Stephen Rothwell

--Sig_/q1Kzo215pGJ.Yz=WAKt/TmG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwN4NoACgkQAVBC80lX
0GzgFQf/Z2uhvvJPpOXS8XrLFxX1pyCbkodorwcp5uWcu75NJjCBPIF14IJgJnAy
5MDfbhriOEW5ofrzWsjUSIOyXusWNZv1nfIRP1cMVOb4x8ijDaV3I1BpKojRHmCz
IlbiRk37UrK6NGjBHjZB6M5C10Q/H4VbRFYT8WxZe70xzhwyRHjLRSYrAe+tqTcQ
Yb0UBsEQ4gMryFgah63xCOVDb6n6XwyyFu88S5Jv/WptZo6qaEvCAoFNE0CRMOy8
4B627C2z1EKq8sExN06CByiCRMCKaVvb79nhf8KuORGDGQZsry6eoHFMHjoLNZWj
fF8MT4TWXgmECMz3hRdtXlZ/BX3VWg==
=l2pd
-----END PGP SIGNATURE-----

--Sig_/q1Kzo215pGJ.Yz=WAKt/TmG--
