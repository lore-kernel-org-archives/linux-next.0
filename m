From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the arm-current tree
Date: Fri, 10 Apr 2015 18:08:41 +1000
Message-ID: <20150410180841.080ac7ea@canb.auug.org.au>
References: <20150410102933.0a79020d@canb.auug.org.au>
	<20150410072830.GA12732@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Etv6cyd.C=N+OrykoXbQteu"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53623 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754107AbbDJIIs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Apr 2015 04:08:48 -0400
In-Reply-To: <20150410072830.GA12732@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>

--Sig_/Etv6cyd.C=N+OrykoXbQteu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Fri, 10 Apr 2015 08:28:31 +0100 Russell King - ARM Linux <linux@arm.linu=
x.org.uk> wrote:
>
> On Fri, Apr 10, 2015 at 10:29:33AM +1000, Stephen Rothwell wrote:
> >=20
> > After merging the arm-current tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > arch/arm/mm/proc-v7.S: Assembler messages:
> > arch/arm/mm/proc-v7.S:535: Error: invalid operands (*ABS* and .text sec=
tions) for `|'
> > arch/arm/mm/proc-v7.S:535: Error: invalid operands (*ABS* and .text sec=
tions) for `|'
> >=20
> > Caused by commit f2fd12256533 ("ARM: proc-v7: avoid errata 430973
> > workaround for non-Cortex A8 CPUs").
> >=20
> > I have reverted that commit for today.
>=20
> The ARM autobuilders built the tree I pushed out with no problems.  The
> commit itself isn't quite correct, but the merge head of the for-next
> branch /is/ correct.  I've now fixed that, but I don't see why you would
> have hit this.

Could it have been tool chain specific?  We are running

arm-unknown-linux-gnueabi-gcc (GCC) 4.9.0
GNU ld (GNU Binutils) 2.24

Also, note that I merged your tree with Linus' tree up to today (commit
3cfb2f7976a2 "Merge tag 'pci-v4.0-fixes-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/Etv6cyd.C=N+OrykoXbQteu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJ4UNAAoJEMDTa8Ir7ZwVdq8P/RIvduQk5SUwkLJoPfAIMPp8
DYX2KFvF7nsOEPtVwkHtGA3WR0Aox0BBzX9CR9NHJlSLbtmkNCXqF5qJz5LOSDOJ
xzzft8CflBNFDkA17XgFMbBh3sI9437dtKda04GrB/XV3yXEZMgWL+om+ZpRxLTi
YvBy1eaeB1lFZCBagt6aKr+ab2mSV5trGz1rLu5WKADlfPsv5TN5XB3KX4mBzPWI
PpWtFwRakyz+SYzWK4QnFp50lEQ2HQL7udxny/nw6orSJCnJrj5OzfEvb67jRYOO
nWsyKBnJB6CduVm1rAXD1XCZu0ENjx2mqqGFrAWrT+MRSZUSxAKUWwPPzKpEiUHn
MhyM2g+s1gUHhtVLYtYNmV8ueN4DtrsFD4XZGZsN0bX70enxye+xTYdjK8ls1Ti1
ZoVbMKfAKMueOf3kKeefMwpwDV53lJqcM1cC2x0Ar/sMFTO12W8aqzYN/Kvo7pfu
ic6nCEekDOdOgNNoRgrFr/o/gobajbioHQ66OoFRFqt3+U2fuyxE6UCdGeFsjeRe
TnDRJs0256MCMxLyoo22nvaojLXT4FiFJRCJMSiNvuIy+ZRoU9IoGN6u358NotCs
xGtAw6m6E9CmTaqNAN4WkSJszAPxmzYpDtq8D9kwSQJhDBSRlbKVsP6sddT9kGFO
vJA/CiHwfahZx3tXEyCr
=oAZq
-----END PGP SIGNATURE-----

--Sig_/Etv6cyd.C=N+OrykoXbQteu--
