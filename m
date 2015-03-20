From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the spi tree with the jc_docs tree
Date: Fri, 20 Mar 2015 12:33:03 +0000
Message-ID: <20150320123303.GI2869@sirena.org.uk>
References: <20150320162354.3ed4a511@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zuGyJ7KNSMOGsxcs"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37796 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751147AbbCTMdM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2015 08:33:12 -0400
Content-Disposition: inline
In-Reply-To: <20150320162354.3ed4a511@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Adrian Remonda <adrianremonda@gmail.com>


--zuGyJ7KNSMOGsxcs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 20, 2015 at 04:23:54PM +1100, Stephen Rothwell wrote:

> Clearly the one commit in the jc_docs tree is supposed to do the same
> as three commits in the spi tree.  The jc_docs tree version has an
> older Author date, but a newer commit date ...

> I fixed it up (by using the spi tree version of the file) and can carry
> the fix as necessary (no action is required).

That's the fix I'd expect, thanks.

> BTW, there is a function in there called "unespcape" whose comment
> calls it "Unescape" which would make more sense.

Probably, yes...

--zuGyJ7KNSMOGsxcs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVDBN+AAoJECTWi3JdVIfQU7QH/2SG6vLtaqGq9TWmRjUoDjLQ
uynggVotWJPxbMj74ZSITpSCLMJX0gDBeyoRYAhw0s3eV58UO5Fb2NM7JX7isDPz
HOp278P9BNCBUXFvhvQfwhZl/I0F7RtHSOSa1ndBXIwVBs9A2cXlqlcJ9zuuGSrG
nvfW91NF2SUhgvHI6231bGTne9TkBxbceaDtrIB7jfocjw7cNk7apItUIWlpnrqn
RVuTZ+I55hgBW98IMbD6tI9xUuRcVmtQoeLjN+Y3B5tbaklH+PYwBVJMfr+Eb/Pi
Bnw6MSdoubwS37hDrotO6m3+RuE2Mq55jKBLpWXTdMHXRNMO+eWWfy75RNL9OXU=
=sqVe
-----END PGP SIGNATURE-----

--zuGyJ7KNSMOGsxcs--
