Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A022EB87F;
	Mon, 26 Jan 2026 21:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769463797; cv=none; b=fjd/wCLbbNd63f78VxG7eL0IO/EVXPJMGSkzwNZeP0Ta6sJHQcVgJEbtLhS7VqnsmeUMMO8JTNzqYZqjrvEjgZUiy+fuG4slV5NaZ3OArNt2mJMD0kCayggTKnO+UGV6sZKsq1PAeeiiGPhluh7Dx/AB6BA1Ck61ATqyDqScSW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769463797; c=relaxed/simple;
	bh=0pDiwxWDBLpHoviMn2h/TI2v2/8tghZFt4HdfNlf63c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvHZSLS4ljr+mY8dYm9Go6DVjBQl9Z7EyaBrRNJExspZ1UwV4mD1K3CRwe9G4DN7HBe7O0L3wfV8DHmIBO+Tm5m98a6DJiTv23MsNaV4L7u5opwcP8YfRN+/hno6ZmYbTLKWKVCMLTBduOTP21ztOC/h1jvcVhnunrYzVAc38cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGm51pT+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGm51pT+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057A2C19422;
	Mon, 26 Jan 2026 21:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769463796;
	bh=0pDiwxWDBLpHoviMn2h/TI2v2/8tghZFt4HdfNlf63c=;
	h=Date:From:To:Cc:Subject:From;
	b=eGm51pT+D3dK6PqS2apdw0nYntVPq8Nq47bBeyv4cNQC6WcHogEVi4A8KFyGZMorS
	 WFJ5WbE0tbTtt+ngpTbJmarqx0H4kP+MpPJ2hZ40gqXfzGexytZos6nCgDF76H+U92
	 784K3eIB/sGodL5ZrKA4KmpRRJVDjE/Y7g1jn2Q4UN5wagu+XHRwvqnCyDt9diA6gv
	 R0Da8v/usd7RhpFlPttvASgFKVyljcfOYd09kkkK39Q6n4x9HztCf4E9o7x3idW6T1
	 IdpiQffhWNnEl7cVU2wEbysbqltUIEwCcPJphQf5XLJfKBWQetqGETbq2kptBl7rB+
	 vy6MMy2V/QZxw==
Date: Mon, 26 Jan 2026 21:43:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>, Melody Wang <huibo.wang@amd.com>,
	Michael Roth <michael.roth@amd.com>, Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>
Subject: linux-next: manual merge of the kvm-x86 tree with the kvm-arm tree
Message-ID: <aXff8E59WOnTEA59@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uc0MPH6g9gemGvcd"
Content-Disposition: inline


--Uc0MPH6g9gemGvcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  include/uapi/linux/kvm.h

between commit:

  f174a9ffcd48d ("KVM: arm64: Add exit to userspace on {LD,ST}64B* outside =
of memslots")

=66rom the kvm-arm tree and commit:

  fa9893fadbc24 ("KVM: Introduce KVM_EXIT_SNP_REQ_CERTS for SNP certificate=
-fetching")

=66rom the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/uapi/linux/kvm.h
index 88cca0e22ecea,9b96a6e73a53f..0000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -180,7 -190,7 +190,8 @@@ struct kvm_exit_snp_req_certs=20
  #define KVM_EXIT_MEMORY_FAULT     39
  #define KVM_EXIT_TDX              40
  #define KVM_EXIT_ARM_SEA          41
 -#define KVM_EXIT_SNP_REQ_CERTS    42
 +#define KVM_EXIT_ARM_LDST64B      42
++#define KVM_EXIT_SNP_REQ_CERTS    43
 =20
  /* For KVM_EXIT_INTERNAL_ERROR */
  /* Emulate instruction failed. */

--Uc0MPH6g9gemGvcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml33+8ACgkQJNaLcl1U
h9Ad3wgAgSgyzgYnOEJ0xwKzHYsJWjOlnv8f/zgtIVpyBwunyjJ1S2VTrqiP2aMy
PQv7Ebr2htVLuDSIcUFH/jC5WgRruF0Zf7+zRiS5ISr9bfbw12fEnbW/vc226GFl
y9LaHt+P5IRciULUg9l6J0on2HN+A38XrRyfGvVWGi+tNvzDLQoIyseL231MrA55
w2VP8APrrK3tl/p1QRpA4cvGjpbkRgPFdxM5hybujuwH3G4cAG4+yvyoR1f8H/l6
mIQUDMcyQWjO5MOonQXWAKLRlKsN5B8L3RWkDJ67GfpTKLL2lUzyOd5lMS4FLpDH
7t4R9VJpB1EpoZdiYpyY06eZZhyVag==
=ro+j
-----END PGP SIGNATURE-----

--Uc0MPH6g9gemGvcd--
