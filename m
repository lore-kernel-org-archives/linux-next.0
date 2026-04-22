Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07DE17DE36;
	Wed, 22 Apr 2026 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856361; cv=none; b=aNwUBs1TLjFT38GH6ygFtWe/QEVzw3xeZk8N+y0qY8aYXk9oCIfuPLQdWbD+lakYQecwwfRy8FlcoDa8vh85JPl/8mORZtoTT1LCmFQRux1R6c1pecBi3Qbuo8Vm1S0HVKC82/3srfMgPS6S9uuzh+rB4Hh2+3O6anIBhpQx3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856361; c=relaxed/simple;
	bh=rmnli0VtIlPDP6yJg0ozcfFJuYw0lUKygrGdrF50Ghk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AY66iUw4Y+W3wWiPbeb090tKZMkEZGf+pZu1eVYl/viGpxHdFhJaCiPhslHnSYkcPvYGz63Knl0vz6rVdvj+SQpdZHxKOIiUt/Bb2ZFhFzvuhshRR4FIaDpmsiVQFVaRU3pb1HCp+T+3Ybkqsot6Usx2TzsKXm7p4UDeXH34euQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPtGYKk6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPtGYKk6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F396C19425;
	Wed, 22 Apr 2026 11:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776856360;
	bh=rmnli0VtIlPDP6yJg0ozcfFJuYw0lUKygrGdrF50Ghk=;
	h=Date:From:To:Cc:Subject:From;
	b=aPtGYKk6QocdFmdtBfsYqj9PSjg81wgCnL+cYYH+yUuGUyGvAwygj7NoXU7oCQxKQ
	 i/jtgwmtoOvDWuaZ/Fs8+zbADxWpupr9fJc+ShjT5Dp7VVQjg2y/mEECQp8Mfsuymp
	 qKINdJAdFrrUr+JQeVqBTyj5ExzDetXUqvRSMU68RLXx7odyCJLaZ96CmuuP7pnpRY
	 NuXtPwLIfhaXZTJfn/Nb5r65FmO4lXDad0TbpOt6qSi+N2dgEeqN27rSZLrCByedti
	 wi4RZfTIsHaCoR235jP1gioCUQokCByFItHV3gYxToMD5hfyWAOoxYdRfEV3FAmKfF
	 XVvMFlF1UXSGQ==
Date: Wed, 22 Apr 2026 12:12:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: linux-next: manual merge of the loongarch tree with the origin tree
Message-ID: <aeitJGXA62s2ynbh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E5PKremZwvomrJu2"
Content-Disposition: inline


--E5PKremZwvomrJu2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the loongarch tree got a conflict in:

  arch/loongarch/mm/init.c

between commit:

  6215d9f4470fb ("arch, mm: consolidate empty_zero_page")

=66rom the origin tree and commit:

  8b81576c16c06 ("LoongArch: Add HIGHMEM (PKMAP and FIX_KMAP) support")

=66rom the loongarch tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/loongarch/mm/init.c
index 00f3822b6e47c,bf51f4a1b086e..0000000000000
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@@ -36,20 -36,9 +36,6 @@@
  #include <asm/pgalloc.h>
  #include <asm/tlb.h>
 =20
- void copy_user_highpage(struct page *to, struct page *from,
- 	unsigned long vaddr, struct vm_area_struct *vma)
- {
- 	void *vfrom, *vto;
-=20
- 	vfrom =3D kmap_local_page(from);
- 	vto =3D kmap_local_page(to);
- 	copy_page(vto, vfrom);
- 	kunmap_local(vfrom);
- 	kunmap_local(vto);
- 	/* Make sure this page is cleared on other CPU's too before using it */
- 	smp_wmb();
- }
 -unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_a=
ligned_bss;
 -EXPORT_SYMBOL(empty_zero_page);
--
  int __ref page_is_ram(unsigned long pfn)
  {
  	unsigned long addr =3D PFN_PHYS(pfn);

--E5PKremZwvomrJu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnorSMACgkQJNaLcl1U
h9BC5gf8CWvbnSS33Rq0b0JhA6gQxUfur3NjfEoLHS9tVofbh2Q5qrr9IjeXjdGt
U8zY5ysfpam2GxuppiCk+01N4avynU/tGJJjTFJBib5sfAXU5E1V7FYE6ph5Gpff
kZZItov10ZIDxX6S2cY67UsgmSRCgdwoo2KBjR2zeNaKKs3YWRxUrPNd3C3f4jSe
6VVvyekwh/X+AbJaMi0QI3l5BeUJ92JblboA8oLQkVcwiiok1Vp7t+DtyO2G3Orm
WnVuLM9B4C66DIo5H4x9wuXyt1o3mZX6oWPO6QsZBzpn7O4Y5zup3SLLLefxxpXQ
LHQkjoXBiJMeUgbrZx85BLi58RPH9A==
=k9mU
-----END PGP SIGNATURE-----

--E5PKremZwvomrJu2--
