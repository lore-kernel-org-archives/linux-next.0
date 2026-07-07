Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B845536492C;
	Tue,  7 Jul 2026 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425245; cv=none; b=SxPTKmsOjJ48aN6XR2aBtEG+vEctCYL0rtnBDRzxhUr/S69ogRovKyxGdUH+EB9sjSUtHu/j+dhA0V8mT3+xmK07FqW2bjolqZc2VZboVbiTDckThqvAVYNvO2ID/hiT0MSShzejZ20orYN3DN4o7N50Gb2A6xQmtypxW7yC7gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425245; c=relaxed/simple;
	bh=SVeA3S7LOP3yqJTDXdFdpcOnRMnoawGoGIWd2R+6qdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O/abaFl1VWbBKLxY43N8dQ9FCg4XiUoYuboEiwMOXTziJ+Q2v9SgirfrxWnKcToLJ5yhqsi46YVucl6SWIoVKIRmfIAWiRAaPnYFoonJhc0+3YlQOxh/X3M5wfEyw2j65HjRnbS8lGT3+8vLRFUQYStmNJF8S6W6AWr0In/XCrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qpm5SDQo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qpm5SDQo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E391F000E9;
	Tue,  7 Jul 2026 11:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783425244;
	bh=xOpwCwm/S6jiQOiDDhUCnH2AIRpmFUk6xDHEPzrA1F0=;
	h=Date:From:To:Cc:Subject;
	b=Qpm5SDQo/ZPrx5yg5OymeVxZ35XTp41ut3VZBxr6iYWrrKmx637005HLqY9K0qJtm
	 xbejry0DyqtNgY4GkPkSTm3AUpNnjxl7f0VmQV5xs+JalNTox+gS+u1fKvzfLuuVwP
	 SafsPjlRF/GiQYwHawoadTWO84DGm6IJKKfxkEcsbjNatf+DJUSX2PbEU29pS8HRRd
	 xjNazSfF/JGPyPbOY2TF5SbPfnRuqYhifF9BqS0RcRtsjeKZtqHnuKpatRKSsOEBLW
	 0P2RhkrbZMQnBPkbQBUQrfGhbjM28vvizFmCj+GIPm3svGAEwMsI7qqrlxeJIbZ3pz
	 wx4H6eht96zKw==
Date: Tue, 7 Jul 2026 12:54:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Usama Arif <usama.arif@linux.dev>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Subject: linux-next: manual merge of the risc-v tree with the mm-unstable tree
Message-ID: <akzo2N-H1mm4U7kw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J0Dw0P72lXm5IOSb"
Content-Disposition: inline


--J0Dw0P72lXm5IOSb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/Kconfig

between commit:

  4cc0dab993a81 ("mm: rename ARCH_ENABLE_THP_MIGRATION to ARCH_HAS_PMD_SOFT=
LEAVES")

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
index 2b7b69e383835,cb3d85abf595a..0000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -22,7 -22,8 +22,8 @@@ config RISC
  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
  	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM_VMEMMAP
  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 -	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 +	select ARCH_HAS_PMD_SOFTLEAVES if TRANSPARENT_HUGEPAGE
+ 	select ARCH_HAS_ACPI_TABLE_UPGRADE if ACPI
  	select ARCH_HAS_BINFMT_FLAT
  	select ARCH_HAS_CC_CAN_LINK
  	select ARCH_HAS_CURRENT_STACK_POINTER

--J0Dw0P72lXm5IOSb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpM6NcACgkQJNaLcl1U
h9BNywf/eGrn+JIqXcVKpYBcFYWzshKIbRkduxquSdacLXdX8NOUbc2bpp/B3o1r
ETo/zT1OrlD6tciXKUxl3FxpzDOyo/Urb5qbg03A/DhzD9E4BMSppE195mkiq7EP
CA0NW7oNzRKtFlWRhEcsBO4xXF5sVsgZZFVJU2oDczqktizUqxd7xEKT3OOQQLER
/u50XlCsrSO6J7MAkxiQE5lJXrQmd+dP8M4URLdZMQxJl8f6EsV9sW4/955reUg8
gbXDVrRLvrqI0DVuUDo9qxvk6yrKZPvsNHoA4mR48VKQjDdwkQ76wOBSkoQcBrSH
PRPtEDZMhXZrXjA0LJpZoND/YwiNgg==
=x3Uw
-----END PGP SIGNATURE-----

--J0Dw0P72lXm5IOSb--
