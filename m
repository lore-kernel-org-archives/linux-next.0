From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the compiler-attributes tree with
 the kbuild tree
Date: Tue, 30 Oct 2018 10:49:41 +1100
Message-ID: <20181030104941.4fef7dad@canb.auug.org.au>
References: <20181030104637.382c26d0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/prGLk=SPVJhnyjw2advDw+v"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030104637.382c26d0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/prGLk=SPVJhnyjw2advDw+v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 30 Oct 2018 10:46:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the compiler-attributes tree got a conflict
> in:
>=20
>   include/linux/compiler-gcc.h
>=20
> between commit:
>=20
>   94c7dfd01652 ("kernel hacking: support building kernel with -Og optimiz=
ation level")
>=20
> from the kbuild tree and commits:
>=20
>   5c67a52f3da0 ("Compiler Attributes: always use the extra-underscores sy=
ntax")
>   989bd5000f36 ("Compiler Attributes: remove unneeded sparse (__CHECKER__=
) tests")
>=20
> from the compiler-attributes tree.
>=20
> I fixed it up (the latter just removed the __CHECKER__ check, so I did
> that) and can carry the fix as necessary. This is now fixed as far as

On reflection, that may not have been the correct resolution ...

--=20
Cheers,
Stephen Rothwell

--Sig_/prGLk=SPVJhnyjw2advDw+v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvXnJUACgkQAVBC80lX
0GzSMQf+Ia9raa6TFw2/b2jCHHACUhRRGuG5IZf/7uwEQHp93IMNzbcIV3IYPapM
nZGLl07sn+Mg1YYLQnARGcvJGKGkixabUa3mNYBtRJBkRukux7GHLZvUrWK2X9ww
2/Pf9MvgYUH6ZrQMu0KG7yzFL6ll7m+ogB3oKQ4YXBw5Pi0YYIUeFi+zi5ApYWQr
dWaZb9sutM0L3DT8VA8XdCAGtYOvbJhJ/jsprLrUk7ljFdl+LRkWRTDR/CaA7yXq
l+ZN2VSo8or5lX4v8tCdeC4937q1mrXwdQuNMAP/UvEiQDk3JAXHmM6mapcwUftk
vrO753vgO/udpDX4q2Qmwb/h5Z/VHg==
=WAqG
-----END PGP SIGNATURE-----

--Sig_/prGLk=SPVJhnyjw2advDw+v--
