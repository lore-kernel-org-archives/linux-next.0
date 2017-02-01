From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Wed, 1 Feb 2017 10:03:43 +0000
Message-ID: <20170201100343.yv5e66pxkdmlnoxm@sirena.org.uk>
References: <20170201134221.7a413d9b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l25mtejarce4kgvy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50546 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751376AbdBAKDy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Feb 2017 05:03:54 -0500
Content-Disposition: inline
In-Reply-To: <20170201134221.7a413d9b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>


--l25mtejarce4kgvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2017 at 01:42:21PM +1100, Stephen Rothwell wrote:

> Caused by commit
>=20
>   524d339a9d6b ("regulator: anatop-regulator: constify regulator_ops stru=
cture")
>=20
> I can only assume that this patch has been rebased since it was tested.

Discarded that commit.

--l25mtejarce4kgvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAliRsn4ACgkQJNaLcl1U
h9AIwAf+P8ZcAhqtrPNAGq7zjKH3f+LsDt8qgiDoM/MRIiwHeyG+1Zjal35zSanU
CQ0pSqltE6tGtUM7jv6So3EijNdtrea1ISSv7kHGlunmNkdwA0CkCYj0+R+F8sT0
e6Lmp4JN1m1lkI86ShvDE6vduPcmFaYC58CFImMztfAFCLnnkwJGt1SEoJf54QGD
etBNMH3QDgS11dvjwfJdjW9g0mKnhmzwQE49tq6ogaEE4v53Gl9aW9gzjRSCsM9d
QEQkjbe0C9Xcu6DqwWudQmMaFYIDsZH9Eu9jWpo4sshuly7k2HRNfz3VfJDEnNxS
9oeTLNYO11mAVEr2DCzIV1BO+ekFLQ==
=iAW1
-----END PGP SIGNATURE-----

--l25mtejarce4kgvy--
