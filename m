From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the compiler-attributes tree with
 the kbuild tree
Date: Wed, 31 Oct 2018 03:02:29 +1100
Message-ID: <20181031030229.725abfe2@canb.auug.org.au>
References: <20181030104637.382c26d0@canb.auug.org.au>
        <20181030104941.4fef7dad@canb.auug.org.au>
        <CANiq72k2w2T0Cy0D--OEmE+sOPkjZtXpukBm+Mz1_xY6MCGg0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vIAPEUP4/SKJQ3GhL8KG7X="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANiq72k2w2T0Cy0D--OEmE+sOPkjZtXpukBm+Mz1_xY6MCGg0A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, changbin.du@gmail.com
List-Id: linux-next.vger.kernel.org

--Sig_/vIAPEUP4/SKJQ3GhL8KG7X=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Tue, 30 Oct 2018 12:21:52 +0100 Miguel Ojeda <miguel.ojeda.sandonis@gmai=
l.com> wrote:
>
> From a quick look, it seems we want:
>=20
> #ifndef CONFIG_CC_OPTIMIZE_FOR_DEBUGGING
> #define __compiletime_warning(message) __attribute__((__warning__(message=
)))
> #define __compiletime_error(message) __attribute__((__error__(message)))
> #endif

Thanks, I will use that resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/vIAPEUP4/SKJQ3GhL8KG7X=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvYgJUACgkQAVBC80lX
0Gx3JAf/eVJt0/EOhXwgRqYifJrD+FC89QhfNKyFYuAqmLBxUk7rHOnybQdOU3qi
R41el3/EYubyTXzvxNkLQlO91nWE9QgZ42M+DpWsoETl+5fvC9aJdGDTVVHUKMdL
mo4OPmRUQEwNEHUptzSQIMp4QIvCid7XDrYEFNwi8v6bs9lU31TTWcelZcJm4Slv
CK+B/tQov9Qz3tfWwl0Evnqnc5uq1sB+IcQOoJj2C6TYzVRh/0LqqjcvOc25TdVJ
X8KLY6/5rXHA4p2e7o1s+jSmYBI9exFSfRyMYZYsG0dLfKQGeQ8Pn8iuc8j2hFXa
/YldAe85E09Hs7+s+NTjf1nmOtNEcQ==
=7XJ2
-----END PGP SIGNATURE-----

--Sig_/vIAPEUP4/SKJQ3GhL8KG7X=--
