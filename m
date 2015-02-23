From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: error fetching the ipmi tree
Date: Tue, 24 Feb 2015 07:20:04 +1100
Message-ID: <20150224072004.534ccb5a@canb.auug.org.au>
References: <20150223102312.7029616b@canb.auug.org.au>
	<54EA8C99.50000@acm.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZPvoZVK.iGLOzX6Phk6n8vp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54EA8C99.50000@acm.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Corey Minyard <minyard@acm.org>
Cc: Corey Minyard <cminyard@mvista.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/ZPvoZVK.iGLOzX6Phk6n8vp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Corey,

On Sun, 22 Feb 2015 20:12:41 -0600 Corey Minyard <minyard@acm.org> wrote:
>
> On 02/22/2015 05:23 PM, Stephen Rothwell wrote:
> >
> > While fetching the ipmi tree
> > (git://git.code.sf.net/p/openipmi/linux-ipmi#for-next), I get this
> > error:
> >
> > fatal: Couldn't find remote ref refs/heads/for-next
> >
> Hmm, I haven't touched that tag.  Sourceforge has been doing some
> strange things lately, I'm wondering if I should switch to something
> else.  I guess I could have accidentally deleted it, too.
>=20
> Anyway, those changes are all in Linus' tree, so I just moved for-next
> to master.

Its gone again :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/ZPvoZVK.iGLOzX6Phk6n8vp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU64t6AAoJEMDTa8Ir7ZwVbBoP+gMniwMwHVwilvRoskPL4+iR
6Cf7UdO3vEWhT79KKaJsDyiAac3Suu1iqlUUtAYytm3CRPvEBr2nInl4GYlB9oDi
Klow52fmIWT5YNN+4g88TZ7nV5hHSAZi3uPs1d/n3FHdqkM1gOfw3mXvmdF90N2L
ZGI1wV2ekYPzhW+xKq2+MQzxuSABsJaBwmMepRv0XkssVqmJ8HIoMpJeOI9vZFhr
BqP7m4VVElRJfFLDOolvJj12em2FaEJX+7wTeaH+clT4y0Ld32MLVb3/B+kU9iJL
b3qpfYaIjfeGvj4YHSWNy4b0ddx4lELkJHwSPV9ND1gwSENQXQgoeyemPtseAw0L
mz+60IYXZfI8aZgyxMCDmHtXkR/WRr/Nz2/EALWqQ2CZrAz330+lABIneQRE5ZpU
KPNjrocP7V+l6ICqip/Xpj/ebsXStI7lDp8xplTMErsagOOmyHCXRdL8vqz6kkuR
o76lB5PIord+7m3OnqpNPJ5ILRVwfAr8mW0qIZs5n6bfa89sLuqSj714c1ynVUYw
RtqRWd9X8hFJpn2MHAiH1JXuJCUMeR1U/9jttQMErQqnsmLVtjNgXXtfhwK2cXqM
V7CHABzpUHELTfvDmdADzRb9UtnDi8U/9D2/cKwRk6YZZyopMJ9N9dUqsfW94oPC
1x2yE5KhH4XEU7BiTQZX
=SPTP
-----END PGP SIGNATURE-----

--Sig_/ZPvoZVK.iGLOzX6Phk6n8vp--
