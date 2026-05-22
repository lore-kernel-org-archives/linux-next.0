Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01083BF665;
	Fri, 22 May 2026 11:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450641; cv=none; b=RvMkMN9t//F2XWoHtfcKJVwuNrxdJGFNSre0whgduRLmA37GdWDyyJQa67aJK4de+S5oQJ1xKINtDe8ykXO4pw6QQEGP5YPhw3ORULxKpjfyE4HEf4bKJvhv/N16jBzKJ7+8GPF+8M6vxirHQws8t4eb1YD0iSYdusJNgafZkmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450641; c=relaxed/simple;
	bh=Q/t46dntw1ijW70SuJyHyYJJN7cRVwDBK924RIUndOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9E8H2m1Pi7vcR4XS9xlLhVbTNxZocvqsioxUNrSqnI2dZgnSTfkI6zC66m60MZOgb+KmuT8xiLv32MfCqczTumEzLuwaN9cuya/ADSYvKW5NpMk3duv1SG4d6CTxQOg9VYSvYDWbxJ+PwS++C7CWH4KZmdGybH+DrA+fepL7do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=neavTC1d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="neavTC1d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF891F000E9;
	Fri, 22 May 2026 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779450640;
	bh=ylF4IO17CDxNkIKxr5x+rozLqOuoeDbGZIlv5+hV0CA=;
	h=Date:From:To:Cc:Subject;
	b=neavTC1dff6yupU6QrD2MW8KuDIev/C3B6IXGEZhlde77GeubJOdtGhHplk4YOu3G
	 5w8L7GmcG4F70j8CFVzxIHtIOyqbD8pi2ilHdtvvUMvgJpxQ/QKiRCD2nwNc6o4u2B
	 1zkD2O3Wdu6lNw6AA7CnOJGudva+sHu9MlQmzzSlZPkd+NfL+dO4yuhKRvVUSCJCQV
	 i16oEB/SC7OERho5rP+A+K1hmt12pVOPPk/9tN82U/YGfSwcgPGmWAdUsoT/AQOy78
	 y+kunkE/9JmT/WNZIHzi4J5+CDMfdrvRLwjy4ELagqDeUPcr2qXYhA0Yj1YZ+0YDK4
	 wGCViXPqy+MWA==
Date: Fri, 22 May 2026 12:50:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: linux-next: manual merge of the loongarch tree with the mm-unstable
 tree
Message-ID: <ahBDDF2noinoSIg5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BZ4E0YrQp0C7lCmm"
Content-Disposition: inline


--BZ4E0YrQp0C7lCmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the loongarch tree got a conflict in:

  arch/loongarch/mm/init.c

between commit:

  c0defeccc630f ("mm/sparse-vmemmap: pass @pgmap argument to memory deactiv=
ation paths")

=66rom the mm-unstable tree and commit:

  0ccc9d47cf020 ("LoongArch: Remove unused code to avoid build warning")

=66rom the loongarch tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/loongarch/mm/init.c
index 055ecd2c8fd94,031b39eb081c5..0000000000000
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@@ -124,12 -123,8 +124,8 @@@ void arch_remove_memory(u64 start, u64=20
  {
  	unsigned long start_pfn =3D start >> PAGE_SHIFT;
  	unsigned long nr_pages =3D size >> PAGE_SHIFT;
- 	struct page *page =3D pfn_to_page(start_pfn);
 =20
- 	/* With altmap the first mapped page is offset from @start */
- 	if (altmap)
- 		page +=3D vmem_altmap_offset(altmap);
 -	__remove_pages(start_pfn, nr_pages, altmap);
 +	__remove_pages(start_pfn, nr_pages, altmap, pgmap);
  }
  #endif
 =20

--BZ4E0YrQp0C7lCmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQQwsACgkQJNaLcl1U
h9CwUgf9FpXMCoBOPHINgcGX6riYeMHcWyCjvVjxZsJMuqR7FD1ifn2SMIpTp/DQ
3zC3bZN4lzzQqhODMZ1dAsyjRzN/ziocdiBWaTMTwKKwwfJeEQsPia5o3Klvi4dj
0kTC30mcpvbsO0ahhR4sj/ilhtdGnm/A7XcWy0Pf+PrzjTl2WNlfi+L5GL6jx64/
9xS3Zeowu93650xMHtXJcRwEiIcr5rYoKV3AndFHbbxF8XkTurSvlxm7Yx1Hdnxu
sQiwXEPBz5nXEOOAlJMgJ4EfYc8o3Cxe8deqwXbycoWHt6dQxaNyA4g3MBj/1UQA
zgxtE5a6ob4BKfPbeHZZIki0ybq0Vw==
=1PNL
-----END PGP SIGNATURE-----

--BZ4E0YrQp0C7lCmm--
