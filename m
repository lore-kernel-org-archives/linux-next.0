From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150716 build: 4 failures 88 warnings (next-20150716)
Date: Thu, 16 Jul 2015 15:01:46 +0100
Message-ID: <20150716140146.GL4039@sirena.org.uk>
References: <E1ZFg2R-0001bO-R5@optimist>
 <20150716134152.GJ4039@sirena.org.uk>
 <20150716134836.GB26865@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cy9Nn4fUvYST66Pl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54011 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754463AbbGPOCH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2015 10:02:07 -0400
Content-Disposition: inline
In-Reply-To: <20150716134836.GB26865@e104818-lin.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Toshi Kani <toshi.kani@hp.com>, Matthew Wilcox <willy@linux.intel.com>, Will Deacon <Will.Deacon@arm.com>, "kernel-build-reports@lists.linaro.org" <kernel-build-reports@lists.linaro.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


--cy9Nn4fUvYST66Pl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2015 at 02:48:36PM +0100, Catalin Marinas wrote:
> On Thu, Jul 16, 2015 at 02:41:52PM +0100, Mark Brown wrote:

> > The update_mmu_cache() function is defined unconditionally in
> > asm/tlbflush.h so there is presumably some path of conditional
> > inclusions which causes it not to get declared in an allnoconfig - I
> > didn't chase that down yet.

> Maybe we should move it to asm/pgtable.h like many other architectures.

Seems likely to be more robust in future if we're consistent...

--cy9Nn4fUvYST66Pl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVp7lJAAoJECTWi3JdVIfQ+vwH/ixITd14sSOoBl+3/BTnHEK7
8YzsfDDsqp11N5dsqbU2+7kjdruNVhR2xwNTXnT1lDe7VWoxEaww1CxbTGUJwXRG
+pYdMEGTAUWbeU8/BW2z5IJMGmrpolOrIC+98IJDEjMU5wjVcuc8Bm4Z795xdpSI
vPhaUYodalsIMjSFZJu/03arTkPxGFnkPRs6pm/F+k8/D+TZevmP9NpxxtjXXd2a
ZW3gSFFyGoiSAGjZ6YeiEK7KSRr3sxiwc7pJcZMlALHgpJYdolyEzUXm9PGPK8Wh
wCDKZEjEdBTO4LiC7AeCjjgsa1O5VZZKzHnaQ2O6dDUD2alULzDsQPh2Qd0HErE=
=7AMf
-----END PGP SIGNATURE-----

--cy9Nn4fUvYST66Pl--
