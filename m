Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3865941D210;
	Thu, 23 Jul 2026 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814113; cv=none; b=gEWRpSJIrP/bzcgWTZljNOddnEEPFI4v4xZyY1lwYqcOjWwrZLbQWECYZ1hgjmEgAO1IryvcoeiXoFY/nflCDS6TIhQLFmn176eOHidVwaZLKk59Nw+Cvihs2fxM5dsAh1dmZgJj+Xv8CgpPw+3+gY/gANFqOMu3MKPsE7pluQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814113; c=relaxed/simple;
	bh=sctifJ8yhQy9na7Pc1nL7On+udtabXDAx9nhFwcKqaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UviWc5qbMCbnCBH9Vd0N+8JsRNXOUd8No1nfxpuXOlNnCeOyHH6z9fMvATkhFJA9/Kt0MF2z6U4RPWf7cJbjF+CDAhfXLYV+DCd4lczBB26eheYpoLpQgOHwgryha17cOVa+Bf9CyK/SrH5fKDVbCSqXnG+/QuCFAbBmserxBPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94401F000E9;
	Thu, 23 Jul 2026 13:41:49 +0000 (UTC)
Date: Thu, 23 Jul 2026 14:41:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Will Deacon <will@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: linux-next: manual merge of the pci tree with the arm64 tree
Message-ID: <amIaGSRmZNeusA21@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1kkDofxQrthj+vZb"
Content-Disposition: inline


--1kkDofxQrthj+vZb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  arch/arm64/Kconfig

between commit:

  12aab25ca56ee ("arm64: errata: work around NVIDIA Olympus device store/lo=
ad ordering")

=66rom the arm64 tree and commit:

  a8818827486cd ("irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround=
")

=66rom the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/Kconfig
index fe807d72a3e7b,b9e17ce475e61..0000000000000
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@@ -1405,28 -1382,15 +1405,37 @@@ config NVIDIA_CARMEL_CNP_ERRATU
 =20
  	  If unsure, say Y.
 =20
 +config NVIDIA_OLYMPUS_1027_ERRATUM
 +	bool "NVIDIA Olympus: device store/load ordering erratum"
 +	default y
 +	help
 +	  This option adds an alternative code sequence to work around an
 +	  NVIDIA Olympus core erratum where a Device-nGnR* store can be
 +	  observed by a peripheral after a younger Device-nGnR* load to the
 +	  same peripheral. This breaks the program order that drivers rely
 +	  on for MMIO and can leave a device in an incorrect state.
 +
 +	  The workaround inserts a DMB OSH immediately before raw MMIO loads.
 +	  The erratum cannot occur when a DMB that orders loads appears
 +	  between the store and load, preventing the younger load from being
 +	  observed before the older store.
 +
 +	  The alternatives framework patches in DMB OSH only when an affected
 +	  CPU is detected. Other CPUs execute a NOP in its place. Disabling
 +	  this option leaves the original MMIO read instruction stream
 +	  unchanged.
 +
 +	  If unsure, say Y.
 +
+ config RENESAS_ERRATUM_GEN4GICITS1
+ 	bool "Renesas R-Car Gen4: GIC600 can not access physical addresses above=
 4 GiB"
+ 	default y
+ 	help
+ 	  The Renesas R-Car Gen4 S4/V4H/V4M GIC600 SoC integrations have AXI
+ 	  addressing limited to the first 32-bit of physical address space.
+=20
+ 	  If unsure, say Y.
+=20
  config ROCKCHIP_ERRATUM_3568002
  	bool "Rockchip 3568002: GIC600 can not access physical addresses higher =
than 4GB"
  	default y

--1kkDofxQrthj+vZb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpiGhkACgkQJNaLcl1U
h9B1Ggf/R5EvWiar7MCi3TsYSzokt5J59wzPFEjjPb6+B3cURF/lkhHblmm5Os88
BoaJqx4bJKnLgRurEtdbM4ux3f+XAZHTU7mqXFtPnvc+VGiGeKZA4jPuWlHbsDXT
9qom+EFKU4DNDw8+kIJNKAl/+gcBam+TtqeTau+lIp20egZLuDOnMcqUWry1EV07
pm48Q2gEDM8zV5APs0RzNdFtGidIRarJST73e7EInUEMj10BIr6PF3z0dVTTfL/3
DWCww48Mk9RP+AA8FDFlsmC6//RZWB7nFGbPXxUKBAw9LhdXqm3YD++3ozS0XKXt
Q2LK/dv1J2BbRVBK/C5E7TGxMHVhcw==
=xo8I
-----END PGP SIGNATURE-----

--1kkDofxQrthj+vZb--
