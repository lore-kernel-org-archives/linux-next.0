From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: pxa: fix build failure for regulator consumer in
 em-x270.c
Date: Wed, 28 Mar 2012 17:13:05 +0100
Message-ID: <20120328161305.GZ3232@opensource.wolfsonmicro.com>
References: <CAP=VYLp-weNj35OHtmZ6pf5-t7OUxWREeu8r5sSOLhFYu0CppQ@mail.gmail.com>
 <1331244366-6147-1-git-send-email-paul.gortmaker@windriver.com>
 <4F732C97.2030804@compulab.co.il>
 <20120328152743.GW3232@opensource.wolfsonmicro.com>
 <4F73356D.5080401@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nSY6dmU9u4MMxp1o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:56900 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758010Ab2C1QNH (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Mar 2012 12:13:07 -0400
Content-Disposition: inline
In-Reply-To: <4F73356D.5080401@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Igor Grinberg <grinberg@compulab.co.il>, haojian.zhuang@gmail.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org


--nSY6dmU9u4MMxp1o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 28, 2012 at 11:59:41AM -0400, Paul Gortmaker wrote:
> On 12-03-28 11:27 AM, Mark Brown wrote:

> static struct platform_device em_x270_gps_userspace_consumer = {
>         .name           = "reg-userspace-consumer",
>         .id             = 0,

> static struct platform_device em_x270_gprs_userspace_consumer = {
>         .name           = "reg-userspace-consumer",
>         .id             = 1,

> Note that the existing names currently don't incorporate the .id
> field as a suffix, and so never were unique.

No, this is just a basic part of how platform devices work - the device
name is always the same and if you've got more than one of them they get
different .ids.  dev_name() returns name.id, or just name if id is set
to -1 indicating that there's onyl one device of a given type.

--nSY6dmU9u4MMxp1o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPcziGAAoJEBus8iNuMP3dka0P/RChBt1sJJYk/PNcbpO4bEIg
EnwdJfpepltW5jwuiC/Msc5Q2JxHc0CaODMVc6ZarfpRihjjzKwWJOi+aGIzUCnG
Xu2piOi4NNodeFotQ0dXicu4Gt2ad+jJM4Ag5ui60dr6fEH6rvCGxwL1ssRhKUNX
CejjezgPcsIsvv7ZYbDQYQ2GAqqqUT10Xa9g3eSVsogDtFP2/7NKuRzg3mfm6DEt
e1EnyRFKNlKKYluMomsFVmznqHfecAQrKTgZvusrRiWPSDZBZTKKFTUqx7+Wjkbg
oxBmMYK1Awch3rPGJ/KFoMmvujx7ESOitlu44QcCmBdrNbuHSmE5PU6KgsDYaSKR
Er7seCqd8pkIKWiqk92w6IlRGfmWtP3194Cdd/6/S1ulH2GhSp4ROKxksQ0SqUgy
WiEX/ONHT6zeJT1duBc353ntLAdV12QhAQtPIBgTuW6Y6SK0EiN2QyOntHW1B069
OIHn+owY0imNhUC8ed5Vzv4sYaXbsLoqGbQSSyWmsTa4W+O3S3mNLkDQ10AbRGXF
hNXCrsUWExpp7mNWGKzzsPHMBR0UrnYwhRWvnA162GrgpB4L7m5TTRHVy/B2ht6d
2UE3wNYbzoLpA0C3rU4AMImMXmOh9f1g0Y2CTldviQOC8f0u7hpQ5CKqhBjRM5Vq
0YNydQcS46leJ5poRPSI
=4YEp
-----END PGP SIGNATURE-----

--nSY6dmU9u4MMxp1o--
