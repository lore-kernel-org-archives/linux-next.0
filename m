From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for May 21
Date: Tue, 21 May 2019 16:18:51 +1000
Message-ID: <20190521161851.49dbcf95@canb.auug.org.au>
References: <20190521151402.19f22667@canb.auug.org.au>
        <CAK7LNARngiQTT2-Y0pFFbENiqAHsy0_6AvWsMRhL9Fqwo=gb-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Hg6h6SYoJ4msJF0GufiSt7s"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNARngiQTT2-Y0pFFbENiqAHsy0_6AvWsMRhL9Fqwo=gb-A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Hg6h6SYoJ4msJF0GufiSt7s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Tue, 21 May 2019 14:48:21 +0900 Masahiro Yamada <yamada.masahiro@socione=
xt.com> wrote:
>
> FYI.
> Commit 15e57a12d4df3c662f6cceaec6d1efa98a3d70f8
> is equivalent to commit ecebc5ce59a003163eb608ace38a01d7ffeb0a95
> which is already in the mainline.
>=20
> The former should be dropped, shouldn't it?

I have dropped it.  I assume andrew will take it out of his patch queue in =
due course.

Andrew, this is:

  15e57a12d4df ("kdb: det rid of broken attempt to print CCVERSION in kdb s=
ummary")

I dropped most (all?) of the rest that you have sent to Linus, but this
hit Linus' tree via another tree.

BTW, Masahiro, please trim your quoting to just the relevant bits,
--=20
Cheers,
Stephen Rothwell

--Sig_/Hg6h6SYoJ4msJF0GufiSt7s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzjmEsACgkQAVBC80lX
0GxBjAf+Lfpbc1nCiMviu5YVgp/1C8ZUE1lBN4B1Pv6eDB6RUy7EoKd09Owr9/a8
jF0hEcwGtB8zx2lUIvxfwFnZAJomRD4Yif1TNHI5yyuf1hH45ddjI+4ZkmTIBmN/
vkJHDEq4sYgUxcy8RSVWhYufYC4DRAI/kXnjbqOkc7T1gzLDzOiswsMyw047YkPi
QJgoRQg4rDFLZCGJjO/3MqIWIx3y2lsZS0Tm+gxHRBqL1YTpR8AviunwXkhwmJAJ
QhBshQssvkRdF+YyxJMfHG2wZxHbT2FJOYGvk6VVRLPrOPlFfwRB5Iy3N5BQ1W6K
JWLADeQK2USVxFrG2L0XSkrjW6rPyA==
=kCQP
-----END PGP SIGNATURE-----

--Sig_/Hg6h6SYoJ4msJF0GufiSt7s--
