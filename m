From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 19 Nov 2015 10:38:25 +0000
Message-ID: <20151119103825.GM31303@sirena.org.uk>
References: <20151119113528.7262d470@canb.auug.org.au>
 <20151119030209.GA25173@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V/VNt6jARIhH3MER"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38848 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758079AbbKSKik (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Nov 2015 05:38:40 -0500
Content-Disposition: inline
In-Reply-To: <20151119030209.GA25173@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinod Koul <vinod.koul@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mengdong Lin <mengdong.lin@linux.intel.com>, Harsha Priya <harshapriya.n@intel.com>, Conrad Cooke <conrad.cooke@intel.com>, Naveen M <naveen.m@intel.com>, Sathya Prakash M R <sathya.prakash.m.r@intel.com>, Yong Zhi <yong.zhi@intel.com>, "Fang, Yang A" <yang.a.fang@intel.com>, Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>


--V/VNt6jARIhH3MER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 19, 2015 at 08:32:09AM +0530, Vinod Koul wrote:
> On Thu, Nov 19, 2015 at 11:35:28AM +1100, Stephen Rothwell wrote:

> >   a86d505783e4 ("ASoC: Intel: Skylake: Adding nau88l25+ssm4567 machine driver")

> Okay both went it same time, I will send a patch for this

> Somehow Feng's bot missed this...

There was a mail about it - it came out too close to when Stephen
usually pulls for me to do anything about backing things out.

--V/VNt6jARIhH3MER
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWTaagAAoJECTWi3JdVIfQ0h4H/0soC68mmNPDQTDCmxn9UBSr
HffWyMD4KAjQ2TsIpXM+g3Ov3skVreemkZYjxEh1tJK93qlgYpACy/RIUnH3eN2y
XhrkQAoL2YTkqYG9NtgWc2R98B2QuwAGPvNPBhPhXuwk+1/nV1i1kKmK2E1R+0ds
x7S+LkQOodaUE4exFwR+2+7B9fIfeV8og1rUq8WoLxWJnJzoBVAsmqElJ/86BaWr
ahS2WEdY/ECZp7dmABUKHkynNlzEvnKzwA2ESe2r4kYUF6ChANVnYHv7mzmYmUYZ
9uyVkGav/A26q97ykcbEGOuKwe3I9Ve2paRHKaGQuvAu8b4d4QlKCB/8HxikP58=
=EiQe
-----END PGP SIGNATURE-----

--V/VNt6jARIhH3MER--
