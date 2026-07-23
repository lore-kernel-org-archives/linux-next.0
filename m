Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8106130148A;
	Thu, 23 Jul 2026 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817588; cv=none; b=eSziq3c6/6vbE9V0kRSAchz5ZK3S+hz+3TcocCUuAnp+tuBSmz+ef9jRae8bkQJFNak4gCsZN5KgU5byf6mCnLANmC8ucnZOdldL5zFmIoDqXl/OAHMtIyvFeMZBdAqepGRonELHDmGRymvAFj9KKOkvFIqW+Xy7FGQxYTccIqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817588; c=relaxed/simple;
	bh=Z1BWbc1LSslz7t3Ypibg1HJCSmXFUKnPtCAQmpyrhic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kiSVHyaP3ylXT9ZrNkCTztTCC715uc70dersvAA5hZrWMC78Uwxnti1BdMjckSMr5g12dPsxqYLnvdl2Tct8jnXx9g7dBeE+RQPx+sI1SE1eWNfZkpvdesOXSfJk5VKHM3EE3YLUhYPuWq8fyVEbkc0FpNqaU1rFF14m7IjVQkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3kXmJVI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3kXmJVI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800491F000E9;
	Thu, 23 Jul 2026 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784817576;
	bh=ch1D3/ruDz+G0GLxxJxNS77UDfE/kq4W6Uqt3cMXeaY=;
	h=Date:From:To:Cc:Subject;
	b=e3kXmJVI4wFSJ+xomURFBSUj6PrR7Uc0Ock0+Uuf6g4+ZX0gH8cGMEqPHl5MhT7JN
	 P9h5O3DIOHLzPgLw8BX1Xa5PYsfzLRKVIU/MtGrOmuDyHzYZ+353bhKr4WHQrI6BhM
	 50sNhSfto2aG0s4SHHcur/GWkWjS9dU+C4aOSVI9/tRCNAWDF4RuPLilLujmReXQsX
	 NQxd3CoyQf+lY23+9kkYnMahR0ZnA7lunxKc4vxJAe/D7aUKmmiiabRJh2CG/3bkTE
	 ptbzqhN6DKBMREk6txN1J4SEkck3wqOBpqDlxuDsPGzAs0unPwtM2+mScc3BxzxGEF
	 O3TYM6DvRV7uw==
Date: Thu, 23 Jul 2026 15:39:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Will Deacon <will@kernel.org>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <amInpMqQpk_tw1I1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="91wDdtS0DoaDiDIf"
Content-Disposition: inline


--91wDdtS0DoaDiDIf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/tools/cpucaps

between commit:

  12aab25ca56ee ("arm64: errata: work around NVIDIA Olympus device store/lo=
ad ordering")

=66rom the arm64 tree and commit:

  27a263e1a0fa2 ("KVM: arm64: Move GICv3 broken SEIS implementation detecti=
on to a CPU errrata")

=66rom the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/tools/cpucaps
index e43c9095424bf,50373264ecde8..0000000000000
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@@ -121,7 -121,7 +121,8 @@@ WORKAROUND_CAVIUM_TX2_219_TV
  WORKAROUND_CLEAN_CACHE
  WORKAROUND_DEVICE_LOAD_ACQUIRE
  WORKAROUND_DISABLE_CNP
+ WORKAROUND_GICv3_BROKEN_SEIS
 +WORKAROUND_NVIDIA_OLYMPUS_1027
  WORKAROUND_PMUV3_IMPDEF_TRAPS
  WORKAROUND_QCOM_FALKOR_E1003
  WORKAROUND_QCOM_ORYON_CNTVOFF

--91wDdtS0DoaDiDIf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpiJ6MACgkQJNaLcl1U
h9D5CAf+KHhjB5Xtwf3Y+UFuLkfMzDxWlxKuK4qdLujPjae9IsIeW/uUHhv5e3Gb
NSP12UBF9GBbznGqMi8DWnbibtybQnQDNXpWebhKVtVDrIW6iW5wHhMsMYA2QiPN
4LmTSbquN5TdIlPx4dX5h8d/PuMHPmOMS64YolOrdElk3MoHf8act93TeXWalzYg
++qxvGI9rGkNOF/M4SxqbnWI2pfxirCKJ47KLXBLiZxERZon2pminsles9YGvwMA
WyLYjaypvtwmvqNkr75Yvc4RjZqDda91o3fzPjLeybx/qF26GwYi0kVcczqh0HuO
xhqWnyNgAomIUxfmY7xlGj8pPcoDpQ==
=A9ig
-----END PGP SIGNATURE-----

--91wDdtS0DoaDiDIf--
