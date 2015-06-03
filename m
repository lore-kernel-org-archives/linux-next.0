From: Mark Brown <broonie@kernel.org>
Subject: Re: [linux-next] please include init-v4.1-rc6 branch for v4.2
Date: Wed, 3 Jun 2015 19:54:52 +0100
Message-ID: <20150603185452.GV14071@sirena.org.uk>
References: <20150602232318.GI29898@windriver.com>
 <20150603133904.5d8b0bfb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nWclrlgqnAApBvUd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150603133904.5d8b0bfb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--nWclrlgqnAApBvUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 03, 2015 at 01:39:04PM +1000, Stephen Rothwell wrote:
> On Tue, 2 Jun 2015 19:23:18 -0400 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:

> > Please include init-v4.1-rc6 branch of:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux.git

> OK, I will add it in just before I merge Andrew's tree and see how it
> goes.

It looks like this has broken every build that includes modules which
I'm trying in my build reports - lots of implicit declarations breaking
the build.

--nWclrlgqnAApBvUd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVb017AAoJECTWi3JdVIfQrwEH/RpwRYnPD9gvtnpDCKg6bTa5
QiuV1lq3XdYuJgAVZ23re0KPVP5NfYpHrBOvZf4LWiGzq+6FiyMuQK29xqkutylP
ApeBK9RFsusw5cBp3R2jB5fnJPPR17eVqXQwEkWRZh9E3uxp01ZxCVYRDgRd66p3
n5UEW1SE2KHO73fkhJ1xEPYbML5idFr0jvmuoKmHqa7Zwh+RlMtNoS+nXnnJVh96
lO7SeBLHhrknOMk8A0WwAtIy3RWiT6ciB8MkedY44kzVThPVsSE9gFqSxTXVdmI/
bYXmVJX/NF2VoOX3tc+aKo1FXtTME3/ot3SO7VrVWzRrFTBQeSL5PS8ufEOeKgU=
=i4qA
-----END PGP SIGNATURE-----

--nWclrlgqnAApBvUd--
