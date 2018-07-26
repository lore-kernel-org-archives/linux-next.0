From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Thu, 26 Jul 2018 12:19:42 +1000
Message-ID: <20180726121942.0ab69aac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YjM7=yOaxRk=SNBTV.oS5t0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Akshu Agrawal <akshu.agrawal@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/YjM7=yOaxRk=SNBTV.oS5t0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/amd/acp-da7219-max98357a.c: In function 'cz_probe':
sound/soc/amd/acp-da7219-max98357a.c:367:3: warning: 'ret' may be used unin=
itialized in this function [-Wmaybe-uninitialized]
   dev_err(&pdev->dev, "Failed to register regulator: %d\n",
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ret);
    ~~~~

Introduced by commit

  7b5317aa809f ("ASoC: AMD: Add a fix voltage regulator for DA7219 and ADAU=
7002")

This is a real bug.

--=20
Cheers,
Stephen Rothwell

--Sig_/YjM7=yOaxRk=SNBTV.oS5t0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltZL74ACgkQAVBC80lX
0Gx0Ygf+LvO5hWnIFXRM3Hb7izDlFAhQpjr8fHlPAkmHrTtm2QHAGHvdZ8fyMDsC
XKxGXlxbMFD+deMzL5uyfw0n+MyBd3C3KeAXHsqdZhyN+bBSSuG9VgO8ICOVsGOU
YqD02KZrTHWzZPCTWO/8el7dpeipkpXVyg4CLjFALWyRA8UaEtymIuZzA/MLGvzM
xwE8tLVVPCcpR5dRxnu82fDBGCYAQEWnBUM5HeXJQPk+A1BuIRjCOjURhxbhTOF7
Oa1Onvg8zDiUp9ny2wWr458lBPqIpyRN/7qk5QaaTrftoupuyqJEYAlINZ0ugOvn
A8u+7Fx/JjeI+WYswHOI8PIZ5rKBNg==
=yefy
-----END PGP SIGNATURE-----

--Sig_/YjM7=yOaxRk=SNBTV.oS5t0--
