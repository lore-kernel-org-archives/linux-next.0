From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2] ARM: pxa: fix regulator related build fail in
 magician_defconfig
Date: Wed, 7 Mar 2012 14:57:17 +0000
Message-ID: <20120307145717.GN3107@opensource.wolfsonmicro.com>
References: <1331084814.11802.YahooMailClassic@web29012.mail.ird.yahoo.com>
 <4F5774B0.1030209@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="keoAwTxaagou87Dg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:41000 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757211Ab2CGO5U (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Mar 2012 09:57:20 -0500
Content-Disposition: inline
In-Reply-To: <4F5774B0.1030209@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Paul Parsons <lost.distance@yahoo.com>, haojian.zhuang@gmail.com, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--keoAwTxaagou87Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 07, 2012 at 09:46:08AM -0500, Paul Gortmaker wrote:

> Thanks for the report.  The regulator code is rather foreign
> to me, but I think I figured out the expectations on the names
> last night when looking at a similar patch here:

All it's looking for is the output of dev_name() for the device.

--keoAwTxaagou87Dg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPV3dGAAoJEBus8iNuMP3d3E0P/066NtalqWq8yKPCJfJpHBKn
t35PXBUX/2df9p1P5vYz2KPJbNMq9Eoj4zrk38juI1YoU8LLdUWrin/p7bBKbV42
M+bz5NEM2HHfcx+0O1HR971TfF5nC7eMSusP2bDRAFcBjpDXg8fPzPNSYvBH1+vT
tJ3Rsgft9eTobKpX48RwusNI7bPuwisMMSPO3k6cNVr03IRzgi3uQh88mohD3Gte
AOSPtQbUiQyHvLuetqSq41jdUjGFoWwFEFqF1v61YBj2MGP1IdBUYXTYQ4medd1Z
0rUuX75+VM3uSDcoX449Vy217VVkpj0u4S1unCNNtarXK9QhrPm3UeAmWwkDrp1i
b128Nk2FYeImr/pTbxObYnRZop4LZfbqmt/8EBhotopx/ibjkVlKJSeVmHSe5v+Z
xq8R4iQTcdJoK1VjQrE9f2pssP1M+D3RKOSQCJArpyDFKeP2Fw12lAqXhkjiITJi
pzVpMnjstrJ4BP9T/Rlq50oj9yS+IdK60TUc22vYJZXrk9AE3hnocu+g7nUvKa/j
ueWt7kFNGm2MpbBfjMQL8SqDlSc+ERjAwGoLCRG5LV9FMmHgX4xZdqU86UMd1UfD
jF1LK/OfuSYKNYcFxpMj3uDzxHMx6GCBsdr8y+NuIdwG3/NQT2v4qs2AP5r+C7te
iKl6uy7iLljYfc9FIsnM
=KY2T
-----END PGP SIGNATURE-----

--keoAwTxaagou87Dg--
