From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the
 asm-generic tree
Date: Wed, 4 Apr 2018 09:09:00 +1000
Message-ID: <20180404090900.2cc0645e@canb.auug.org.au>
References: <20180315122921.24520368@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bnSX5echcgcus8A1+9rAPYA"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180315122921.24520368@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bnSX5echcgcus8A1+9rAPYA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 15 Mar 2018 12:29:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the v4l-dvb tree got a conflict in:
>=20
>   drivers/media/platform/blackfin/bfin_capture.c
>=20
> between commit:
>=20
>   b9ec40bf7d29 ("media: platform: remove blackfin capture driver")
>=20
> from the asm-generic tree and commit:
>=20
>   4471109e3894 ("media: convert g/s_parm to g/s_frame_interval in subdevs=
")
>=20
> from the v4l-dvb tree.
>=20
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This conflict now exists between the v4l-dvb tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/bnSX5echcgcus8A1+9rAPYA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrECY0ACgkQAVBC80lX
0Gy0mQf9Ha/66Ac7LzKJJ+XRJE6KqI5HtIdKDyVkPP0RMpzHjFiCd+nFf4BcUQU1
LzcBndSFIoqwK8+LTkBQmr4MXRDJ6o6CzxKH8r3K8ppVC0RFksWxYtK9l4I+u+HK
FmjHho4oqYCLlQ6hlc4xlm9dowqESyl5rbnK2GBxzPXlnXvEdw87e2YI81konXlw
9yiTf2DT17r/WUO2LYba3BjRg3wNy/uQuV2bDhRwBy9TL+ez6qswst6UlDzpAxva
cIYiysb580VssSD+hV19ywA/vHQS/gG+mem57KcSB0CKz6WBYYrWC++dnIQJwDGk
C+9PyFPGayAR7Js/fuf0ZlKGkiCetA==
=DILR
-----END PGP SIGNATURE-----

--Sig_/bnSX5echcgcus8A1+9rAPYA--
