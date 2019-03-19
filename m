From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the net tree
Date: Tue, 19 Mar 2019 16:21:52 +1100
Message-ID: <20190319162152.102d98d4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wzK3DhsIfkktuZC/W=28rah"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhiqiang Liu <liuzhiqiang26@huawei.com>, "Suanming.Mou" <mousuanming@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/wzK3DhsIfkktuZC/W=28rah
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  cc4807bb6092 ("vxlan: Don't call gro_cells_destroy() before device is unr=
egistered")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/wzK3DhsIfkktuZC/W=28rah
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyQfHAACgkQAVBC80lX
0Gy2Egf+Lut+eekzPkamFTUU31A/3EHI2ZxLDdWWksBtyutAKuUzLJxDHxZGmkJo
X0kBNKfX6oR1q4kdflxcr9X1PHWbSESto9r2neOqPmFPGDjA1gscWfWMAMAwsLQn
6HTg8MNeXHFxloXImL1z5W9N1abzSa8n9xxTVLxH9nK/e0ozqYa2alKMq/YVmUwA
5LLP0R8jAOLTeCoPVSYrO2mWAafYI/neJMvlNXx3UURKmuPzsLJURk649zuD+NUC
Mvp8sfhtnlRQ2lqnDtNXU8hIFuOt/XhFoZbhjI89s1voRqWxNlENffxcmWWasQOU
81HjottsmiQFQojA0Mp8sFVWsXNIUQ==
=vYAJ
-----END PGP SIGNATURE-----

--Sig_/wzK3DhsIfkktuZC/W=28rah--
