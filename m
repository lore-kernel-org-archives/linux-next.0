From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Mon, 1 Jul 2013 09:42:02 +0100
Message-ID: <20130701084202.GR27646@sirena.org.uk>
References: <20130701141827.8f9122f0b6ca860fa5fd11a5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2D9EG7COLye/vM78"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130701141827.8f9122f0b6ca860fa5fd11a5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-next.vger.kernel.org


--2D9EG7COLye/vM78
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 01, 2013 at 02:18:27PM +1000, Stephen Rothwell wrote:

> Caused by commit 07a02e0b1a4f ("regulator: palmas: model SMPS10 as two
> regulators").  Clearly not build tested at all :-(  Grep is your
> friend ...

That's odd, it's also not been caught by Fengguang's system which
generally gets this sort of stuff...

--2D9EG7COLye/vM78
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR0UDWAAoJELSic+t+oim9vJsP/3+u3bJm45rGXI9Xqh6uxpJB
idUrIlPNlIxhuZfAnh8CCTy5QuptMW+cG8mrYfx2ZWmJOe/O1MBXPiDDGdMuVN7+
Xcgk6dy630YzEcWNShK4KVRSyGYtzFM1wOFxJ8fMQuYDYHtts+zP7U83cymOn4bE
mQNLXOkMkjwnTgdY7L9RjiGmvnDAXP6V6iUqxAG+m2ZgkjC1mWzR9x+is0abYybw
2inGlARJCNwlgheFCywkjNSUI1cvWFNNRB54RxDWLJDWITSG6Glhr6/CvCPgFHQO
GdvYMa6dy8IUVMWdzXdMCTaIVb+xYaropRBPhrKUoMGCDuqoN8GjXxO9CBiXzJy3
m9fUMGSHysWMorXS6/Y50ViP6Np8FvBOkZIvh7z2q0tnNDF2Zr6DYnu4KAIk8AEr
kwSb8RUKRe+prRdB9hahY87/cqLZlleNZibYaWt7543ICIIHwIIWP2q5RgPsX8LN
ej5NgBXuqCZDogsLOl6iFKAOFjTYvF9iNKAqP4YihbOPcJsIYAZDuYK9UEe6Y+tg
CUV0RmkGfDl8wXltqroRaMursfrdLl309aAGcqepvucnOBr3g0xiSwAnQAi133kr
z8auQYHCi8Ir+YmlqDnU9PbkVxxYHxNGMkNI6ghxy2QDZcg+nOWv5gGk66w2ka0I
Rb478fBF+dM7zJwXltAY
=4rJJ
-----END PGP SIGNATURE-----

--2D9EG7COLye/vM78--
