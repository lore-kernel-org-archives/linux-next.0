Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F06480954;
	Mon, 18 May 2026 13:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109586; cv=none; b=CHZ5fIw1kfh/bEZYyibXXJlq1yycZuhB9hMEyZR5x3GoS3xMBPZMER+0UJTj+Q9hEb0IoLsI0N2uYjZyYIA3YbOzsCBxahdKYXOOuP1lcFPnjCP6WlrRPT+bu/2hcFqNkxf9arvwo8F+nJqqmBj/B0MBuYknKLQ/9vgCbALsu4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109586; c=relaxed/simple;
	bh=Gqnubf+DmyZ9CZM57OASE8VBPLtadn3ZAoNtTndT/N0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TQzXzTzCuN7+ptm7OrM1womEEu4/vYpUGnwPYyDDflLxM9wMIT0yGxSTbF2ZTvwzzUgoIhfC3rmeopYBmwB/bMO4snKEOWqtk1MwDbmXoltIYchWYpvipifw4ubnGqob9dqybQXVcMVHitcnahZln61xSziHh/48gog7eY14fhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MK1ch8uN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MK1ch8uN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763C9C2BCB8;
	Mon, 18 May 2026 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779109586;
	bh=Gqnubf+DmyZ9CZM57OASE8VBPLtadn3ZAoNtTndT/N0=;
	h=Date:From:To:Cc:Subject:From;
	b=MK1ch8uNyVzML/rtq0+o4vgcKRyT2xLII3Uqp7LmSjRyph9pisDhdSdGqw3J3F77O
	 AvKnZBF9EAVmC09Cr2gE9WO5NaPs4B2VXOp5sqGrSKX7RLnPVhFWXdg35Yp6lMfoNM
	 9fAuNUHmJs3RqyHaJXvIxwcbiz7IIxtDtFdgAJsdB4xCgv9DfpgETzpiaQJjamGOLQ
	 X+KByksKrAyCRMWCjWtHgBBbDUSpby5MLy6WE7EO/ykJfZSR+3Ywt6PnEVmNzVb+ex
	 PG3bALZt1uf5uluDSC4d+FiglVJ7eJzIskZI+NEQO80CK2n/xlWiW9ZzUCvSoeXKIp
	 WcRjH0yyeBwbg==
Date: Mon, 18 May 2026 14:06:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iommu tree with the arm-soc tree
Message-ID: <agsOzbfiOszzuUvk@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ywywoAFiPisJuGgC"
Content-Disposition: inline


--ywywoAFiPisJuGgC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iommu tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  f54f7979ff88d ("arm64: defconfig: Move entries to match savedefconfig")

=66rom the arm-soc tree and commit:

  187029b922d0e ("arm64: defconfig: enable Verisilicon IOMMU for Rockchip R=
K3588")

=66rom the iommu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/configs/defconfig
index 9f00e2823ccb6,2755960fce06a..0000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -1587,22 -1608,23 +1587,23 @@@ CONFIG_RENESAS_OSTM=3D
  CONFIG_ARM_MHU=3Dy
  CONFIG_EXYNOS_MBOX=3Dm
  CONFIG_IMX_MBOX=3Dy
 -CONFIG_OMAP2PLUS_MBOX=3Dm
  CONFIG_PLATFORM_MHU=3Dy
 +CONFIG_OMAP2PLUS_MBOX=3Dm
  CONFIG_BCM2835_MBOX=3Dy
  CONFIG_QCOM_APCS_IPC=3Dy
 +CONFIG_TEGRA_HSP_MBOX=3Dy
  CONFIG_MTK_ADSP_MBOX=3Dm
  CONFIG_QCOM_CPUCP_MBOX=3Dm
 -CONFIG_TEGRA_HSP_MBOX=3Dy
  CONFIG_QCOM_IPCC=3Dy
  CONFIG_CIX_MBOX=3Dy
 -CONFIG_ROCKCHIP_IOMMU=3Dy
 -CONFIG_TEGRA_IOMMU_SMMU=3Dy
  CONFIG_ARM_SMMU=3Dy
  CONFIG_ARM_SMMU_V3=3Dy
 -CONFIG_MTK_IOMMU=3Dy
  CONFIG_QCOM_IOMMU=3Dy
 +CONFIG_ROCKCHIP_IOMMU=3Dy
 +CONFIG_TEGRA_IOMMU_SMMU=3Dy
  CONFIG_APPLE_DART=3Dm
 +CONFIG_MTK_IOMMU=3Dy
+ CONFIG_VSI_IOMMU=3Dm
  CONFIG_REMOTEPROC=3Dy
  CONFIG_IMX_REMOTEPROC=3Dy
  CONFIG_MTK_SCP=3Dm

--ywywoAFiPisJuGgC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLDs0ACgkQJNaLcl1U
h9D0vwf/bAkSmJVbQtEygQkiaDUN6+pj/9Y9DuLNd+brAOqCHAPILdi5tV7ra8UK
YNDKsNLx7x+bYVdYxcJ7ueJwgwTdyqBRUvzcUCTiNf/2YjRt44foxH7iremeIvFn
jSuKPJwvzRzEaxAZm93nxjsd/hTLrcpFZkavCQEQRZfKM9B1uKmxwmy++DLgFLhp
6Bt9yNXA1Q2Dm7Xn7SpKsumxkiOHiW3gw55aDCa5RPCOuQo2C8IT6fchBAcaf5bs
UuAxtUUOzC9eP43EvXqSY+7wcXhVRAeoZncBKCh6QljJY4Xk0ad0qu4aGHY5Sdia
zzzxVueZZj1UxQKL6ZLojI1F8Yh0qg==
=UyQD
-----END PGP SIGNATURE-----

--ywywoAFiPisJuGgC--
