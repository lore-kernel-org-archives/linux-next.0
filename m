From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the spi tree
Date: Tue, 29 Jan 2019 19:26:58 +1100
Message-ID: <20190129192658.72c88d0b@canb.auug.org.au>
References: <20190129130237.677e5ac8@canb.auug.org.au>
        <VI1PR04MB57262F1ADEEC151C11E0F48499970@VI1PR04MB5726.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nR.wLo.BV8Z2hlBxcL3ZgDf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB57262F1ADEEC151C11E0F48499970@VI1PR04MB5726.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frieder Schrempf <frieder.schrempf@kontron.de>, Boris Brezillon <bbrezillon@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/nR.wLo.BV8Z2hlBxcL3ZgDf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Yogesh,

On Tue, 29 Jan 2019 06:57:51 +0000 Yogesh Narayan Gaur <yogeshnarayan.gaur@=
nxp.com> wrote:
>
> > WARNING: modpost: missing MODULE_LICENSE() in drivers/spi/spi-nxp-fspi.o
> > see include/linux/module.h for more information
> >  =20
> Can someone help in pointing out that why above warning message is coming=
 for mentioned commit.
> Below MODULE_LICENSE string is present in the above mentioned file, drive=
rs/spi/spi-nxp-fspi.c.
>     MODULE_LICENSE("GPL v2");

The version in linux-next has no such line.

--=20
Cheers,
Stephen Rothwell

--Sig_/nR.wLo.BV8Z2hlBxcL3ZgDf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxQDlIACgkQAVBC80lX
0GwMyAgAlaxhXi/RTWjS/ke601GBHyLuVCuVlpvtFGJKsTUynKb9Q7MKSRMCUe1i
HRUSgcXihvAE3iCJVOcx0zgV8XqeG0X11G0x9l2QzZ/4LXqnFlynHD7fWGynDTf0
deDR6znEwfiaKzQ4eAuSz0QLMjwELAd/kwdbVzkAkDhk8nJ82dlF9d6o2eJ95GUj
Bo8Z2Fdt/zKGkzQSWK6l2BjsCV8prwvONiqxm8FiqkDwBZ8Z80QYmiDWjralR/Ko
4vcn+SNje0qR62QWojdg8hhrpLDjpVbo0i4KunKgblf+FuSX5BaAZhww++hgSQCQ
s7NeqH7wI+D4MhRookiF/Ydj/UQYMg==
=bDbJ
-----END PGP SIGNATURE-----

--Sig_/nR.wLo.BV8Z2hlBxcL3ZgDf--
