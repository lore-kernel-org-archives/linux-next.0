From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the imx-mxs tree
Date: Fri, 11 Jan 2019 09:30:03 +1100
Message-ID: <20190111093003.2f00829e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mL+ddRtA3ixjl0kR+FYTqM2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lukasz Majewski <lukma@denx.de>
List-Id: linux-next.vger.kernel.org

--Sig_/mL+ddRtA3ixjl0kR+FYTqM2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

After merging the imx-mxs tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/boot/dts/vfxxx.dtsi:550.24-563.6: Warning (spi_bus_bridge): /soc/a=
ips-bus@40080000/spi@400ad000: incorrect #address-cells for SPI bus
  also defined at arch/arm/boot/dts/vf610-bk4.dts:130.8-142.3
arch/arm/boot/dts/vf610-bk4.dtb: Warning (spi_bus_reg): Failed prerequisite=
 'spi_bus_bridge'


Caused by commit

  cf91ce9696a0 ("ARM: dts: vf610-bk4: Provide support for reading ID code f=
rom MVB device")

--=20
Cheers,
Stephen Rothwell

--Sig_/mL+ddRtA3ixjl0kR+FYTqM2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw3x2sACgkQAVBC80lX
0GzjJAf+IHo5uMYfhpAD6bI4AnG1kIEHOoXUkIlDD5aiD5QjGRmEc+vOmMZ9Y/8+
c2COwfLc9gUnzwd01UnHVWoridLPkBDOBx5vvD6oHj9JCj4HzN8dV5E93MQ8CfVT
0qvRotV3ThwW7e3/fh8L+vqlldlmHUW30IrwwuIrupMKma479WnqCT9Z0yJkzVnr
0ol/D6FGB/A+Gee5ZVId5y5+YoUmPoB/tf+OdM1j+HMmAQNo8omH9qY2HCCHRy9x
W8fJk0cINAmIuRCv/zdDHeq2D5c3BDjsq5U6WjVGfhO6KnYh2jQwlxlamxQgjwRP
0CPci/GlE41ZMFb+r/9eQEuOhKsKRw==
=3Kag
-----END PGP SIGNATURE-----

--Sig_/mL+ddRtA3ixjl0kR+FYTqM2--
