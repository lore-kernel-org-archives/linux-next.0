From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Tue, 14 Apr 2015 10:40:17 +0100
Message-ID: <20150414094017.GM6023@sirena.org.uk>
References: <20150409143309.3a1fac67@canb.auug.org.au>
 <20150409093556.GP6023@sirena.org.uk>
 <20150414094403.30126f2d@canb.auug.org.au>
 <20150414010706.GB29061@sonymobile.com>
 <20150414112241.3dbad71a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SnJOJGP8ShXoHvY2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45959 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752323AbbDNJk3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2015 05:40:29 -0400
Content-Disposition: inline
In-Reply-To: <20150414112241.3dbad71a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hai Li <hali@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>


--SnJOJGP8ShXoHvY2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 14, 2015 at 11:22:41AM +1000, Stephen Rothwell wrote:
> On Mon, 13 Apr 2015 18:07:06 -0700 Bjorn Andersson <bjorn.andersson@sonymobile.com> wrote:

> > Your patch looks correct and should preferrably be added to the drm
> > tree, or the last patch in my series that drops the API wrapper should
> > be held back until rc1(?)

> It needs to be sent to Linus as a merge fix when the drm tree is merged.

Or the DRM tree could pull my tree I guess - Rob/David, I can make a tag
specifically for this branch if you like?

--SnJOJGP8ShXoHvY2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVLOCAAAoJECTWi3JdVIfQLuAH/A/mb5DOfxenjo01icwJv72s
i4mWOevqOPtBhrdms99hMO099q59FBof3n447Hpl+gMXjSLBsEz6V14310Kwb5Qq
ydFzoaA7VEkOTeNPqCrD3JZHB/snI5P4mYzW+H6uUCanRJNolA210OSlIZPD+TdQ
TrwSO5LMj8iKM00VoO3bifWTNcbdC/tQAg4lhS07IyPhR+71CnJtPLXhHipMYl4U
MAkbAAATJbWV3YgslCyemvIlhHfE4gYCLn2yaGIZynOmmC029QBSRdLEpOcgUqUC
lCNQKXARplWj2MdT9Pjg1y76KzBHKeX63JO5jJ7patiDsDe9V/D+sdkv3SYxWvM=
=bEoU
-----END PGP SIGNATURE-----

--SnJOJGP8ShXoHvY2--
