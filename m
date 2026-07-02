Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A4F433E64;
	Thu,  2 Jul 2026 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003902; cv=none; b=K2Z5ht49/wurHt5oC7QlOFRpoaDd5VmQvkssBhk1sxzxsTj1AxDI1+BLAJLz5D6UEX7iu3yLDf5IZlTJ/QjWbnrJjUXVazAnrvMQY9AWEcS4XGcW6GLCG8GaC7cErfg+Nf3tXBL0MDS4vFPB4MQ/NM5btBf73xd6f5i10ElQ27w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003902; c=relaxed/simple;
	bh=CJBpbD/P1ahWTe48ZvYsIu6hvkHu8XNBYT/cRgKdSNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VQl9b6EvZ0SLmrSg4LvexOeuHxLSTqFlcbO6Pw5IOK9Pl9TppxmkwOT3p3GJW7brEm42spc53O/6WNzz4w/uA35Y6MSCLYyd7Mnkyj2caktux9Na/drI5OZBOpb1VsHkAEEMhicIcTkKkqbXtAFd2pL/GVAYWYHH89QBWk2Er0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GobA21ZV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GobA21ZV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94ED1F000E9;
	Thu,  2 Jul 2026 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783003901;
	bh=PMi/UzwnpMK3vyqumRukInJUYCfWIsX/BqXn25vIIHg=;
	h=Date:From:To:Cc:Subject;
	b=GobA21ZVUuHS5tK1dhkkhPEyIqUXSVmJV8JNCjpgawvgXnHB9gEUuF2aJtwJBhqOp
	 osn8AsnpTTIm+Rqa+j0fgDt2MjXQbp7GTPa8k07FbQnODTXSvYumbJ0qGiJIcARORY
	 caf0LLVj8joNIyw6E+rcQQq6FUGKV2iB+Ukf2ULKTTWg6ioN8IN4G033sAAmfzkQ8T
	 hk2L1ZRUrUxtpJMY3OQZxuDii1KiINtWfW9cEMFYZmfxx6eFJOQ4QoUXuQaLRsN+eO
	 cFWFovzSHnf/G4R6j2MHDWkjsCc4Mi7OCcmR6/9rBrsWPKm4wdVdgrtIHt8FLBz19L
	 TWVj/oNGKLa/Q==
Date: Thu, 2 Jul 2026 15:51:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Usama Arif <usama.arif@linux.dev>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Subject: linux-next: manual merge of the risc-v tree with the mm-unstable tree
Message-ID: <akZ6-GmTaAw-zmSC@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kLdH28BEDDTK+NxQ"
Content-Disposition: inline


--kLdH28BEDDTK+NxQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/Kconfig

between commit:

  115682bd57b5e ("mm: rename ARCH_ENABLE_THP_MIGRATION to ARCH_SUPPORTS_PMD=
_SOFTLEAF")

=66rom the mm-unstable tree and commit:

  798246e5edfb3 ("riscv: acpi: Enable ARCH_HAS_ACPI_TABLE_UPGRADE")

=66rom the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/riscv/Kconfig
index a092fc085ecd0,cb3d85abf595a..0000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -22,7 -22,8 +22,8 @@@ config RISC
  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
  	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM_VMEMMAP
  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 -	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 +	select ARCH_SUPPORTS_PMD_SOFTLEAF if TRANSPARENT_HUGEPAGE
+ 	select ARCH_HAS_ACPI_TABLE_UPGRADE if ACPI
  	select ARCH_HAS_BINFMT_FLAT
  	select ARCH_HAS_CC_CAN_LINK
  	select ARCH_HAS_CURRENT_STACK_POINTER

--kLdH28BEDDTK+NxQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGevgACgkQJNaLcl1U
h9Biowf9Hw90S3BoFkVBAD1vZfvLbC8BsxyPnAJkwEMppheVrbBoj3c3VxVgvHMT
MuFgPFxvqA2uFMoDFnz5cRjSyhRTgajyQc4iPCk5qwhl0ToYN95ea/G9G8LZzhdJ
vv8mM8L0VZsGjolfXGVna4ahMv/I4IXPKWoHyWJs2WoP2Cn5JRUM7xue1l011jsH
fMBPNGYTcwpIPop1styOe79SmkWuhzyaMXR3UPKEFId0RJJmHI0w2LPDK/mfD601
ehKoLidQZeqcLZ8Hl+jqW+IEB5Ml7DcjHP5jqwsBVxbehrfS2vKDOP6Hj2OZezMW
XpSNtpZ6mM1D6Mwz7mnkPsenQDdaqw==
=kM9/
-----END PGP SIGNATURE-----

--kLdH28BEDDTK+NxQ--
