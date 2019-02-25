From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound tree with the arm-soc tree
Date: Mon, 25 Feb 2019 12:36:15 +1100
Message-ID: <20190225123615.49bce7cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gOUuL6Xp8A/fATV3sl+Fm2t"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

--Sig_/gOUuL6Xp8A/fATV3sl+Fm2t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next merge of the sound tree got conflicts in:

  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi

between commits:

  5eef17ee764d ("arm64: tegra: p2972: Sort nodes properly")
  be4f0dd347ad ("arm64: tegra: p2597: Sort nodes by unit-address")

from the arm-soc tree and commit:

  11ce4308307c ("arm64: tegra: custom name for hda sound card")

from the sound tree.

I fixed it up (see below - in tegra194-p2972-0000.dts. the line added
just needed to be moved up a few lines) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 34a7044927fd,39c616737232..000000000000
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
diff --cc arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 8780b5b3d2b9,6096dfb7e17a..000000000000
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@@ -1317,15 -1303,6 +1317,16 @@@
  		clock-frequency =3D <100000>;
  	};
 =20
 +	sata@70020000 {
 +		status =3D "okay";
 +		phys =3D <&{/padctl@7009f000/pads/sata/lanes/sata-0}>;
 +	};
 +
 +	hda@70030000 {
++		nvidia,model =3D "jetson-tx1-hda";
 +		status =3D "okay";
 +	};
 +
  	usb@70090000 {
  		phys =3D <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>,
  		       <&{/padctl@7009f000/pads/usb2/lanes/usb2-1}>,

--Sig_/gOUuL6Xp8A/fATV3sl+Fm2t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxzRo8ACgkQAVBC80lX
0GwojQf/axAwG3MvV2YIiXYaY4KBVgwJ8snq1sGpPg1o3rEOz7ykmsKRHTKXT2nV
u4LWA3nV7wJfFBk+r5CzV3gin4WVnaALVwByfHajr/cm3HKgLYQ7bIDRszV7CTUI
zowX38D7+oYbKVTjOYGs7ET/3u+3q+IKLS8frBt3YLHntkuz6/xXADt2u7v2sEVO
EAO4ru6wQ647NFMJroPUDhsNYULHyjPizvDy0Ii0Kg8lj2Cor8q4xiN79Z314CZb
9FLBj+YhEjygYRKUU8uXuPGFzzI4JxV2VMSTxH8e7gBMk9vw4wakPLNquzCUlA2k
gJv6w966C3F8M5sqf2F3nulFp8ptOA==
=iJlS
-----END PGP SIGNATURE-----

--Sig_/gOUuL6Xp8A/fATV3sl+Fm2t--
