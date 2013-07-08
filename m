From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with Linus' tree
Date: Mon, 8 Jul 2013 14:03:04 +1000
Message-ID: <20130708140304.39c17c16e878a8eb26eaf5a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__8_Jul_2013_14_03_04_+1000_ayAJra1x94DlWW41"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eduardo Valentin <eduardo.valentin@ti.com>, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__8_Jul_2013_14_03_04_+1000_ayAJra1x94DlWW41
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
arch/arm/mach-omap2/Kconfig between commit 4a1b573346ee ("ARM: 7758/1:
introduce config HAS_BANDGAP") from Linus' tree and commit 59d92875a6d9
("ARM: OMAP: build mach-omap code only if needed") from the arm-soc tree.

I fixed it up (the latter moved the "config ARCH_OMAP2PLUS" and included
the "select ARCH_HAS_BANDGAP" despite there being no ARCH_HAS_BANDGAP
config in the arm-soc tree :-() and can carry the fix as necessary (no
action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__8_Jul_2013_14_03_04_+1000_ayAJra1x94DlWW41
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJR2jn8AAoJEECxmPOUX5FEB64P/0xSUlqo+cF41juzM+TeNTTi
PoEQXR7N0xcIZI23wx9r+uWdxjGF4YgdF6mQpag7nxeH+d8qdCBXJOXizRSXwKWM
uE2SHs+seEIDdVyvu9CNf+uQGB76Ao+idryDztzqD4fpEeAUAsZTZ301267B1Fcf
6gVU1SPgUK04kFhmMkepjqm36bbBAWeWt700B52dnDvkgAtgHvPmVpMT1FEhfRwY
uUIlfHd7frhHIwqY9TFIButkb6krwxBD01BnyhU5Ff7RD6o2/A2/v8fCCmQdIjWf
U5HEgSB8jWN465awOmW/mWKyZ7hv/8onBj00LI4qtBfPODkb758d0apd2meU0yHM
PYrMqF4f8CVExHeIOkB9bId7lQmjRSOg8K39luWZwk3fY2NXsO7UPHPENH3vVF+i
CIuTUNc+djm9+gJB91ZBB1sC7I7W1yV0NUNq78vr0woq0MGzrGJQCBbELn/NjRNH
ChbDJFP23MKLsRY+ygVYAaMOZid5hmY7boIoiB75xvCvWd4x0eJVSUMDOXEWM9Sv
QKgDNHrBTBb9hrT5l/n1Jd4jqzvqd56jz1rQVK+HyjGbC0EqSKY9SFsQd0lm5R0W
jSwpQIQF96mFGTxsla2B9QEnrRGASTyBZuzNQ/VjImeSPOLadDJ4g+nDHauRLhIo
omzSjOasCxPWXJtemvGS
=OdrS
-----END PGP SIGNATURE-----

--Signature=_Mon__8_Jul_2013_14_03_04_+1000_ayAJra1x94DlWW41--
