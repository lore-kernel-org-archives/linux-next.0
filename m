From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: boot failure after merge of the akpm tree
Date: Fri, 31 May 2019 13:41:03 +1000
Message-ID: <20190531134103.6fc980d9@canb.auug.org.au>
References: <20190530161741.0b4c3e92@canb.auug.org.au>
        <1559269507.z7w3zfjexi.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PlQLemxBvR/fwW+Gj/sMO9m"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559269507.z7w3zfjexi.astroid@bobo.none>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/PlQLemxBvR/fwW+Gj/sMO9m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 31 May 2019 12:27:58 +1000 Nicholas Piggin <npiggin@gmail.com> wrot=
e:
>
> > I have reverted
> >=20
> >   c353e2997976 ("mm/vmalloc: hugepage vmalloc mappings")
> >   a826492f28d9 ("mm: move ioremap page table mapping function to mm/")
> >=20
> > (and my fix up) for today and things seem to work (if only because the
> > BUG() has been removed :-)). =20
>=20
> Good to know, maybe I didn't test powerpc without later enabling=20
> patches...
>=20
> The series also has a compile bug on ARM I have to work out, so
> yeah drop those for now, I'll post a v2. The large system map patches
> that I posted in that series can stay I think.

OK, I have removed them from the akpm-current tree today.

--=20
Cheers,
Stephen Rothwell

--Sig_/PlQLemxBvR/fwW+Gj/sMO9m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwok8ACgkQAVBC80lX
0Gw9yggAiBpwmM3Sfbs6LzWUB+rlFP9IQi6z8R9JbCdzAp2Fs/6WVlKtdSR5WJil
gNl55rQxGvsq0qnKRplDswk7AFFS2ruqlfJ6ZPYMnTrgy6KwFq9M+spGeQJcuPqd
lxGNxp/k/K+6KNi2Z9gJiXYQj0zvqib4VTSFtUozLXUrfRzvTOaqVcbfY7Qb8PtR
gKjeQxHxV6blptZJhkixqxjQdhKiv0WQxwXN9Z6K0GHml/8amyAJHCUdj2d1LakJ
IF9jGQviN6jyDOQoPHGDjqs9nPaqca3nglfdZdIw8Ssllfp4/qJsD/JJiJHk2CRg
JE4FUi/cuUfaRE2fjUhWKGx4aQ2xRQ==
=+FzF
-----END PGP SIGNATURE-----

--Sig_/PlQLemxBvR/fwW+Gj/sMO9m--
