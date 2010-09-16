From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the final tree (tip
 tree related)
Date: Thu, 16 Sep 2010 16:32:18 +1000
Message-ID: <20100916163218.e09be473.sfr@canb.auug.org.au>
References: <20100914002932.850d02f3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__16_Sep_2010_16_32_18_+1000_y.QMCIQV2m4oFRM6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51082 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751780Ab0IPGcb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Sep 2010 02:32:31 -0400
In-Reply-To: <20100914002932.850d02f3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Russell King <linux@arm.linux.org.uk>

--Signature=_Thu__16_Sep_2010_16_32_18_+1000_y.QMCIQV2m4oFRM6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 Sep 2010 00:29:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the final tree, today's linux-next build (arm
> assabet_defconfig and serveral other arm configs) failed like this:
>=20
> arch/arm/mm/init.c: In function 'arm_memory_present':
> arch/arm/mm/init.c:260: warning: ISO C90 forbids mixed declarations and c=
ode
> arch/arm/mm/init.c:338: error: invalid storage class for function 'free_a=
rea'
> arch/arm/mm/init.c:357: error: invalid storage class for function 'free_m=
emmap'
> arch/arm/mm/init.c:386: error: invalid storage class for function 'free_u=
nused_memmap'
> arch/arm/mm/init.c:601: error: invalid storage class for function 'keepin=
itrd_setup'
> arch/arm/mm/init.c:606: error: initializer element is not constant
> arch/arm/mm/init.c:606: error: (near initialization for '__setup_keepinit=
rd_setup.setup_func')
> arch/arm/mm/init.c:606: error: expected declaration or statement at end o=
f input
> arch/arm/mm/init.c:252: warning: unused variable 'i'
>=20
> Caused by commit 719c1514f2fef5f01fcfa2bba81b7bb079c7c6a1 ("memblock/arm:
> Use new accessors") which forgot a closing brace on a new
> for_each_memblock() in arm_memory_present().

So this commit is back in tip and the error is back in the builds ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__16_Sep_2010_16_32_18_+1000_y.QMCIQV2m4oFRM6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMkbnyAAoJEDMEi1NhKgbsllYH/A3XY5OM1eKjvhPw0nQvVdiX
iAgyxmHnCUJIv9thLnU8cpWBRojLgLYJoj4NroxcUHszbG0ufjjKFAd8eZ5u9uDt
Q0dtoWUVd/8lmpAWLBiWp+V5h0BnggJUL8Oui1G9tqUfDqbkSsLWVAz1AoBeXHWL
HF4DBtipdC6RDKOkxHuw89epO+6MwHZSi4qT/Q6CXbae+RH7Rr0djiscUa7hHMZQ
YdFQZd7SfgZ/ruc5JXBhqp904eud2DXcouutlT+2ElXjdadsDfCbVTvt3Qe2H+nK
wLqCPsXzw8tlINe2T2rNh7Wz6Jt/P58CjDamK/KYBpRtCzwmY5Qobtfdts+xNjM=
=cjII
-----END PGP SIGNATURE-----

--Signature=_Thu__16_Sep_2010_16_32_18_+1000_y.QMCIQV2m4oFRM6--
