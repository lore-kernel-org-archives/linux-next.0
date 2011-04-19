From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Date: Wed, 20 Apr 2011 08:30:55 +1000
Message-ID: <20110420083055.c1ecb529.sfr@canb.auug.org.au>
References: <20110420082514.a9ec4d68.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__20_Apr_2011_08_30_55_+1000_5Vq./ilnbT=jaqta"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110420082514.a9ec4d68.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__20_Apr_2011_08_30_55_+1000_5Vq./ilnbT=jaqta
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Wed, 20 Apr 2011 08:25:14 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the kbuild tree, today's linux-next build (s390 allnoconfig)
> failed like this:
>=20
> /opt/crosstool/gcc-4.3.2-nolibc/bin/s390x-linux-ar: illegal option -- D
>=20
> Caused by commit 09ff9fecc039 ("kbuild: Use the deterministic mode of ar"=
).
>=20
> $ /opt/crosstool/gcc-4.3.2-nolibc/bin/s390x-linux-ar --version
> GNU ar (GNU Binutils) 2.19
>=20
> I presume that this version of ar is now too old to build the kernel?
> Documentation/Changes only mentions Binutils verion 2.12.

This actually broke nearly all my overnight builds.  Version 2.19.1 is also
not new enough, but 2.20 is ok.

I am going to have to try to revert that commit today or go back to the
kbuild tree from next-20110418.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__20_Apr_2011_08_30_55_+1000_5Vq./ilnbT=jaqta
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNrg0fAAoJEDMEi1NhKgbsaXUH/0jkNVZgWj5LPcq+JxUWlx4w
Uj+uic+kw0XD1U2TmcY5Md8pFvtzGlPVh7dpggz60h0gNpTEL2En510Osrx3zh4A
WeBE4rYTTs7EJWyvyWxdu8QxTtH4d3TJ9HMxFKQLBZ5lNoExT+E4vPNu5yXQJ8Tn
jsEjACLhDMO4Lvlmz3F+YKQ0pLFq92jnomHcX69oaeaQImhnWHYIyPgbeoIbab+i
Bv3NSdr50RyRy080Jbk+boYhCecVPH1Xj/1QYkULkmzj9ClKGUXYNFPMQ2eErvb9
+VotDk/QABnyurK1l8RUGvXJ0tWyEzLpHVJgtb8JCznkiVkks3yUabKcS/faQ2U=
=YKbH
-----END PGP SIGNATURE-----

--Signature=_Wed__20_Apr_2011_08_30_55_+1000_5Vq./ilnbT=jaqta--
