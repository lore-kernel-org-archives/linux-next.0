From: Lukasz Majewski <lukma@denx.de>
Subject: Re: linux-next: build failure after merge of the imx-mxs tree
Date: Fri, 11 Jan 2019 00:15:59 +0100
Message-ID: <20190111001559.12d91530@jawa>
References: <20190111093003.2f00829e@canb.auug.org.au>
        <20190111095605.129a93a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QVj=FuFKawjdAOpl/CuZ5sV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111095605.129a93a2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shawn Guo <shawn.guo@linaro.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/QVj=FuFKawjdAOpl/CuZ5sV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

> Hi all,
>=20
> On Fri, 11 Jan 2019 09:30:03 +1100 Stephen Rothwell
> <sfr@canb.auug.org.au> wrote:
> >
> > After merging the imx-mxs tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this: =20
>=20
> Actually this is only treated as a warning.

Thanks for the notification. I will look on that (soon).

>=20
> > arch/arm/boot/dts/vfxxx.dtsi:550.24-563.6: Warning
> > (spi_bus_bridge): /soc/aips-bus@40080000/spi@400ad000: incorrect
> > #address-cells for SPI bus also defined at
> > arch/arm/boot/dts/vf610-bk4.dts:130.8-142.3
> > arch/arm/boot/dts/vf610-bk4.dtb: Warning (spi_bus_reg): Failed
> > prerequisite 'spi_bus_bridge'
> >=20
> >=20
> > Caused by commit
> >=20
> >   cf91ce9696a0 ("ARM: dts: vf610-bk4: Provide support for reading
> > ID code from MVB device") =20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/QVj=FuFKawjdAOpl/CuZ5sV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlw30jAACgkQAR8vZIA0
zr0xHgf/ZmcfVOGZ+UKqY3/XZ3n1aFmtRECfyNW0XZ20AXPaHU6ui0c71qA4XY6l
xCjhW0o4hmIWRLToZvKzTO+bUfj+3u68P9ABvHZXjlqP1ITa3dpi1ldtD8tzftH1
cX9WIjG3iEeet39ajUFziUI2lS2yVtJc7np2Pl3UpwMDnUiTTlhtbpYaJ2EXtWv4
6mLvS2ov6hPXz6FaN9nAKQy5f/uYNymlOIOkpnqmucWSxbGVU96bWre32p4sbs4G
1XPh1JPkpOjyrc6xrSbVQkaWWeqQQqxT9SPrBtEaRwK6vaJwToG39am9Nf31HbME
UzJSJa70Dd/pKNatBhaEcV+Mr3/h6A==
=6cAi
-----END PGP SIGNATURE-----

--Sig_/QVj=FuFKawjdAOpl/CuZ5sV--
