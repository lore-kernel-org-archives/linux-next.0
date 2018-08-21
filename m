From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the mfd tree with Linus' tree
Date: Tue, 21 Aug 2018 18:30:12 +1000
Message-ID: <20180821183012.3b9bc4f3@canb.auug.org.au>
References: <20180817103913.52544928@canb.auug.org.au>
        <CAMuHMdUQcoMxb=0_i1PYyymUpQ1VBOub+EgDbRJWmrq8_xJ-uQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/o/rc/HqUFPGy6qX3Oe14Lpm"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUQcoMxb=0_i1PYyymUpQ1VBOub+EgDbRJWmrq8_xJ-uQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lee Jones <lee.jones@linaro.org>, Linux-Next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, rf@opensource.cirrus.com, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/o/rc/HqUFPGy6qX3Oe14Lpm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, 21 Aug 2018 10:08:54 +0200 Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>
> To obey sorting rules, the CIRRUS LOGIC entry should be before the CLANG
> entry.
> Upon closer look, it should be inserted before the CISCO entries, too (in
> the mfd tree).

Thanks for noticing.  Unfortunately it is badly ordered in Linus' tree
now as well.  Feel like sending him a patch?

--=20
Cheers,
Stephen Rothwell

--Sig_/o/rc/HqUFPGy6qX3Oe14Lpm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt7zZQACgkQAVBC80lX
0GyJPAf+I6h00MmuBtxb47tUmnuVKLFuXkD7XfSse+Q4s7hxqynqPtJaNWgS1vXT
SIAqUFdLO2e2PjlMFlxaOci8wQUk5+oOaC5QqBkI1HdSRHNVqtzdMuKpXJqB+xfY
PL+f66ygrpLNJEdUKEvIfOfLf7ykFtAZT6gzunxGuHQJ63lAWJUsVzV6X5uR5P2h
jUvLy/LYCRcT4o6Em0LfR3n4HNeL57fWHyCqarq/TgZguOvePictRJvL87L0cBzd
QYwOLin3Gv9GwanIYwYMNezAMepgBUzvH2W+SM7G9PnPJ7b3IrFb24g6X0igT/+I
Ntm0+9OOAOGcIvHjuB7+x3KJ7Pp2dA==
=9pJG
-----END PGP SIGNATURE-----

--Sig_/o/rc/HqUFPGy6qX3Oe14Lpm--
