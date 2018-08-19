From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings from Linus' tree
Date: Mon, 20 Aug 2018 08:40:55 +1000
Message-ID: <20180820084055.1bdb876f@canb.auug.org.au>
References: <20180820081323.23a47af3@canb.auug.org.au>
        <20180820081618.1338cd47@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ftry/BxirO/GiNb9rQD5g.V"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180820081618.1338cd47@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ftry/BxirO/GiNb9rQD5g.V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 20 Aug 2018 08:16:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 20 Aug 2018 08:13:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next build (powerpc ppc64_defconfig) produced these
> > warnings:
> >  =20
> ...
> >=20
> > Presumably caused by my update to gcc 8.2.0. =20
>=20
> And this from the x86_64 allmodconfig build:
>=20
> scripts/unifdef.c: In function 'Mpass':
> scripts/unifdef.c:453:28: warning: 'strncpy' output truncated before term=
inating nul copying 4 bytes from a string of the same length [-Wstringop-tr=
uncation]
>  static void Mpass (void) { strncpy(keyword, "if  ", 4); Pelif(); }
>                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Note that I only upgraded my (host) powerpc compiler.

--=20
Cheers,
Stephen Rothwell

--Sig_/ftry/BxirO/GiNb9rQD5g.V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt58fcACgkQAVBC80lX
0GxDIwf/UyKYDkaRq2olbQxw2Jqpvqu6EjrNTJ+8MZwUQs0hjyVGCkRK7fhZcezf
otvFdJrGl+T5NPsp0BNGF1OTpzxLhW7XZRPGTOWnCdScUr6aSLOq1pLXO5XSv0Zz
5zwa02KdCzotypwFDye2sKTehoaCZmT7WczsNhDsYUfPelTVXqn04wn1EnYfLuve
0h7fVHFAAtZOczLyFLcTrecnv6hpeUzwLcK9Y+I+XcdOIaa/bLSy6ZPrkXmgIw+B
6/hJnukU7vxKachAb4YKCSZcMIPVlhpY/AdvH/eK/k5hedm+b2JNVhK2CoB0ANEe
riWf134YuC6xi2c3E0YWO/i1F8GEMg==
=rfm2
-----END PGP SIGNATURE-----

--Sig_/ftry/BxirO/GiNb9rQD5g.V--
