From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the davinci tree with the arm tree
Date: Fri, 29 Jan 2010 11:13:42 +1100
Message-ID: <20100129111342.203358d9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__29_Jan_2010_11_13_42_+1100_.=Lo5Tqwm.Kh3Q6o"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755546Ab0A2AN4@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@deeprootsystems.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__29_Jan_2010_11_13_42_+1100_.=Lo5Tqwm.Kh3Q6o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kevin,

Today's linux-next merge of the davinci tree got a conflict in
arch/arm/mach-bcmring/core.c between commit
dd84ce18c8f522d26aef6e9e9c05c32485b667a7 ("ARM: Consolidate
clks_register() and similar") from the arm tree and commit
25c692215f5dfc4992b11c4fb57538d1139d6636 ("Consolidate clks_register()
and similar") from the davinci tree.

The davinci tree version has a typo (ARRAY_SIEZ v. ARRAY_SIZE) so I used
the arm tree version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__29_Jan_2010_11_13_42_+1100_.=Lo5Tqwm.Kh3Q6o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktiKDYACgkQjjKRsyhoI8wVUgCgwIk7mnhk9fqJLSo+B0YSGebG
9S0An1gIiclShYebdgyxK7/pD3jZPWlz
=rQqn
-----END PGP SIGNATURE-----

--Signature=_Fri__29_Jan_2010_11_13_42_+1100_.=Lo5Tqwm.Kh3Q6o--
