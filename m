From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for May 30 (firmware_loader)
Date: Fri, 31 May 2019 10:06:46 +1000
Message-ID: <20190531100646.212b065f@canb.auug.org.au>
References: <20190530162132.6081d246@canb.auug.org.au>
        <28716a14-772d-bc82-5111-34cd38cfda54@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PWONkdadaEC6ybOc1SCPBQ4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <28716a14-772d-bc82-5111-34cd38cfda54@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matteo Croce <mcroce@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/PWONkdadaEC6ybOc1SCPBQ4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 30 May 2019 09:10:13 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> on i386 or x86_64:
> when CONFIG_PROC_SYSCTL is not set/enabled:
>=20
> ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x1c): undefined=
 reference to `sysctl_vals'
> ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x20): undefined=
 reference to `sysctl_vals'
> ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x40): undefined=
 reference to `sysctl_vals'
> ld: drivers/base/firmware_loader/fallback_table.o:(.data+0x44): undefined=
 reference to `sysctl_vals'

Caused by commit

  6a33853c5773 ("proc/sysctl: add shared variables for range check")

Added some more cc's
--=20
Cheers,
Stephen Rothwell

--Sig_/PWONkdadaEC6ybOc1SCPBQ4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwcBYACgkQAVBC80lX
0Gxtegf/Qph5FzdyfJGZyjn0oChmSq959oJsCpiVzFEHiCERPRIauHX+L1OQL9nD
ByRaXZejxUJsK0zNqICBwPlvhKGVZ7sxl7h6JVLCAZS4SEF3CuMa5tTU2WFHfPbB
7EKPBiE+3elRLHEsCrI71UVwPIDJR7/ryul/7k85tU5qXq6i83JQpRjyURBDemue
cqG6sYrRI+o55scQjkQR6lwIIsadcSvajgr/cGNsUvl5HRzhvwXQvksOtY28C1lR
+x//HM4rx8Gjog4iSlnqOf3/+fTtlxaC0yr+ZixACNCSX9bfJpTyNO645NkHKODu
WKAkI3bxb1uSz2JOwmORRm4KUUpQtw==
=uahV
-----END PGP SIGNATURE-----

--Sig_/PWONkdadaEC6ybOc1SCPBQ4--
