From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 27 Mar 2019 11:57:45 +0000
Message-ID: <20190327115745.GA11404@sirena.org.uk>
References: <20190326133349.3d9427dc@canb.auug.org.au>
 <20190326131550.GB10898@sirena.org.uk>
 <87pnqdndmk.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87pnqdndmk.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Annaliese McDermond <nh6z@nh6z.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org
List-Id: linux-next.vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 27, 2019 at 03:29:55PM +1100, Michael Ellerman wrote:
> Mark Brown <broonie@kernel.org> writes:

> > Hrm, seems PowerPC is still not using the common clock API - is there
> > any plan for that?  There are some ASoC PowerPC uses so it's going to be
> > a bit of an issue as we expand our use of the clock API.

> I don't know anything about the common clock API. What would it involve
> for powerpc to use it?

It's what's in drivers/clk - you'd have to provide clock drivers for all
the clocks that are current supported by arch-specific code, make sure
that those drivers can be instantiated and then remove the custom
implementation of the clock API in arch/powerpc in favour of those.

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlybZTgACgkQJNaLcl1U
h9B1Swf+PbhuOweQKwnnpdgGWrrDdszCdLjzP1NdPdjWVhB1B+Y8gm8uA2CbgSCQ
FHCL9GmY1si64Jg2+W+uD7o+rdg3neUXfZ3rmQ60mdvdmg8O+iz6ngwn2iJIbGy2
5zuQoky3maZLgElEQMKWlZ8A3nHQpk6BkWra83M7tZJJnU5SOQ69vE2oKK6sGfTf
Xu7R13qHpVeRNQU2baIRdbkhgQFl01wiRswA8JbJSAQmeMX3XcjwrDakT10USHNy
PnNPllnXLAE9brC8AeYr9vNQj7vTL5fjn94Gz9P0yX2dWbnVSy2Yc2QASwiKB4P+
2qblx6/w3O4uBa8dTNx45qHwObNlHw==
=kXyA
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
