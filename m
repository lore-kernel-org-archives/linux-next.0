Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63673481A99;
	Wed, 21 Jan 2026 12:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769000380; cv=none; b=aLjjWJL1m+qNGHC5fNoGc1/jSCrGC1GlSHUiHWEUannipPB0oNEbKZIRiB/AwEwKqOEsYpMVW/PFAHFOJkezvGMCcMuMhaimyVLhflDmlqXVUmseayhTkE/lCs8LiusTpXz17YYA+C14ZbM7OjC1XXOoxFC4N4ssB2gHsaGBcEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769000380; c=relaxed/simple;
	bh=2jJg7AQPzumd2sJEtULUPDNd/0dsQJ2HXvIWBgvEZPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AYSOs+X9B/6byHipXIUQU+4xzAPSWRES0hxMBU0BEL45AVlG/IYDr9MAtw9oC+Uapb6J2dahpViF1jGnfUbNtQeEnPE24WscMr15IQkNMbctlXdYJyq16E40p+opveOY+c6aU9z0+1BlIxIUdad0Xk63xn6RzcwEgQSxOISoSi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpJ2/R7h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpJ2/R7h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F1EC19424;
	Wed, 21 Jan 2026 12:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769000379;
	bh=2jJg7AQPzumd2sJEtULUPDNd/0dsQJ2HXvIWBgvEZPs=;
	h=Date:From:To:Cc:Subject:From;
	b=hpJ2/R7hI/AjjF4JPaTr5g6bu62IXOAyevt4UyaQuC1uPJdApUUJmqSJz0r5IrRs0
	 5BeW0FtdIuzejRv7rwSnUoFWPMOzlS/Qtz0gnja2O/8kAD558wXDMiv22ffLrZXgmM
	 JF6qtidDdSUjjNvz57JE+4YFRo25ev0gO7OTFixbYL9d+TX5dAeWW6kPrbtFqMKZPM
	 Y29d6UT6LAT7kOJstopl+7Bki1m5QO6EXnOSIg3oAjhaoD2myg3wwbGxm3myyhuuLt
	 TgPJQtM4u3GgbQ+gYExNFHyA5vMG59AXBymcLEOJQW+hzPwd1zvecjiBApIROjvnJ3
	 fgDYqWsdyLy9w==
Date: Wed, 21 Jan 2026 12:59:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Florian Schmaus <florian.schmaus@codasip.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <pjw@kernel.org>
Subject: linux-next: manual merge of the risc-v tree with the mm-stable tree
Message-ID: <aXDNtx7iXjV-hsjm@sirena.org.uk>
Mail-Followup-To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul@pwsan.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Florian Schmaus <florian.schmaus@codasip.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <pjw@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j/wgzTKXSpRims8q"
Content-Disposition: inline


--j/wgzTKXSpRims8q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/include/asm/page.h

between commit:

  8e38607aa4aa8 ("treewide: provide a generic clear_user_page() variant")

=66rom the mm-stable tree and commit:

  c3eb64f3dd69a ("riscv: mm: define copy_user_page() as copy_page()")

=66rom the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/riscv/include/asm/page.h
index 061b60b954ecb,3c517bc9eac56..0000000000000
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@@ -50,8 -50,8 +50,7 @@@ void clear_page(void *page)
  #endif
  #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)
 =20
- #define copy_user_page(vto, vfrom, vaddr, topg) \
- 			memcpy((vto), (vfrom), PAGE_SIZE)
 -#define clear_user_page(pgaddr, vaddr, page)	clear_page(pgaddr)
+ #define copy_user_page(vto, vfrom, vaddr, topg) copy_page(vto, vfrom)
 =20
  /*
   * Use struct definitions to apply C type checking

--j/wgzTKXSpRims8q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlwzbYACgkQJNaLcl1U
h9BTTgf/ZBCzJ5efJej09idX0J++BHohOe92NLPhPvU0JoSHYR+QfS0ma1PK0+j9
d8qqZ8cq2Dy0HMzCj5rR5R6DmyrbV4moAPq9CftMRY7rAHiw3+6z+4uILsOuwPoq
dYneu/IFbla1eJN2x+/IrejBtlU//VZYdxka+YFThi0imgURR6j6liR6JDrSgaB8
JkzBCQWxyez2YFJPvKgFQVcq3uCyVdr1FOD7eavjjRIuihqEyP4dWdGHjkci0JZt
ET+FjlJ7+gN1jiaS41WiKonQQCAYCMBZjEzG7HQF/GwQ+besX5X0DZijH7x42tUa
vvK2rU5nVncNbkT7jEcaeE23j6oZlw==
=73oY
-----END PGP SIGNATURE-----

--j/wgzTKXSpRims8q--
