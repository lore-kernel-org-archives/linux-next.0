Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F34F2E0925;
	Thu,  9 Apr 2026 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775747462; cv=none; b=hhcykcLAr6uqnHYXT/7gKYUaUTv9x2s1Q4DHkoYktzYQz7yPivHslNjJyHNV1+BnLvraCs4Wnl39uS0YejnS75iAlxocRMVCR+vA3wBQvbhXYOf1bMKl3ZEaAgOFMbjmWzyXZ4LOBk5li/kDH7PapwKkWYbiPFaGVhsAasFxs8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775747462; c=relaxed/simple;
	bh=ogPzhiYnpF8NcR8G92uiCpGbycLuy9tJQG0UBgKCC/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rk2rvialhIJSbGq8L5ZZezs7oxhZcptowuHif0dkwoycMO64f1lNTy/uEWaYwN7RFcRKuJeL05Dv4iFl4MEFuU+S1aROT50mcgqSSGFhzoYXHJL+meG8vbryZ08Af+sUu9Jw9JxPuHKVAS95SJ07+tDlSZl7cORmbEjYMud5v9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWo0OLLZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWo0OLLZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4B3C4CEF7;
	Thu,  9 Apr 2026 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775747461;
	bh=ogPzhiYnpF8NcR8G92uiCpGbycLuy9tJQG0UBgKCC/U=;
	h=Date:From:To:Cc:Subject:From;
	b=QWo0OLLZQrpfdepiTkSvtk2DD0qtVu0exQzWq/KMCy+kVDiurMpntKQBf3ew3w18R
	 VOxz90PFiSznGplobAGUB8Wm2ug0A1ja1HDKkQfhEUviHliFdJxrAuWojnUwOIeGxr
	 bu/X3qJ1B5Dgqs+pgP4oXGlXYYYXBwq+7B5h8EloOS8lsyeBI7447hwBYZ7/ay2LNk
	 dBjCMkrZ+7M0iPLLb0xfv3nS3GeJ1DdVod0HZYGgI41PkxBqSUqJptFESze5JeUKBB
	 rWauNwSn/zLq5DIwIG3El4vXyeODxkCq4B8hgvw0wlykj8iSNd6Z9ZeKz2FY9PTKzS
	 MbVrox2Gjef8w==
Date: Thu, 9 Apr 2026 16:10:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Song Gao <gaosong@loongson.cn>
Subject: linux-next: manual merge of the kvm-arm tree with the loongarch tree
Message-ID: <adfBgEpq8xjeCz5v@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vgdIqCjVHPGtXZF4"
Content-Disposition: inline


--vgdIqCjVHPGtXZF4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  include/uapi/linux/kvm.h

between commit:

  229132c309d66 ("LoongArch: KVM: Add DMSINTC device support")

=66rom the loongarch tree and commit:

  c547c51ff4d44 ("KVM: arm64: gic-v5: Add ARM_VGIC_V5 device to KVM headers=
")

=66rom the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/uapi/linux/kvm.h
index 9e7887230bddc,ae659566e44f4..0000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -1224,8 -1229,8 +1229,10 @@@ enum kvm_device_type=20
  #define KVM_DEV_TYPE_LOONGARCH_EIOINTC	KVM_DEV_TYPE_LOONGARCH_EIOINTC
  	KVM_DEV_TYPE_LOONGARCH_PCHPIC,
  #define KVM_DEV_TYPE_LOONGARCH_PCHPIC	KVM_DEV_TYPE_LOONGARCH_PCHPIC
 +	KVM_DEV_TYPE_LOONGARCH_DMSINTC,
 +#define KVM_DEV_TYPE_LOONGARCH_DMSINTC	KVM_DEV_TYPE_LOONGARCH_DMSINTC
+ 	KVM_DEV_TYPE_ARM_VGIC_V5,
+ #define KVM_DEV_TYPE_ARM_VGIC_V5	KVM_DEV_TYPE_ARM_VGIC_V5
 =20
  	KVM_DEV_TYPE_MAX,
 =20

--vgdIqCjVHPGtXZF4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnXwYAACgkQJNaLcl1U
h9Cbdwf+JDOyERGdz3/ebFOGVmqNcStuQOlAqcBtc/NQXWX93nkhOQSS1H/OOL+R
tFPGIPcSTRaMoF33uEnI7Pvu9eMY0bDoi8pgl5OWSr9VXqdZ/oMZgf2Zcgivg338
GrFZGR6v3XigxFcQGhcojPZdDeMgxiELVxnrRzQ52rznYhfVpv8B/jXQ1PyX13aT
fmXd87X8yPlWXPJkyTti2MSSElohB8vTAEVMBpFq8TBDHAOR/HRdtg2FN52Lvgl4
tXRn1wE6CmLLowOPpWqYVzsLQwGa9E7GWQ6FQWjbMPO5ifVTdMZJXap70wKj0sff
9v4OHaK5w5M7mPyco4Fx+Se5n7uf9g==
=UVLa
-----END PGP SIGNATURE-----

--vgdIqCjVHPGtXZF4--
