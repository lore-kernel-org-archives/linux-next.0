Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132341163E;
	Fri, 27 Mar 2026 18:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637101; cv=none; b=UMlK6j4rN1xvFU/eUEl6It3lmTrERpw/xaA7BbNiMpmWlCBC2Zr2ajbKLo+oAOqnc0KH99a3umtzer0hJjGp0drrfVR4rFStmEzH63HcthhGfi0hD/AWIxJw+UYLBYqiCny/3xDvgNhynSPJBMbQVsLZVtsLpLWRxMeA8VjqHgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637101; c=relaxed/simple;
	bh=vn0mrFBwMMeGcfxROPOg8GRUmv7mgmoODJklMK9tMhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ee8U860nG9sJeWEJ1v7A1PMOGTTh7d7BDdC9GCZuPjwq/5EmTm/67HG5xN70tJyraF0gxN+rkP18lW4wPYmVWzPQO0HpzusGCLcIykKEkNVGYFbL7zEqMRIbBn8IInGd/01MakAya2WK2RZMfYJ168sseUMTLZmmNLMEUnxou/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYNYFrDm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYNYFrDm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1BCC19423;
	Fri, 27 Mar 2026 18:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774637101;
	bh=vn0mrFBwMMeGcfxROPOg8GRUmv7mgmoODJklMK9tMhI=;
	h=Date:From:To:Cc:Subject:From;
	b=tYNYFrDmjJA+8Cg+P7ukqRYfSeteqmcD45NKH/EVOBXx1dNI8/hU6wjCLcm3oyD7r
	 dU1D5PsC5gy3ezzBeqhDUMTwqGf5Yq3AydMJB+XghOnnkWs+B+ylv0j4CJsEmXYIYe
	 75dEirR7fqTAHtPtF2jZVxiEGcCKdWOD1gLhHVnV2vk6bJZrJX/bwf5T1kc4rTlwqZ
	 i8+vO0gNt9AD/Dhh+ExB5r/F5bydxDJjjgB3uRlvsbTuj3Sx2tNaP8ykp8SJkRtGHa
	 C2xUeL0+v4F7E9+dIipLQ9YbD4ay2CC1JPMM6gpIqnW54kzqv0TAl3RnEhNX/Ob2rj
	 O/EwjZ9y8AFTA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A7C361AC5847; Fri, 27 Mar 2026 18:44:58 +0000 (GMT)
Date: Fri, 27 Mar 2026 18:44:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: linux-next: manual merge of the arm64 tree with the kvm-arm tree
Message-ID: <acbQKqGV50jNaDBU@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mKOFv0yilbSz7/1b"
Content-Disposition: inline


--mKOFv0yilbSz7/1b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/kvm/at.c

between commit:

  0496acc42fb51e ("KVM: arm64: Fix the descriptor address in __kvm_at_swap_=
desc()")

=66rom the kvm-arm tree and commit:

  16dbe77a5be2de ("KVM: arm64: Use CAST instruction for swapping guest desc=
riptor")

=66rom the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/kvm/at.c
index a024d9a770dc74,1adf88a5732840..00000000000000
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@@ -1753,8 -1785,10 +1783,10 @@@ int __kvm_at_swap_desc(struct kvm *kvm
  	if (!writable)
  		return -EPERM;
 =20
 -	ptep =3D (u64 __user *)hva + offset;
 +	ptep =3D (void __user *)hva + offset;
- 	if (cpus_have_final_cap(ARM64_HAS_LSE_ATOMICS))
+ 	if (cpus_have_final_cap(ARM64_HAS_LSUI))
+ 		r =3D __lsui_swap_desc(ptep, old, new);
+ 	else if (cpus_have_final_cap(ARM64_HAS_LSE_ATOMICS))
  		r =3D __lse_swap_desc(ptep, old, new);
  	else
  		r =3D __llsc_swap_desc(ptep, old, new);

--mKOFv0yilbSz7/1b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnG0CkACgkQJNaLcl1U
h9AvQAf9HdLaIhutQAAATpiZH3IaSe3nv0598oBCPoIX3O4EvE2/wZaIL73OIhxi
PeWM+ViKzqehRo80A1a5cSm5DRlvEGjT5IuPusNXNRcyhwB6Lty8wLP5pknmtkhN
8KzUr7C/FlGOhbJrDgclMXyuTWFyQgRV5ixANsHqC9KJqAM6M81qvtiFCpDCyijd
5x3xH8QCm8qhMgn1zDY2o5na1yCFBnrFoEfdXui9Nd9HmO6jn/edfRn7v59A4Vf5
b1nyvSwYkTdQQ/wKtXYAWfx1ZcU4dvZTqyiVEMMaIFQ8CoPdPqeTawFjsZ2b9RyG
lU9XhPFXq9AL+7Uiho2Vy6TILnzZIw==
=XOpN
-----END PGP SIGNATURE-----

--mKOFv0yilbSz7/1b--
