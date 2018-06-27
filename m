From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sunxi tree
Date: Thu, 28 Jun 2018 08:42:48 +1000
Message-ID: <20180628084248.3aa1b0fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QVywD+8YQ=QWUU4G1WaRUH/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>
List-Id: linux-next.vger.kernel.org

--Sig_/QVywD+8YQ=QWUU4G1WaRUH/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sunxi tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts:45:=
0:
arch/arm/boot/dts/sun8i-r40.dtsi:47:10: fatal error: dt-bindings/clock/sun8=
i-tcon-top.h: No such file or directory
 #include <dt-bindings/clock/sun8i-tcon-top.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts:44:=
0:
arch/arm/boot/dts/sun8i-r40.dtsi:47:10: fatal error: dt-bindings/clock/sun8=
i-tcon-top.h: No such file or directory
 #include <dt-bindings/clock/sun8i-tcon-top.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  2324106f7e43 ("ARM: dts: sun8i: r40: Add HDMI pipeline")

I have used the sunxi tree from next-20180627 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/QVywD+8YQ=QWUU4G1WaRUH/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls0EugACgkQAVBC80lX
0GyKAgf9G6RElfwsIoRjnob19TaASAOrs0aEjOf4Vv/TDeMtyutFrKSbC5X9JTSk
DXShui1BJ331UPmHSku4NKKEiJf+NHvYvC3ueUu03OJmpSvmIRIxqRFE+G62MwW8
cNp1XKVAC/xjQ0h5qVbxqx2/w3cp1Fd0+92LeSSTUvzjLqxcLqRkD65nYS9q57kJ
GN88NInHMp0bqkyxw41Gt+6kw4VT7XHCOEWYCpE0vkHsnBaBTIrz+wgT+L/0JUat
l0fgZbjLXQFZLowwgYknGyc1Hz5p1zHMGYbpFR+qfJdROmyi0m9WCtpqOOGeuwT9
Eyn8zS9Qjnn9d6A/hex7pzkxnRk96Q==
=Q7Pe
-----END PGP SIGNATURE-----

--Sig_/QVywD+8YQ=QWUU4G1WaRUH/--
