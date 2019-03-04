From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound-asoc-fixes tree with the
 sound-current tree
Date: Tue, 5 Mar 2019 07:59:11 +1100
Message-ID: <20190305075911.4646469f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/x.X1z5=WVdk.2U_Dqj3ih82"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, Philipp Puschmann <philipp.puschmann@emlix.com>
List-Id: linux-next.vger.kernel.org

--Sig_/x.X1z5=WVdk.2U_Dqj3ih82
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc-fixes tree got a conflict in:

  sound/soc/codecs/tlv320aic3x.c

between commit:

  0bb423f2eaaf ("ASoC: regulator notifier registration should be managed")

from the sound-current tree and commit:

  82ad759143ed ("ASoC: tlv320aic3x: fix reset gpio reference counting")

from the sound-asoc-fixes tree.

I fixed it up (I just used the former version which removed some code
modified by the latter) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/x.X1z5=WVdk.2U_Dqj3ih82
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx9kZ8ACgkQAVBC80lX
0Gx/cgf/epAT/agx2etvDB6rR4dUrgYKxIqCmoSdfY+6uw4wv3v0Z5FJaJOiT//S
PAMUHoyrg1R4hPbsVdfkV7a7yRzGHEchyp4eF7IwiT+bT4Yz0toU1qYJIbmImBVb
RjkSvXmL/rlt+y0DlPnAF8Wua5C0qd610u2nWQ5vF2SfwojS98tNVk438SSQapNT
2bm+67G+EJqd4wqB29w+8mQf97imr2te7QfKYCLG9o4Qp7BMQ+/z4PrO6EzvKR9u
GJmRjq4sjo6Kbjn5L2EKjWOvw8qnzOILvmgpfxVpgmesV8Gme+avxCuoT5lFgcPd
IOKim1+SP+tQJBwwv+MQWzRCyCji1Q==
=rqbK
-----END PGP SIGNATURE-----

--Sig_/x.X1z5=WVdk.2U_Dqj3ih82--
