From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the imx-mxs tree
Date: Fri, 11 Jan 2019 09:56:05 +1100
Message-ID: <20190111095605.129a93a2@canb.auug.org.au>
References: <20190111093003.2f00829e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3O6vCmLnbnn1XwkAV/X4229"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111093003.2f00829e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lukasz Majewski <lukma@denx.de>
List-Id: linux-next.vger.kernel.org

--Sig_/3O6vCmLnbnn1XwkAV/X4229
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 11 Jan 2019 09:30:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the imx-mxs tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:

Actually this is only treated as a warning.

> arch/arm/boot/dts/vfxxx.dtsi:550.24-563.6: Warning (spi_bus_bridge): /soc=
/aips-bus@40080000/spi@400ad000: incorrect #address-cells for SPI bus
>   also defined at arch/arm/boot/dts/vf610-bk4.dts:130.8-142.3
> arch/arm/boot/dts/vf610-bk4.dtb: Warning (spi_bus_reg): Failed prerequisi=
te 'spi_bus_bridge'
>=20
>=20
> Caused by commit
>=20
>   cf91ce9696a0 ("ARM: dts: vf610-bk4: Provide support for reading ID code=
 from MVB device")
--=20
Cheers,
Stephen Rothwell

--Sig_/3O6vCmLnbnn1XwkAV/X4229
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw3zYUACgkQAVBC80lX
0Gx63gf+NdietG6AJEIFDCQcfz2tsug7WsnPbABOb980IYxHZKpC5HU520BDo+qk
FWzDAoBbLHjeB7rROA38yekr+MFW4SRVxq9EHX9HIzN4dafoxpcXqkcydnXxA62r
Xhb12s0PRdrrOMgPknh4gjUaOPv+/o6y83AxhgQgUOOkp5WFl3gGh24hKWq1Ybm+
Q9P93uI766V15pCOUykza+V4Ji0j8zW2kZ5U4qJd6rrH4FsnSXRu6nl9TRjJVof0
0B1rgKHFJJFaiZhIZVOE/IAarv5/mTUdMKuvQ9FBAko5NgPypBPmnz43UY6t6WyK
9LsMsceUDPz1ltjyGobg+sW3lo+y1g==
=7Jz+
-----END PGP SIGNATURE-----

--Sig_/3O6vCmLnbnn1XwkAV/X4229--
