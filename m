Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8E5371D1D;
	Mon,  6 Apr 2026 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481214; cv=none; b=X8Yx9rmC7K0tdsk3aSQ/IQBr5ddTkTNyvF0CglTnMjHSjrEp8KzsN8QEo1sckM6jcBw/0cga5wUB9k1y4dhh9B4tf5ZR9YyJQALiWuy6kYYJGSbdqqsqrTAQ/bGkieU68UoDD7OpRg5AXBVHO4RMsrknpsHXbWtPd33lb5SH6f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481214; c=relaxed/simple;
	bh=9+LWmFqdpv6XePd201U/NB3JAw0sqoKlGs0YwGEvc0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fHFJU9ykvgHJYCjhrqIDVSBDG6cY/rEOlyqs2zkxPfafZvOgFkSxqm9+ahX/rsK/oFDqtwGrk9AqTT25VuBDWbnJFE7RkYn+r7lVCg6k7CGDggcaFdbslBTUQLJjzIVfC24rfczG+g3+LRHlPBl8HBRm0DzGhSGoa+RhfcUZArM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPp3YGeS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPp3YGeS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908F3C4CEF7;
	Mon,  6 Apr 2026 13:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775481213;
	bh=9+LWmFqdpv6XePd201U/NB3JAw0sqoKlGs0YwGEvc0k=;
	h=Date:From:To:Cc:Subject:From;
	b=uPp3YGeSsK2yfuhmH389Tu9rW3v4KRD7Hug3Wo1J5hUm2YdkCSKsNoTtqCkOcflIu
	 nnmtbtgIZ8cZsE1hhPHeIdZXpgJwi1Y/+/XkEzeKO04JDC17W/OkGcozz5cwInRuN4
	 f0iyTRuT48mFg6VsuZyAw939ODjZTKvFoHd8GARWFBsW1R4uWkXXTJ5Ekn8r/nYbJI
	 gucam/E0UhbSG4E7QfqWJYvolerXUe6vQAbWPR/56i1EGeFA65yBovpeoaWEDZLb+a
	 Nm92OoT2eLOTeqoDgcjbkvrsiz15YGg0+fu51Phwy8CcwcT2HRofW8VFI8tWCp+QMi
	 JXV+AFkspMUkw==
Date: Mon, 6 Apr 2026 14:13:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Colin Cross <ccross@android.com>, Thierry Reding <treding@nvidia.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Prathamesh Shete <pshete@nvidia.com>
Subject: linux-next: manual merge of the tegra tree with the arm-soc tree
Message-ID: <adOxeSdPWqVgZDco@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TG4+Sa3pcu3uXBbG"
Content-Disposition: inline


--TG4+Sa3pcu3uXBbG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tegra tree got a conflict in:

  arch/arm64/boot/dts/nvidia/tegra264.dtsi

between commits:

  06c3b6c594625 ("arm64: tegra: Add PCI controllers on Tegra264")
  c70e6bc11d200 ("arm64: tegra: Add Tegra264 GPIO controllers")

=66rom the arm-soc tree and commit:

  a8f1bb8f13e8d ("arm64: tegra: Add Tegra264 GPIO controllers")

=66rom the tegra tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 06d8357bdf527,04d6ad60bcc41..0000000000000
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@@ -32,7 -32,7 +32,7 @@@
  		#address-cells =3D <2>;
  		#size-cells =3D <2>;
 =20
 -		ranges =3D <0x00 0x00000000 0x00 0x00000000 0x01 0x00000000>;
 +		ranges =3D <0x00 0x00000000 0x00 0x00000000 0x00 0x20000000>; /* MMIO (=
512 MiB) */
 =20
  		misc@100000 {
  			compatible =3D "nvidia,tegra234-misc";
@@@ -3416,10 -3416,9 +3416,10 @@@
  		#address-cells =3D <2>;
  		#size-cells =3D <2>;
 =20
 -		ranges =3D <0x00 0x00000000 0x81 0x00000000 0x01 0x00000000>, /* MMIO */
 -			 <0x01 0x00000000 0x00 0x20000000 0x00 0x40000000>, /* non-prefetchabl=
e memory (32-bit) */
 -			 <0x02 0x00000000 0xd0 0x00000000 0x08 0x80000000>; /* ECAM, prefetcha=
ble memory, I/O */
 +		ranges =3D <0x00 0x00000000 0x81 0x00000000 0x00 0x20000000>, /* MMIO (=
512 MiB) */
 +			 <0x00 0x20000000 0x00 0x20000000 0x00 0x20000000>, /* non-prefetchabl=
e memory (32-bit, 512 MiB) */
 +			 <0x00 0x40000000 0x81 0x40000000 0x00 0x20000000>, /* MMIO (512 MiB) =
*/
 +			 <0xa8 0x80000000 0xa8 0x80000000 0x57 0x80000000>; /* I/O, ECAM, pref=
etchable memory (64-bit) */
 =20
  		smmu1: iommu@5000000 {
  			compatible =3D "nvidia,tegra264-smmu", "arm,smmu-v3";
@@@ -3463,23 -3462,23 +3463,23 @@@
 =20
  		mc: memory-controller@8020000 {
  			compatible =3D "nvidia,tegra264-mc";
 -			reg =3D <0x00 0x8020000 0x0 0x20000>, /* MC broadcast */
 -			      <0x00 0x8040000 0x0 0x20000>, /* MC  0 */
 -			      <0x00 0x8060000 0x0 0x20000>, /* MC  1 */
 -			      <0x00 0x8080000 0x0 0x20000>, /* MC  2 */
 -			      <0x00 0x80a0000 0x0 0x20000>, /* MC  3 */
 -			      <0x00 0x80c0000 0x0 0x20000>, /* MC  4 */
 -			      <0x00 0x80e0000 0x0 0x20000>, /* MC  5 */
 -			      <0x00 0x8100000 0x0 0x20000>, /* MC  6 */
 -			      <0x00 0x8120000 0x0 0x20000>, /* MC  7 */
 -			      <0x00 0x8140000 0x0 0x20000>, /* MC  8 */
 -			      <0x00 0x8160000 0x0 0x20000>, /* MC  9 */
 -			      <0x00 0x8180000 0x0 0x20000>, /* MC 10 */
 -			      <0x00 0x81a0000 0x0 0x20000>, /* MC 11 */
 -			      <0x00 0x81c0000 0x0 0x20000>, /* MC 12 */
 -			      <0x00 0x81e0000 0x0 0x20000>, /* MC 13 */
 -			      <0x00 0x8200000 0x0 0x20000>, /* MC 14 */
 -			      <0x00 0x8220000 0x0 0x20000>; /* MC 15 */
 +			reg =3D <0x000 0x8020000 0x0 0x20000>, /* MC broadcast */
 +			      <0x000 0x8040000 0x0 0x20000>, /* MC  0 */
 +			      <0x000 0x8060000 0x0 0x20000>, /* MC  1 */
 +			      <0x000 0x8080000 0x0 0x20000>, /* MC  2 */
 +			      <0x000 0x80a0000 0x0 0x20000>, /* MC  3 */
 +			      <0x000 0x80c0000 0x0 0x20000>, /* MC  4 */
 +			      <0x000 0x80e0000 0x0 0x20000>, /* MC  5 */
 +			      <0x000 0x8100000 0x0 0x20000>, /* MC  6 */
 +			      <0x000 0x8120000 0x0 0x20000>, /* MC  7 */
 +			      <0x000 0x8140000 0x0 0x20000>, /* MC  8 */
 +			      <0x000 0x8160000 0x0 0x20000>, /* MC  9 */
 +			      <0x000 0x8180000 0x0 0x20000>, /* MC 10 */
 +			      <0x000 0x81a0000 0x0 0x20000>, /* MC 11 */
 +			      <0x000 0x81c0000 0x0 0x20000>, /* MC 12 */
 +			      <0x000 0x81e0000 0x0 0x20000>, /* MC 13 */
 +			      <0x000 0x8200000 0x0 0x20000>, /* MC 14 */
 +			      <0x000 0x8220000 0x0 0x20000>; /* MC 15 */
  			reg-names =3D "broadcast", "ch0", "ch1", "ch2", "ch3",
  				    "ch4", "ch5", "ch6", "ch7", "ch8", "ch9",
  				    "ch10", "ch11", "ch12", "ch13", "ch14",
@@@ -3498,12 -3497,12 +3498,12 @@@
  			#size-cells =3D <2>;
 =20
  			/* limit the DMA range for memory clients to [39:0] */
 -			dma-ranges =3D <0x0 0x0 0x0 0x0 0x100 0x0>;
 +			dma-ranges =3D <0x000 0x0 0x000 0x0 0x100 0x0>;
 =20
  			emc: external-memory-controller@8800000 {
  				compatible =3D "nvidia,tegra264-emc";
 -				reg =3D <0x00 0x8800000 0x0 0x20000>,
 -				      <0x00 0x8890000 0x0 0x20000>;
 +				reg =3D <0x000 0x8800000 0x0 0x20000>,
 +				      <0x000 0x8890000 0x0 0x20000>;
  				interrupts =3D <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
  				clocks =3D <&bpmp TEGRA264_CLK_EMC>,
  					 <&bpmp TEGRA264_CLK_DBB_UPHY0>;
@@@ -3554,38 -3553,6 +3554,38 @@@
  			status =3D "disabled";
  		};
 =20
 +		pci@c000000 {
 +			compatible =3D "nvidia,tegra264-pcie";
 +			reg =3D <0xd0 0xb0000000 0x0 0x10000000>,
 +			      <0x00 0x0c000000 0x0 0x00004000>,
 +			      <0x00 0x0c004000 0x0 0x00001000>,
 +			      <0x00 0x0c005000 0x0 0x00001000>;
 +			reg-names =3D "ecam", "xal", "xtl", "xtl-pri";
 +			#address-cells =3D <3>;
 +			#size-cells =3D <2>;
 +			device_type =3D "pci";
 +			linux,pci-domain =3D <0x00>;
 +			#interrupt-cells =3D <0x1>;
 +
 +			interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
 +			interrupt-map =3D <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 155 IRQ_TYPE_LEVEL=
_HIGH>,
 +					<0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 156 IRQ_TYPE_LEVEL_HIGH>,
 +					<0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 157 IRQ_TYPE_LEVEL_HIGH>,
 +					<0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 158 IRQ_TYPE_LEVEL_HIGH>;
 +
 +			iommu-map =3D <0x0 &smmu2 0x10000 0x10000>;
 +			msi-map =3D <0x0 &its 0x210000 0x10000>;
 +			dma-coherent;
 +
 +			ranges =3D <0x81000000 0x00 0x84000000 0xd0 0x84000000 0x00 0x00200000=
>, /* I/O */
 +				 <0x82000000 0x00 0x20000000 0x00 0x20000000 0x00 0x08000000>, /* non=
-prefetchable memory (128 MiB) */
 +				 <0xc3000000 0xd0 0xc0000000 0xd0 0xc0000000 0x07 0xc0000000>; /* pre=
fetchable memory */
 +			bus-range =3D <0x0 0xff>;
 +
 +			nvidia,bpmp =3D <&bpmp 0>;
 +			status =3D "disabled";
 +		};
 +
  		i2c14: i2c@c410000 {
  			compatible =3D "nvidia,tegra264-i2c";
  			reg =3D <0x00 0x0c410000 0x0 0x10000>;
@@@ -3813,7 -3780,7 +3813,7 @@@
  		#address-cells =3D <2>;
  		#size-cells =3D <2>;
 =20
 -		ranges =3D <0x00 0x00000000 0x88 0x00000000 0x01 0x00000000>;
 +		ranges =3D <0x00 0x00000000 0x88 0x00000000 0x00 0x20000000>; /* MMIO (=
512 MiB) */
 =20
  		smmu3: iommu@6000000 {
  			compatible =3D "nvidia,tegra264-smmu", "arm,smmu-v3";
@@@ -3858,9 -3825,8 +3858,9 @@@
  		#address-cells =3D <2>;
  		#size-cells =3D <2>;
 =20
 -		ranges =3D <0x00 0x00000000 0xa8 0x00000000 0x40 0x00000000>, /* MMIO, =
ECAM, prefetchable memory, I/O */
 -			 <0x80 0x00000000 0x00 0x20000000 0x00 0x40000000>; /* non-prefetchabl=
e memory (32-bit) */
 +		ranges =3D <0x00 0x00000000 0xa8 0x00000000 0x00 0x20000000>, /* MMIO (=
512 MiB) */
 +			 <0x00 0x20000000 0x00 0x20000000 0x00 0x60000000>, /* non-prefetchabl=
e memory (32-bit, 1536 GiB) */
 +			 <0xa8 0x80000000 0xa8 0x80000000 0x57 0x80000000>; /* I/O, ECAM, pref=
etchable memory (64-bit) */
 =20
  		gpio_uphy: gpio@8300000 {
  			compatible =3D "nvidia,tegra264-gpio-uphy";
@@@ -3889,166 -3855,6 +3889,166 @@@
  			interrupt-controller;
  			#interrupt-cells =3D <2>;
  		};
 +
 +		pci@8400000 {
 +			compatible =3D "nvidia,tegra264-pcie";
 +			reg =3D <0xa8 0xb0000000 0x0 0x10000000>,
 +			      <0x00 0x08400000 0x0 0x00004000>,
 +			      <0x00 0x08404000 0x0 0x00001000>,
 +			      <0x00 0x08405000 0x0 0x00001000>,
 +			      <0x00 0x08410000 0x0 0x00010000>;
 +			reg-names =3D "ecam", "xal", "xtl", "xtl-pri", "xpl";
 +			#address-cells =3D <3>;
 +			#size-cells =3D <2>;
 +			device_type =3D "pci";
 +			linux,pci-domain =3D <0x01>;
 +			#interrupt-cells =3D <1>;
 +			interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
 +			interrupt-map =3D <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 908 IRQ_TYPE_LEVEL=
_HIGH>, /* INTA */
 +					<0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 909 IRQ_TYPE_LEVEL_HIGH>, /* INTB =
*/
 +					<0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 910 IRQ_TYPE_LEVEL_HIGH>, /* INTC =
*/
 +					<0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 911 IRQ_TYPE_LEVEL_HIGH>; /* INTD =
*/
 +
 +			iommu-map =3D <0x0 &smmu1 0x10000 0x10000>;
 +			msi-map =3D <0x0 &its 0x110000 0x10000>;
 +			dma-coherent;
 +
 +			ranges =3D <0x81000000 0x00 0x84000000 0xa8 0x84000000 0x00 0x00200000=
>, /* I/O */
 +				 <0x82000000 0x00 0x28000000 0x00 0x28000000 0x00 0x08000000>, /* non=
-prefetchable memory */
 +				 <0xc3000000 0xa8 0xc0000000 0xa8 0xc0000000 0x07 0xc0000000>; /* pre=
fetchable memory */
 +			bus-range =3D <0x00 0xff>;
 +
 +			nvidia,bpmp =3D <&bpmp 1>;
 +			status =3D "disabled";
 +		};
 +
 +		pci@8420000 {
 +			compatible =3D "nvidia,tegra264-pcie";
 +			reg =3D <0xb0 0xb0000000 0x0 0x10000000>,
 +			      <0x00 0x08420000 0x0 0x00004000>,
 +			      <0x00 0x08424000 0x0 0x00001000>,
 +			      <0x00 0x08425000 0x0 0x00001000>,
 +			      <0x00 0x08430000 0x0 0x00010000>;
 +			reg-names =3D "ecam", "xal", "xtl", "xtl-pri", "xpl";
 +			#address-cells =3D <3>;
 +			#size-cells =3D <2>;
 +			device_type =3D "pci";
 +			linux,pci-domain =3D <0x02>;
 +			#interrupt-cells =3D <1>;
 +			interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
 +			interrupt-map =3D <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 917 IRQ_TYPE_LEVEL=
_HIGH>, /* INTA */
 +					<0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 918 IRQ_TYPE_LEVEL_HIGH>, /* INTB =
*/
 +					<0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 919 IRQ_TYPE_LEVEL_HIGH>, /* INTC =
*/
 +					<0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 920 IRQ_TYPE_LEVEL_HIGH>; /* INTD =
*/
 +
 +			iommu-map =3D <0x0 &smmu1 0x20000 0x10000>;
 +			msi-map =3D <0x0 &its 0x120000 0x10000>;
 +			dma-coherent;
 +
 +			ranges =3D <0x81000000 0x00 0x84000000 0xb0 0x84000000 0x00 0x00200000=
>, /* I/O */
 +				 <0x82000000 0x00 0x30000000 0x00 0x30000000 0x00 0x08000000>, /* non=
-prefetchable memory */
 +				 <0xc3000000 0xb0 0xc0000000 0xb0 0xc0000000 0x07 0xc0000000>; /* pre=
fetchable memory */
 +			bus-range =3D <0x00 0xff>;
 +
 +			nvidia,bpmp =3D <&bpmp 2>;
 +			status =3D "disabled";
 +		};
 +
 +		pci@8440000 {
 +			compatible =3D "nvidia,tegra264-pcie";
 +			reg =3D <0xb8 0xb0000000 0x0 0x10000000>,
 +			      <0x00 0x08440000 0x0 0x00004000>,
 +			      <0x00 0x08444000 0x0 0x00001000>,
 +			      <0x00 0x08445000 0x0 0x00001000>,
 +			      <0x00 0x08450000 0x0 0x00010000>;
 +			reg-names =3D "ecam", "xal", "xtl", "xtl-pri", "xpl";
 +			#address-cells =3D <3>;
 +			#size-cells =3D <2>;
 +			device_type =3D "pci";
 +			linux,pci-domain =3D <0x03>;
 +			#interrupt-cells =3D <1>;
 +			interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
 +			interrupt-map =3D <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 926 IRQ_TYPE_LEVEL=
_HIGH>, /* INTA */
 +					<0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 927 IRQ_TYPE_LEVEL_HIGH>, /* INTB =
*/
 +					<0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 928 IRQ_TYPE_LEVEL_HIGH>, /* INTC =
*/
 +					<0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 929 IRQ_TYPE_LEVEL_HIGH>; /* INTD =
*/
 +
 +			iommu-map =3D <0x0 &smmu1 0x30000 0x10000>;
 +			msi-map =3D <0x0 &its 0x130000 0x10000>;
 +			dma-coherent;
 +
 +			ranges =3D <0x81000000 0x00 0x84000000 0xb8 0x84000000 0x00 0x00200000=
>, /* I/O */
 +				 <0x82000000 0x00 0x38000000 0x00 0x38000000 0x00 0x08000000>, /* non=
-prefetchable memory */
 +				 <0xc3000000 0xb8 0xc0000000 0xb8 0xc0000000 0x07 0xc0000000>; /* pre=
fetchable memory */
 +			bus-range =3D <0x00 0xff>;
 +
 +			nvidia,bpmp =3D <&bpmp 3>;
 +			status =3D "disabled";
 +		};
 +
 +		pci@8460000 {
 +			compatible =3D "nvidia,tegra264-pcie";
 +			reg =3D <0xc0 0xb0000000 0x0 0x10000000>,
 +			      <0x00 0x08460000 0x0 0x00004000>,
 +			      <0x00 0x08464000 0x0 0x00001000>,
 +			      <0x00 0x08465000 0x0 0x00001000>,
 +			      <0x00 0x08470000 0x0 0x00010000>;
 +			reg-names =3D "ecam", "xal", "xtl", "xtl-pri", "xpl";
 +			#address-cells =3D <3>;
 +			#size-cells =3D <2>;
 +			device_type =3D "pci";
 +			linux,pci-domain =3D <0x04>;
 +			#interrupt-cells =3D <1>;
 +			interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
 +			interrupt-map =3D <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 935 IRQ_TYPE_LEVEL=
_HIGH>, /* INTA */
 +					<0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 936 IRQ_TYPE_LEVEL_HIGH>, /* INTB =
*/
 +					<0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 937 IRQ_TYPE_LEVEL_HIGH>, /* INTC =
*/
 +					<0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 938 IRQ_TYPE_LEVEL_HIGH>; /* INTD =
*/
 +
 +			iommu-map =3D <0x0 &smmu1 0x40000 0x10000>;
 +			msi-map =3D <0x0 &its 0x140000 0x10000>;
 +			dma-coherent;
 +
 +			ranges =3D <0x81000000 0x00 0x84000000 0xc0 0x84000000 0x00 0x00200000=
>, /* I/O */
 +				 <0x82000000 0x00 0x40000000 0x00 0x40000000 0x00 0x08000000>, /* non=
-prefetchable memory */
 +				 <0xc3000000 0xc0 0xc0000000 0xc0 0xc0000000 0x07 0xc0000000>; /* pre=
fetchable memory */
 +			bus-range =3D <0x00 0xff>;
 +
 +			nvidia,bpmp =3D <&bpmp 4>;
 +			status =3D "disabled";
 +		};
 +
 +		pci@8480000 {
 +			compatible =3D "nvidia,tegra264-pcie";
 +			reg =3D <0xc8 0xb0000000 0x0 0x10000000>,
 +			      <0x00 0x08480000 0x0 0x00004000>,
 +			      <0x00 0x08484000 0x0 0x00001000>,
 +			      <0x00 0x08485000 0x0 0x00001000>,
 +			      <0x00 0x08490000 0x0 0x00010000>;
 +			reg-names =3D "ecam", "xal", "xtl", "xtl-pri", "xpl";
 +			#address-cells =3D <3>;
 +			#size-cells =3D <2>;
 +			device_type =3D "pci";
 +			linux,pci-domain =3D <0x05>;
 +			#interrupt-cells =3D <1>;
 +			interrupt-map-mask =3D <0x0 0x0 0x0 0x7>;
 +			interrupt-map =3D <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 944 IRQ_TYPE_LEVEL=
_HIGH>, /* INTA */
 +					<0x0 0x0 0x0 0x2 &gic 0x0 0x0 0x0 945 IRQ_TYPE_LEVEL_HIGH>, /* INTB =
*/
 +					<0x0 0x0 0x0 0x3 &gic 0x0 0x0 0x0 946 IRQ_TYPE_LEVEL_HIGH>, /* INTC =
*/
 +					<0x0 0x0 0x0 0x4 &gic 0x0 0x0 0x0 947 IRQ_TYPE_LEVEL_HIGH>; /* INTD =
*/
 +
 +			iommu-map =3D <0x0 &smmu1 0x50000 0x10000>;
 +			msi-map =3D <0x0 &its 0x150000 0x10000>;
 +			dma-coherent;
 +
 +			ranges =3D <0x81000000 0x00 0x84000000 0xc8 0x84000000 0x00 0x00200000=
>, /* I/O */
 +				 <0x82000000 0x00 0x48000000 0x00 0x48000000 0x00 0x08000000>, /* non=
-prefetchable memory */
 +				 <0xc3000000 0xc8 0xc0000000 0xc8 0xc0000000 0x07 0xc0000000>; /* pre=
fetchable memory */
 +			bus-range =3D <0x00 0xff>;
 +
 +			nvidia,bpmp =3D <&bpmp 5>;
 +			status =3D "disabled";
 +		};
  	};
 =20
  	cpus {

--TG4+Sa3pcu3uXBbG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTsXkACgkQJNaLcl1U
h9AocAgAhaodUqrYntu2RX7W+GTjW1262W1K/kShW7Zdah70FrdyAUHiXFsfyW0+
e/pboEROztAPeEYjTinVBGux37p642aIBbEIzgb2aNkEzBd984YuGm7VWpQ3auYS
+X2x/5OecbKU2Af9r52+g+kMpZj89xrypDy2O/bCpnKOhYebsDMwutSG3+L+QEdS
De5qNgiFWPSLn7yalEjZBrDbZ6YaMw9i9ePt+eLdz5WQ2oyaMGN8BJhHPUTq4xMj
MOI7Jh8Ox6VBnemIBLa4+fzG6FBO8cV7CrnC3tLRIjZZPVUeBDg/umhDpzA0I+kY
7e7fanKhADdxjtaMsk7c6VV3sH2z8g==
=fW1t
-----END PGP SIGNATURE-----

--TG4+Sa3pcu3uXBbG--
