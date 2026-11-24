Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539834;
	b=GB0xvhf28S137g3wnuHFrMfeA2o6ttVR6EHz7M/TTe1YXcORz4pjnPRERLc7qZMMClZr
	 cCMjCovyR/aWNm8BnYwUnZs5Y1S3CwhpIvXXPFdnZO/wnWxZYBFYDjg253K9d2fP4OsXS
	 IJTbqqvdB2FpXYySZKmdlGjEFZftALflK8t8EpgLtwlWrJmg3rnMoH29vhr4YoX6jS59h
	 TQBNT0TAXmKUqDbUB842Zm/zT+QV2xVNt5Qw7EhKQWD2bs5bOG+/ZbrZUjrnHcAxSDkA3
	 guPk9DUFHgeINhyAmwLosu2rN5OE4jpZNzB8HbUJpU3eAtiOQcHb1sAMbOcBrImQNsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539834;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=8c3SVXy/YOkewOINVuavbgfgaH6XagVfj0N1NEcNvNs=;
	b=wk8rsosFWpEWmDjeilqbMLTns2sfYfnXD4QU/e6kSkDfkqBxPi/mCNe81kjs70qg8Qny
	 PvkdWtmeYwLUXJr/gjwYuH5yNtCWFVa13l18sbq1rA8XMm5M8rk2PyM8HVeOclzCX/p99
	 cCNvmrnU88mWW8U02BxF1cOHIGt6HNkRXD/Nm5jiCTPVnAelxto8vtGZjwq+34SLWPdEV
	 NWvTNrM9/O/bn6aEjETafEuF3cnC/93WNI2zfWQMkJZDMcrynVBB1IdOXKHx39Cvg+yPf
	 C9/IeXMoTh+5iDLVo+Qa0Ko0q4XhweYgYIQMcHJTiWoYoOZDBlyNyveipbmcZW3Kv8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ad2b2OgV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5DD606A321;
	Tue, 24 Nov 2026 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ad2b2OgV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D751F000C4;
	Tue, 24 Nov 2026 17:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539834;
	bh=8c3SVXy/YOkewOINVuavbgfgaH6XagVfj0N1NEcNvNs=;
	h=Date:From:To:Cc:Subject;
	b=Ad2b2OgV8d6slhOmDkQ0NlgU/We9GsFnVY5e5Afm3xSFM6I9bpaECNpW0/H+eiyvO
	 xrlkDoHU51ZUCoAsfs55UMkC0d0kUYlxrf3Lv1X9LLCGmkOWlrA6c7m98X9VaJjJeT
	 4YGQ5Y24B6FxtoABsAKIXi8uKe2aYbbhPydIHkc91CHInS+tQ68X0yGlt+5FoKlo4b
	 G9J/Xuie6C2saCrxw0Z+bVIHdJASAqoRC+CMAdF4bJkVlNHP02sHnhxv3saLexPMGC
	 d9ducNrNM4VM/AuSx0xQ4mwdYPe0yUQRzDitF/T59Kt9gQO8IBHzrXkoeXGGbQ+1a4
	 IyQ06XaRFIdFQ==
Date: Tue, 24 Nov 2026 17:03:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>
Subject: linux-next: manual merge of the kvm-arm tree with the kvm-arm-fixes
 tree
Message-ID: <awXDdoe3z5nyb2u-@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2NMAQIVW8NCprxWt"
Content-Disposition: inline


--2NMAQIVW8NCprxWt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/kvm/mmu.c

between commit:

  fb92b5981ae3c ("KVM: arm64: Fix THP block mapping when the PMD level is f=
olded")

=66rom the kvm-arm-fixes tree and commit:

  9da9b26ce1aca ("KVM: arm64: Fast fail transparent_hugepage_adjust() for n=
on-PMD folios")

=66rom the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/kvm/mmu.c
index a0d4981ebb998,042dc53267cb3..0000000000000
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@@ -1564,25 -1566,31 +1566,31 @@@ transparent_hugepage_adjust(const struc
  	 * sure that the HVA and IPA are sufficiently aligned and that the
  	 * block map is contained within the memslot.
  	 */
- 	if (fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE)) {
- 		int sz =3D get_user_mapping_size(kvm, s2fd->hva);
+ 	if (!fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE))
+ 		return PAGE_SIZE;
 =20
- 		if (sz < 0)
- 			return sz;
+ 	/*
+ 	 * If the allocated folio isn't at least PMD_SIZE, there is no way a
+ 	 * stage-1 PMD level was installed.
+ 	 */
+ 	if (s2vi->page && !folio_test_pmd_mappable(page_folio(s2vi->page)))
+ 		return PAGE_SIZE;
 =20
- 		if (sz < PMD_SIZE)
- 			return PAGE_SIZE;
+ 	/*
+ 	 * Even though the folio size is big enough, the stage-1 mapping might
+ 	 * have been split. Verify it.
+ 	 */
+ 	sz =3D get_user_mapping_size(kvm, s2fd->hva);
+ 	if (sz < 0)
+ 		return sz;
 =20
- 		gfn =3D ALIGN_DOWN(gfn, PMD_SIZE >> PAGE_SHIFT);
- 		*gfnp =3D gfn;
- 		pfn =3D ALIGN_DOWN(pfn, PMD_SIZE >> PAGE_SHIFT);
- 		*pfnp =3D pfn;
+ 	if (sz < PMD_SIZE)
+ 		return PAGE_SIZE;
 =20
- 		return PMD_SIZE;
- 	}
 -	*gfnp &=3D ~(PTRS_PER_PMD - 1);
 -	*pfnp &=3D ~(PTRS_PER_PMD - 1);
++	*gfnp =3D ALIGN_DOWN(*gfnp, PMD_SIZE >> PAGE_SHIFT);
++	*pfnp =3D ALIGN_DOWN(*pfnp, PMD_SIZE >> PAGE_SHIFT);
 =20
- 	/* Use page mapping if we cannot use block mapping. */
- 	return PAGE_SIZE;
+ 	return PMD_SIZE;
  }
 =20
  static int get_vma_page_shift(struct vm_area_struct *vma)

--2NMAQIVW8NCprxWt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFw3UACgkQJNaLcl1U
h9BIeQf+KfnvBxvYx1YROBz4Vs5t/IzsLPsFavYCJLiZ5Qz7de1UVUw8nMWOPTk7
JcOib34DyxmcGXHa2zY3fH0NoqFI2W4oJgC2qCeisDxyE/Hi32m1+KFl4tFhEt+H
lxvLY2JjLcxUco6HoU+w/HMdFsIdSCoylUfgSPbZIYEa8mBODAVkkO94b4A1Pafz
B/Hp6pHKL8zB8MnqieN5ttO4L052cEnA6XRPCM5yMpJS9q8Sd7/ldquGmlkmZg5x
9UeXTBFy29i+aW38ndzbHaSS4K8r2Wt8P6Ky8dVnYvZWdkDmNrpwoFr9HVUbneD6
A3gEfkHot+astiLwVs6Y4JhVZsbKmw==
=fkfa
-----END PGP SIGNATURE-----

--2NMAQIVW8NCprxWt--
