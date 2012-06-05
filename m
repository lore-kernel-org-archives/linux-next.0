From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 5 Jun 2012 10:43:49 +0100
Message-ID: <20120605094348.GF23408@opensource.wolfsonmicro.com>
References: <20120605112557.61c2aaea05db2684cecb9835@canb.auug.org.au>
 <4FCDAD4B.4010808@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QXO0/MSS4VvK6f+D"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:46050 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753536Ab2FEJnv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jun 2012 05:43:51 -0400
Content-Disposition: inline
In-Reply-To: <4FCDAD4B.4010808@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: MR Swami Reddy <MR.Swami.Reddy@ti.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Girdwood, Liam" <lrg@ti.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deshpande A, Vishwas" <Vishwas.A.Deshpande@ti.com>


--QXO0/MSS4VvK6f+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 05, 2012 at 12:25:07PM +0530, MR Swami Reddy wrote:

> There is a typo in the sound/soc/codecs/Makefile for isabelle.o

I've made this change and squashed it down.

--QXO0/MSS4VvK6f+D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPzdS4AAoJEBus8iNuMP3d+0YP/0/oDAnJlagYAucuheuPemZw
WowHNnnnHPePl0T4UpQOQ9wVeG2MY6PCiZoIN2etxSiah30/UzYmFP62gXjcbdNE
sFC+3qsuMjDqyQpIMpnx/hjOWLhx0Soi6OQz2OSsYMGApVxvDwiwyRN4rzDiLDFk
xlxV7luB6GqeYgy07mV2OxlUjG3e7RsD1hXauZPft46Ij0GfsreuwXSwDdAZQ1oS
1TDA8nLfq7MDkAFaWWxcYz9Loq0pbshthWgt6iq+kcMemtDPnaHihu+JRC/197kY
uzx893r6MRV/9dVAkg0AoxSiCbGA5Mu8wxx9BfNs/QvSrDZc4pMvYDTOnUn1Ecij
4YenJlEAntYljLViRYzN0czCCSjGiqKwAg3wdCigZpl60r/DaiYKn1/DE1JwX9E9
+dLV/x5wICuMsnIhlgN+x55TRbu202e81JE5Zo8uiOEwGlJ5+z9tbcgRgizaqjPQ
8l7Jk8PmY7Ys0ZEk3fCj5C+BiQHAUwZnv4HjPdJJEIBDkl84RQ16ytfYhukbdY2R
vxcAVH3zZCQJudvLmg0KkvTH3jtZGg6Nu6uh/QpFkfEKp/RdCVUA5uhSLqIoyu4P
aAKnSewTuBFCgy5E21xsM8C+NrYKSI/CyBRDqCSWAD6KF1DzC0n7GH/bhCHx7EB2
0MsJaiZlQKC5qK7Ig//a
=MVqF
-----END PGP SIGNATURE-----

--QXO0/MSS4VvK6f+D--
