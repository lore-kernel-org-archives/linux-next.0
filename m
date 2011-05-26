From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning in Linus' tree
Date: Thu, 26 May 2011 11:00:35 +1000
Message-ID: <20110526110035.fe9bac87.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_May_2011_11_00_35_+1000_F0xZmw49Usc2XcAN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Lameter <cl@linux.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__26_May_2011_11_00_35_+1000_F0xZmw49Usc2XcAN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

With Linus' tree, today's linux-next build (powerpc ppc64_defconfig)
produced this warning:

mm/slub.c: In function '__slab_alloc':
mm/slub.c:1834: warning: label 'unlock_out' defined but not used

Introduced by commit a71ae47a2cbf ("slub: Fix double bit unlock in debug
mode").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_May_2011_11_00_35_+1000_F0xZmw49Usc2XcAN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN3aYzAAoJEDMEi1NhKgbsqbcH/jX8KntNE6cmrh5xieKLosM1
JxAnJD691fRtLTmhcrj2EUZa02M2A8nXd2z+tmlqDw4ln/2z+gP8BQs6uqtIApu6
pr08zDQhpq9f0noG0nCZ5quhI4HC7tQa/IHr36CSEB/xy+MMWFbuGpc3TIVJccS0
pai0ypSqOPZdCf3WZC27/RBj/NUYDpNIQpLe3/8LcrXCzszDoSe//PancIzHD538
jwXs6JbArFxdM8846jHzAQOTBc1mqfKN9SCH4aowwS8CrAJdlajyU3LGtgt2H4tu
LL6Jms+L/SUvKnyLwAaAXw1Y7K2NCmcTucvB2LHHQLjfKSJTEqm1ywyxiozln2M=
=L4r8
-----END PGP SIGNATURE-----

--Signature=_Thu__26_May_2011_11_00_35_+1000_F0xZmw49Usc2XcAN--
