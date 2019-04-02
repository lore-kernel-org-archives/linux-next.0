From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 2 Apr 2019 12:14:07 +0700
Message-ID: <20190402051407.GX2059@sirena.org.uk>
References: <20190326133349.3d9427dc@canb.auug.org.au>
 <20190326131550.GB10898@sirena.org.uk>
 <87pnqdndmk.fsf@concordia.ellerman.id.au>
 <20190327115745.GA11404@sirena.org.uk>
 <87tvfiou8f.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xd9y+pRso0hzCdjI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87tvfiou8f.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Annaliese McDermond <nh6z@nh6z.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org
List-Id: linux-next.vger.kernel.org


--xd9y+pRso0hzCdjI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 10:11:44PM +1100, Michael Ellerman wrote:

> Anyway I think what you've done in next, make the code depend on
> COMMON_CLOCK, is the best option. If anyone cares about that driver on
> powerpc platforms that don't support COMMON_CLOCK they should speak up.

It's probably fine for now for this one driver but it's going to cause
issues going forwards since we're trying to make the framework's clock
handling more standard. =20

--xd9y+pRso0hzCdjI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlyi754ACgkQJNaLcl1U
h9BMxQf/VrR/8FAWEVz+p5IAVWhEp/5r8gGBQzY33Bg6n8m4Wx0mFHVfDDxORd/L
SYSWqWbDGTk1AwbZ59dzTXaGEhh/9YX9/g5v6INunPhClb7NMBIvddfzvFv8pDTd
nI6DbaUyOnQzFtXTMF+ClhtKHxRBVbT6MwFKFOLcoPRjkhU9ebaiaVmBrzOoaq6N
dqDF7ukc0T15k/qvZ38kKczZA6m4DsGhVoSvpXxe5MucSHe7wphRFwyaJ8+S2AFR
AYvOQJNcYPi4pJYpcQ8i6cX4lJecezofZkVbj+b8WBCjndlieq5CZtB76qLevleN
WB8m8oAwM1GH+wdKRlWDmJWIOgRb3A==
=JFD3
-----END PGP SIGNATURE-----

--xd9y+pRso0hzCdjI--
