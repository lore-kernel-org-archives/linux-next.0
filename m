From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150716 build: 4 failures 88 warnings (next-20150716)
Date: Thu, 16 Jul 2015 14:59:41 +0100
Message-ID: <20150716135941.GK4039@sirena.org.uk>
References: <E1ZFg2R-0001bO-R5@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QxIEt88oQPsT6QmF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53993 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783AbbGPOAD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2015 10:00:03 -0400
Content-Disposition: inline
In-Reply-To: <E1ZFg2R-0001bO-R5@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric B Munson <emunson@akamai.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--QxIEt88oQPsT6QmF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2015 at 11:05:11AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 defconfig and allmodconfig due to
"mm: mlock: add new mlock, munlock, and munlockall system calls" which
triggers:

> ../arch/arm64/include/asm/unistd32.h:801:1: error: array index in initializer exceeds array bounds
> ../arch/arm64/include/asm/unistd32.h:801:1: error: (near initialization for 'compat_sys_call_table')
> ../arch/arm64/include/asm/unistd32.h:803:1: error: array index in initializer exceeds array bounds
> ../arch/arm64/include/asm/unistd32.h:803:1: error: (near initialization for 'compat_sys_call_table')
> ../arch/arm64/include/asm/unistd32.h:805:1: error: array index in initializer exceeds array bounds
> ../arch/arm64/include/asm/unistd32.h:805:1: error: (near initialization for 'compat_sys_call_table')

since it adds new syscalls but does not update __NR_compat_syscalls in
arch/arm64/include/asm/unistd.h so there are no array slots for the new
data.

--QxIEt88oQPsT6QmF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVp7jMAAoJECTWi3JdVIfQarcH/1p8agomfsLt8oEd+knn3x/7
6C99NLS4C8wnGHi8BrP95hRC/RBRRjkzI77C1ZCWUWGxVnTWLBWwBpVISI+XPI1P
9AuBqhklD1tEtdYHGKf6sCvcYpqC4KQsnfE7TwSrFOINJ9fO3NeNFrn9gVgbDdmm
MSRbv3bnAK+Rcbxjby9lkt6maMZ01Tfz1wdJCN04wj0o0b9xFRe3Fw9Cevi+ZY4a
T1yxhV6DnSOGq128E7aS5vzYxNoNc48d1JFmDb6cS7OmF4wYl6nR/6J/UNYsc2Cz
8+5vphn9EOEXmJ6mNmrJ9yF6o38Te8LPszfl3UCfxxfqB1STeMd91L1EGRXxw00=
=+bPW
-----END PGP SIGNATURE-----

--QxIEt88oQPsT6QmF--
