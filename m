From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 sound-asoc tree
Date: Mon, 10 Nov 2014 10:02:24 +0000
Message-ID: <20141110100224.GG3815@sirena.org.uk>
References: <20141110153132.259d49d9@canb.auug.org.au>
 <20141110043853.GA25797@kroah.com>
 <20141110155142.6c76de7b@canb.auug.org.au>
 <20141110050719.GA16980@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P5xTlxNLdns8vXW+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141110050719.GA16980@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
List-Id: linux-next.vger.kernel.org


--P5xTlxNLdns8vXW+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 10, 2014 at 02:07:19PM +0900, Greg KH wrote:
> On Mon, Nov 10, 2014 at 03:51:42PM +1100, Stephen Rothwell wrote:

> > I assume that there was a good reason not to farm these patches out to
> > their respective maintainers?

> Yes, It was easier to hit everything in one tree, at one time, so that
> is what Wolfram did.  Sorry for the merge conflicts, I didn't think
> anyone would be adding .driver attributes to files after they had been
> added to the tree.

People are rather more likely to do that if they know that not adding
driver attributes is a thing, and that's more likely to happen if you
tell people that this change is happening, for example by sending the
patches to them.  This merge conflict was the first I'd heard of this
being something we wanted to do.

--P5xTlxNLdns8vXW+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUYI0vAAoJECTWi3JdVIfQ6bMH/R+In8J+XvqgARfGFcdrVJV0
GznxqoqrMFolgcAMvTAtcF2s0ZHYVUkHYD619AB/6WodhS+GFikyBlGqV98TIwKv
ps3qjtJQbe8Z1hx+CO6TyF0aEHjmu3utFzME5HjUCHlduQdoJoTaPNYCCLHO2OvW
5C9gfkzSF1aj3mj5bXlSRDXA1g8SMsrN0Dqj2Q4bk2+sUs9P7KDXRAhJdAKios/q
mWklA7ATaDD2pQpYKXHBzshaIdBYuHhaPEbQVTxhLygERg+/RczZggVyBo5D2htk
2CsWAJ/PTlZsyKrCZ1Cdnv+QYof4DoAtf+0jjbDoFPvfFkfp0Tea6VScLJ22zHA=
=SNfm
-----END PGP SIGNATURE-----

--P5xTlxNLdns8vXW+--
