From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the
 dma-mapping-fixes tree
Date: Thu, 24 Jan 2019 07:43:16 +1100
Message-ID: <20190124074316.5730569d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/62VH0y98=ihLOpL7220dIxi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/62VH0y98=ihLOpL7220dIxi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

Commit

  e31614683919 ("Revert "arm64/xen: fix xen-swiotlb cache flushing"")

is missing a Signed-off-by from its author and committer.

Reverts are commits too.  Also, it can be useful to have an explanation
for the revert in the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/62VH0y98=ihLOpL7220dIxi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxI0eQACgkQAVBC80lX
0GyHiQf6Akao8O5G5WAs2YgmwIrq8ib7um/hVLImOFmOWN0KBsrLErIpiaB9/Fgw
KNBzRHaikidB/pSb4xIwtmuZSx7j0YX+4Aofb8LFjhrCFRerYVSN3kY5/w9m9/cE
32MosBsMWENc1MiTHn6wWOPzbrZJVf7CeVF6tiiNC+UgBA6qcGG7dcMCz28E9e0y
X0xzxxigH1n9O1LuzljZRknedbxRlw7k4X4S8/aN6mZ0uzaw+XkCPow9NGXzlaDv
Grt4jX+ScViszIHKNIdidVNedjQath1haAp4dYc/M6Y4VKcPFh9oeNyiT18TVEkw
WeY3Aahx8FufWYkqwMDOA47Mpbz+qg==
=csny
-----END PGP SIGNATURE-----

--Sig_/62VH0y98=ihLOpL7220dIxi--
