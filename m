From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Fri, 27 Jul 2018 20:55:11 +1000
Message-ID: <20180727205511.7c0f2e62@canb.auug.org.au>
References: <20180727190207.7ce1c9b0@canb.auug.org.au>
        <20180727190647.3525f5f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//MxW2J=yvZSzDuys=8bHiKQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727190647.3525f5f7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Popov <alex.popov@linux.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Laura Abbott <labbott@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_//MxW2J=yvZSzDuys=8bHiKQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 27 Jul 2018 19:06:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 27 Jul 2018 19:02:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the kspp tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > cc1: error: plugin stackleak_plugin should be specified before -fplugin=
-arg-stackleak_plugin-disable in the command line
> >=20
> > Maybe caused by commit
> >=20
> >   a8b9eaddb9c0 ("gcc-plugins: Add STACKLEAK plugin for tracking the ker=
nel stack")
> >=20
> > I have used the kspp tree from next-20180726 for today. =20
>=20
> Well, that obviously didn't work since the tree hasn't changed for a
> few days.
>=20
> I can't see what has interacted to make this happen, so I have dropped
> the kspp tree for today.

Actually, it may have been caused by commit

  0b3e336601b8 ("arm64: Add support for STACKLEAK gcc plugin")

from the arm64 tree.
--=20
Cheers,
Stephen Rothwell

--Sig_//MxW2J=yvZSzDuys=8bHiKQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlta+g8ACgkQAVBC80lX
0GyW5Af/Y2U/8zWYM6WuJoKtsZqilpTLFdQTb6qu1uonQZvNl7BrVSTLVsNx8Bqf
XCxyp7kpi8MU5PPcZIz9uzpZFlSyERGC8RLz+8lYF9eTTMwZ3tj1bv51GZiY7odK
6uuFelrtmzwbRzkvGJg5ixcVLL3RMRjW51Y8QnEgQTPKHuV3Db6LtjYrm5tY6HJb
HqI7aQqjrmiXU8SsMpYc/7uNJqmUEk8CoQb9mOULy5q935T7KKjx62+1GedlNhY5
1wGKxCmjPrzJoqi9Lu/z5DCvlwR2cjMxVehOHmA9O8f6PMP3RS2kWDab6demzBvo
slqxP9aY3hewkb8/Hn+2rFOhQazF5Q==
=G802
-----END PGP SIGNATURE-----

--Sig_//MxW2J=yvZSzDuys=8bHiKQ--
