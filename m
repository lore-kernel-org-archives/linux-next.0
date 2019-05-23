From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the block tree
Date: Fri, 24 May 2019 08:33:21 +1000
Message-ID: <20190524083321.7ada6382@canb.auug.org.au>
References: <20190524074500.1fde68d6@canb.auug.org.au>
        <20190523215206.GA15192@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bH4wz8EXsUVjijbXawieSEI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523215206.GA15192@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Keith Busch <keith.busch@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bH4wz8EXsUVjijbXawieSEI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Keith,

On Thu, 23 May 2019 15:52:07 -0600 Keith Busch <kbusch@kernel.org> wrote:
>
> On Fri, May 24, 2019 at 07:45:00AM +1000, Stephen Rothwell wrote:
> > Commits
> >=20
> >   5fb4aac756ac ("nvme: release namespace SRCU protection before perform=
ing controller ioctls")
> >   90ec611adcf2 ("nvme: merge nvme_ns_ioctl into nvme_ioctl")
> >   3f98bcc58cd5 ("nvme: remove the ifdef around nvme_nvm_ioctl")
> >   100c815cbd56 ("nvme: fix srcu locking on error return in nvme_get_ns_=
from_disk")
> >=20
> > are missing a Signed-off-by from their committer. =20
>=20
> Oops, I'd only added my Reviewed-by. Do I need to update the commit
> messages and resend, or is this just putting me on notice for next time?

That depends on Jens ...

--=20
Cheers,
Stephen Rothwell

--Sig_/bH4wz8EXsUVjijbXawieSEI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlznH7EACgkQAVBC80lX
0GzBnQf/dI0C/I6VfskUrct9z8/c/UiS7V4TOegHThOyh+n+WRFgZH/Pm7mezScA
uwqHlNd9CI9qIoQatQHg93I6tjtcB/hYSMDQEqTEvaBz39NqFZJuJWY4z+9Uk4YR
4QJRKSi99ABMrc4RtNQUFrk8fBW49M/uBpZ2McY0TheR4m/6Lom90a7WQyCyeqbz
w3CTOAP3UAd/KkMgEHYGKH1GI4XmdB15fstbGtd1XCTw0VjTWOu8r7d5IWYrSJWQ
Pkh8t1q2osTZFbe3Yti9iobdsbcF2oXt+EqyrZEGxaqMBbcw5uglQuS0t8gPhkAh
ls19SIdwHf4skdZraAqcipgaFH+K2A==
=D15q
-----END PGP SIGNATURE-----

--Sig_/bH4wz8EXsUVjijbXawieSEI--
