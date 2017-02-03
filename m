From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170202 build: 4 failures 7 warnings (next-20170202)
Date: Fri, 3 Feb 2017 13:01:23 +0100
Message-ID: <20170203120123.ep5ceio5gzbnismn@sirena.org.uk>
References: <E1cZEYY-0006f4-PQ@optimist>
 <CAP=VYLraQvfRLdFMVCiqS9DtH-GHNYdM+CYZ_hJ+K8GwWLKT+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4i5ufqvawgpyy4vz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59512 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751878AbdBCMBf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Feb 2017 07:01:35 -0500
Content-Disposition: inline
In-Reply-To: <CAP=VYLraQvfRLdFMVCiqS9DtH-GHNYdM+CYZ_hJ+K8GwWLKT+Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Hillf Danton <hillf.zj@alibaba-inc.com>


--4i5ufqvawgpyy4vz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2017 at 06:08:44PM -0500, Paul Gortmaker wrote:
> On Thu, Feb 2, 2017 at 5:23 AM, Build bot for Mark Brown

> >         arm-allnoconfig
> > ../mm/nommu.c:1201:15: error: conflicting types for 'do_mmap'
> > ../mm/nommu.c:1580:5: error: conflicting types for 'do_munmap'

> Also in sfr build: http://kisskb.ellerman.id.au/kisskb/buildresult/129248=
55/

> Bisects as follows:

> 5b8d82e2e798609e113ec0dae37708f0578b68e2 is the first bad commit
> commit 5b8d82e2e798609e113ec0dae37708f0578b68e2
> Author: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Date:   Thu Feb 2 10:46:41 2017 +1100
>=20
>     userfaultfd: non-cooperative: add event for memory unmaps

I'm seeing that showing up as 197b090832eaa4a6e in -next, adding the
other people who acked/signed off on the commit.

--4i5ufqvawgpyy4vz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAliUcRIACgkQJNaLcl1U
h9BC0Qf9GCt92XSMzSQjAiZnbPgt+Loq7FLTmFhbXgmYlEVsPl3izQwdZp3Jeatt
9T+5P1s+P9+bceyuosSXqvqM09qXvNvaRg1AFUfof0sA3yCUN5BsP4z7wT6sRmFN
NDh1ldjfWGAzi8ACLAzuzFASuVKHYBcndCez30TL/I9wgz4Q1cV4Aw8dGhwPJcOr
jhz0bo2qi4cUopARty4sKy7aSC67cYa0Otv7y4pvAgtoSqldiHu1YZqCOXQqcSf4
OXCGet+l193FhnDBQeM/OGMappaGzPHENmIDj2iAw9na484266+tg8ThOZKWGHta
b/b7z0S5UEj5mJmkO7nbzdALE5Hkyg==
=5nVq
-----END PGP SIGNATURE-----

--4i5ufqvawgpyy4vz--
