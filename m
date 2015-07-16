From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150716 build: 4 failures 88 warnings (next-20150716)
Date: Thu, 16 Jul 2015 14:41:52 +0100
Message-ID: <20150716134152.GJ4039@sirena.org.uk>
References: <E1ZFg2R-0001bO-R5@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g3RkK9jYN81zD2N+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53973 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753322AbbGPNmN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2015 09:42:13 -0400
Content-Disposition: inline
In-Reply-To: <E1ZFg2R-0001bO-R5@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Toshi Kani <toshi.kani@hp.com>, Matthew Wilcox <willy@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--g3RkK9jYN81zD2N+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2015 at 11:05:11AM +0100, Build bot for Mark Brown wrote:

Today's linux-next fails to build an arm64 allnoconfig due to "mm: make
GUP handle pfn mapping unless FOLL_GET is requested" which causes:

> 	arm64-allnoconfig
> ../mm/gup.c:51:4: error: implicit declaration of function 'update_mmu_cache' [-Werror=implicit-function-declaration]

The update_mmu_cache() function is defined unconditionally in
asm/tlbflush.h so there is presumably some path of conditional
inclusions which causes it not to get declared in an allnoconfig - I
didn't chase that down yet.

--g3RkK9jYN81zD2N+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVp7SgAAoJECTWi3JdVIfQd6QH/idit8PCLaMGT+kCqq0RBsSt
s+Y7JaTmkBp37FLeo6OTYCN5tHIMHO8tG4uoi5xGqcmDvkgbyi+eOULAx+OQ3ffb
pfVHaaZy/L23KI44YyAmJ3Fdwa3BiKLEiJj4mmovJFmXms+tXPm0SecYxd6Bm5Zx
JpYnkZTPVBwFb60w7FyMpcLB9mnfL52AWp4naV58KOs8ejwmOTPC/nfJlWTL2u8N
babFIl0GzF2WjxsuK/DQ97uNjed2AOmLKBIKNPMN2648kklyWjLGrN7M55Ygl1gl
60hyOFrYghaZ/LMVBTYWJ917TVOglub+E5ajMVyIk/6gP2nYvHE2BC8R+sHqRpU=
=buGb
-----END PGP SIGNATURE-----

--g3RkK9jYN81zD2N+--
