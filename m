From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: pxa: fix regulator related build fail in
 magician_defconfig
Date: Wed, 28 Mar 2012 19:10:06 +0100
Message-ID: <20120328181005.GC3232@opensource.wolfsonmicro.com>
References: <1331084814.11802.YahooMailClassic@web29012.mail.ird.yahoo.com>
 <1331242494-3157-1-git-send-email-paul.gortmaker@windriver.com>
 <CAN1soZzDRR4XQ34WDL48=j+Ff8t5fsCFaccqZAKOQ1OAPeDXcA@mail.gmail.com>
 <4F608F4F.8020106@windriver.com>
 <20120314123236.GE3133@opensource.wolfsonmicro.com>
 <20120328094351.GB22414@n2100.arm.linux.org.uk>
 <20120328101852.GE3232@opensource.wolfsonmicro.com>
 <20120328175613.GC22414@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fowzm2eVyDiEwGH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:59808 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758273Ab2C1SKI (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Mar 2012 14:10:08 -0400
Content-Disposition: inline
In-Reply-To: <20120328175613.GC22414@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>, lost.distance@yahoo.com


--2fowzm2eVyDiEwGH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 28, 2012 at 06:56:13PM +0100, Russell King - ARM Linux wrote:
> On Wed, Mar 28, 2012 at 11:18:52AM +0100, Mark Brown wrote:

> > Yes, please at least apply Paul's patches - honestly, given how old
> > these boards are and the general lack of activity I'd rather expect that
> > the only thing anyone's doing with them these days is build tests.

> Is that a reason to push breakage to them upstream?  No.  Please take
> Paul's patches to fix the breakage which was introduced through your
> tree yourself.  I've got enough problems this merge window to deal with
> without having to add further patches to my tree.

Well, I'd expect this stuff to be going via the pxa tree to arm-soc
rather than via your tree anyway (which seems to be what's happening at
this point) - half the point with arm-soc was to ensure you didn't have
to deal with things like this.

Quite frankly I thought the fixes had already been applied, they were
posted and reviewed in good time for the merge window and the issues
weren't being reported in -next any more; had someone asked I'd have
applied them as I did with the equivalent stuff for u300.  If they were
being totally ignored I'd probably have applied them too, though perhaps
not.

--2fowzm2eVyDiEwGH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPc1P2AAoJEBus8iNuMP3dTZQP/Ar0B2ucJWsL0ZKsGRgp+vJH
UNtct9vFwT/p69jclBwAID4EvemPtYMgzV4cXW1Wfwal8IyH2G26MgHzbfJhwMaP
m9b9hgT6Yu1FdM1wEaesTCeaCiXyH06GKyRRY+l2fwu2SVStPmn3XOCDbfF+gtX3
01iisZkgycNo7PaDkZ3dH4lbv58vIJtWntlKimtHVXAYpLiL+AQY2j2DwX9yHf+D
sF+oYxFt7JjJhnknGPTeLUO6u0CkJ2dw99m9nLYDceSxCEw/3yxihIYVQSQbdC0A
1uBIWsjaVNgVBqd48L57uHX3DZQZ1L+8Zp0kAOuWckGVEe8BS94BWrGRY7aLV0Xn
WuMGjHCedifwKOSQuSUzymjmTrNQ3suhV6NDIiA948MRxRKnrEq9W2QFQRxoleEQ
uwJ7M3Ph4xGS63S4gmRyxZUr//2IYlBJ6LsymtOv22XE3aqaHZPSSBs6GktWWkiF
kLKp6fUaONIKshs2t/7wz/PDDlv0sMvtgoD3/8b9K+y6pVkGBesgQQ8xISdo3fao
DnWDrPEmGIn+vvgPNGqaDt+RHxwTdBJsBToSgIXntUdTGJY4vKGCMEvPt8a39KFa
HSXk8qddBLZoLMEe8mkkYLx816GMKb52dEWQZpKFaLeW5IPa++zbGYBgjvIVuY/9
hP8cjvv6LtQcVSRreA5r
=QiMv
-----END PGP SIGNATURE-----

--2fowzm2eVyDiEwGH--
