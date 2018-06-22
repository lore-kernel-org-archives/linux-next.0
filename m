From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Please add the fsi tree
Date: Fri, 22 Jun 2018 13:10:48 +1000
Message-ID: <20180622131048.61b2dcfc@canb.auug.org.au>
References: <c304c6e08d7baa6e725c2634ea94b7fa326edd5a.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/I_9YCRHRbnEQTI/HFKZ6JK_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c304c6e08d7baa6e725c2634ea94b7fa326edd5a.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/I_9YCRHRbnEQTI/HFKZ6JK_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ben,

On Fri, 22 Jun 2018 11:53:50 +1000 Benjamin Herrenschmidt <benh@kernel.cras=
hing.org> wrote:
>
> Please add the fsi tree at
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/benh/linux-fsi.git (maste=
r)
>=20
> To linux-next. It contains the changes that I will send to Greg KH to the=
 FSI
> subsystem used by the service processor to communicate with IBM Power chi=
ps
> (and eventually S390 as well).
>=20
> Commits in there are intende to be merged via Greg's tree. Signed tags in
> there have already been the subject of pull requests to Greg.

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/I_9YCRHRbnEQTI/HFKZ6JK_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlssaLgACgkQAVBC80lX
0GxAJQf9E+ydy3+L+bDzJqJYJNnvyvSpNv9qJev5DWiQYSE/Ch3+6HRe5dkISg6p
t4RJiKDG3JpesfnYe1NaTjRjb7xgMyaU54W2CHQAygLmoMZd54r3nPjLuqPARiuA
O9KZVrTh7ghw98qdVnt3xfWVegXttg1IpA/TCCqdpig3pEfK6ufrG2YHXfVR9gFm
wFgQGlSc8CbDcbg2t+Rm2i2NiGu88jlz9S6r4FEcOO+TmnDf/9GGStIKRqQEodQE
theziVcmndJpj89PC1k6tuPqlS8zC4dObIQzf5Pl+IIAYjxiPh6agl6jVk4futGb
s2UvbfsYH1FdvlRYc96qZeNNcaiM1w==
=c9Xq
-----END PGP SIGNATURE-----

--Sig_/I_9YCRHRbnEQTI/HFKZ6JK_--
