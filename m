From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Date: Wed, 22 May 2019 07:31:41 +1000
Message-ID: <20190522073141.1cd226e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ilG6zk7VSWYdOFLvo=3vW__"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ilG6zk7VSWYdOFLvo=3vW__
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e355d3de196f ("ASoC: Mediatek: MT8183: fix compile error")

Fixes tag

  Fixes: 1628fc3f4771 ("ASoC: Mediatek: MT8183: add memory interface data a=
lign")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/ilG6zk7VSWYdOFLvo=3vW__
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzkbj0ACgkQAVBC80lX
0GxFbwgAi6217xPl21htkDiW2HAY4ypDvx1bt9MmaEjK43JOx9n4iWfWNrX266jF
wboK/DJpHbYORoE0pU4GkIpMI4a8m9H3U0KM9bxxgbjmz3U6pvHvuM8+AvFQaUsc
edYj+h8+sz5Lf01u/F7NEtQt7vJePgaQnxmT6Z4lG83fQjwh3tJVRpO7mVL77H4/
xq2CC5J8rf6KwExQoZy4b0u/F6ETnrp6kjAMXLiyJ+Zaq4cjDhf6yJMqER6DcD7L
EjeFjhRcgYBJVTOBT4KR6DaWLdlj8pmsetcL+fnxxG0K+go8tSYtgBvpm5xqPds5
fUHj+LdHA6KPwcg/4IhWKlPWVh+aZg==
=GDsa
-----END PGP SIGNATURE-----

--Sig_/ilG6zk7VSWYdOFLvo=3vW__--
