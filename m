From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 4 Jun 2015 14:02:40 +1000
Message-ID: <20150604140240.0717637a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pNevEAHsnmV4UjE4m26j5EN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/pNevEAHsnmV4UjE4m26j5EN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from sound/soc/soc-dapm.c:43:0:
include/sound/soc.h:30:32: fatal error: sound/soc-topology.h: No such file =
or directory
 #include <sound/soc-topology.h>
                                ^

Several more of these ...

Caused by commit b2eef86fedbf ("ASoC: topology: Add topology core").
Looks like a file was missed.

I have used the sound-asoc tree from next-20150603 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/pNevEAHsnmV4UjE4m26j5EN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVb83mAAoJEMDTa8Ir7ZwVgdAP/0QarszxpU3TfjruICAkYmmU
+gDjqNb0Gz6XZ+dSWbC4/hp7f8C1XbvDOP484iesFpY/ER3mF6mPhYsIl2L5fqrf
2Nz17niPYMmyDq5Lqu+N5NAT4WqTRacUvqv9Sf+RPVM1ktzMaFx30LEeK6nbwFwo
sV5XZfHZHVydiL4iyWpVpw0z6054XJQwpihJF9aWKYgX0B2sVVtCOXOL4gZq3Q+t
A/P9QRACQPN5xXmMYhz0rZqRc3EwSPAKqsUAKG82Mzu4K1SMdmgjkG9pXqflvzWV
SEkAHUEupSzgbOa07Z2f8/n5PiXZ4yVipXuk0lFnsPU25rjWed/TSsaMXWZQBs/d
L8HuXFv9ZfkfvW5UV6elparNxdptyGm2tW2FfcSw4Rut1LKZsGLRceDxKDRbYGFF
0m23PYCoVJlVD7eL2mkaEyxdL60+c0WsnzRY7tuJCAjCfqUZ8IWsmCfWVGsQmJI5
Z0NGFLH+CXbrg9Np3cdwyXJhVIg3Sqw7TyII/IHejthFMrooAg9qHwSx59JUVAbh
vKAGkJuqpTiuWtZMkVbLTB0FFAJLAwQV2j3xlATUBSN/P7QN0j0/Bw95yMEVelBC
jquNXufFma3QA/Nu9OBIqolgNkZrrTpLnnKlCWXeiDylo8epTP/14ocvmDGdUtMG
z9bB4+/88R7VRH5gDze4
=Mtq2
-----END PGP SIGNATURE-----

--Sig_/pNevEAHsnmV4UjE4m26j5EN--
