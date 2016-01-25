From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Mon, 25 Jan 2016 13:55:46 +0000
Message-ID: <20160125135546.GS6588@sirena.org.uk>
References: <20160115151401.03fe1a39ca397079407c2ca9@linux-foundation.org>
 <s5h4meductq.wl-tiwai@suse.de>
 <s5hmvs0uytw.wl-tiwai@suse.de>
 <20160121073859.3a6c22a3@canb.auug.org.au>
 <20160122112442.75c07aac@canb.auug.org.au>
 <20160122134045.438cd9d9@canb.auug.org.au>
 <s5h60yiatwt.wl-tiwai@suse.de>
 <20160125114150.GK6588@sirena.org.uk>
 <s5hmvrtajoy.wl-tiwai@suse.de>
 <s5hio2hai24.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c5q8qXpFyTLF5PN4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <s5hio2hai24.wl-tiwai@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Vinod Koul <vinod.koul@intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
List-Id: linux-next.vger.kernel.org


--c5q8qXpFyTLF5PN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 25, 2016 at 02:45:55PM +0100, Takashi Iwai wrote:

> Argh, a typo here.  I forgot to refresh the patch, sorry.

> Below is the revised one.

This makes sense to me.

Reviwed-by: Mark Brown <broonie@kernel.org>

though we will need to come up with an alternative solution for the
affected architectures if anyone ends up caring (MIPS or PowerPC might
possibly).

--c5q8qXpFyTLF5PN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWpilhAAoJECTWi3JdVIfQ52YH/RhJkqv5U0c57PLoWTOUQLcr
I5kdfpsbTaPKr9GtL2lMP8f6sjBUiurrT3e/gsEIj5Pd0KS7VOkZhqF0oxQaytE6
rooo8NGcJV1rCtV4V72zf3JUu+mcS49ixe1Vn642TUtMqUIUIcLA53Qe1iRo3j/s
UOXJvTEoRcWfZLwG7LvXAL0yEQm6nn2cro4V3u+RQ7PA3jxYSFdJaqn1SLRNNxfp
VnqPJXc435H95IRZ5SqxQOlCAUQ4aVz+w/7iC0RdcX0jgsucmW/Q1UjzKCisv7W3
KTP5ovu16e0EXmNWh9tpbPDsNWeN0nDwZ7HRdVVk2DAygUVSP/LvXsb+AYL7CQM=
=1VUL
-----END PGP SIGNATURE-----

--c5q8qXpFyTLF5PN4--
