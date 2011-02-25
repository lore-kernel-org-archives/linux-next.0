From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (wireless
 tree related)
Date: Fri, 25 Feb 2011 17:16:25 +1100
Message-ID: <20110225171625.60e967f8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__25_Feb_2011_17_16_25_+1100_rDqbx/XVyYUejnRk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wey-Yi Guy <wey-yi.w.guy@intel.com>, Meenakshi Venkataraman <meenakshi.venkataraman@intel.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__25_Feb_2011_17_16_25_+1100_rDqbx/XVyYUejnRk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/net/wireless/iwlegacy/built-in.o:(.rodata+0x29f0): multiple definit=
ion of `iwl_rates'
drivers/net/wireless/iwlwifi/built-in.o:(.rodata+0xa68): first defined here
powerpc64-linux-ld: Warning: size of symbol `iwl_rates' changed from 143 in=
 drivers/net/wireless/iwlwifi/built-in.o to 130 in drivers/net/wireless/iwl=
egacy/built-in.o
drivers/net/wireless/iwlegacy/built-in.o:(.data+0x0): multiple definition o=
f `bt_coex_active'
drivers/net/wireless/iwlwifi/built-in.o:(.data+0x668): first defined here
drivers/net/wireless/iwlegacy/built-in.o:(.rodata+0x750): multiple definiti=
on of `iwl_eeprom_band_1'
drivers/net/wireless/iwlwifi/built-in.o:(.rodata+0x27d0): first defined here
drivers/net/wireless/iwlegacy/built-in.o:(.rodata+0x3f0): multiple definiti=
on of `iwl_bcast_addr'
drivers/net/wireless/iwlwifi/built-in.o:(.rodata+0x24f8): first defined here
drivers/net/wireless/iwlegacy/built-in.o:(.bss+0x3d48): multiple definition=
 of `iwl_debug_level'
drivers/net/wireless/iwlwifi/built-in.o:(.bss+0x21950): first defined here

Presumably caused by commit be663ab67077fac8e23eb8e231a8c1c94cb32e54
("iwlwifi: split the drivers for agn and legacy devices 3945/4965").

I have just left this one as it will only break strange configs (like
allyesconfig) but it needs to be fixed soon.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

P.S. the SOB lines in that commit are a bit confusing, usually the author
is the first SOB line.

--Signature=_Fri__25_Feb_2011_17_16_25_+1100_rDqbx/XVyYUejnRk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNZ0k5AAoJEDMEi1NhKgbsyqsH/09wX5n0lVlTRYPzzCoHOxcN
Jp8le7KuNprCazlkVcy5KXROjDJ/mBjXm+nmBF4uqW2Ech3NzBsZVYz1D0zcdEoH
f8NaD5b2Lp3yuS1Bo66IH8PCU2/GqN+RyKaJkpU7ba4wAnZw2jiN0li7pKnxHuVF
8k6xKpzracUoMvw+HeKthzpUGYgyqNOhdNvwFrOJBmx50HEsBo8eYpo07Cz9S26R
AiV5TpzpkMgGMB3HUd2ecyHnr4WLZTMWU0CtiiFof7WesHekiY+kCDblvAIr+0+z
oYHjmpET2aQpnnMYnIrUmyEGkb/UxXYTmkRCz2PV/leye/gvbylp7kPR4n6yUbE=
=bTwn
-----END PGP SIGNATURE-----

--Signature=_Fri__25_Feb_2011_17_16_25_+1100_rDqbx/XVyYUejnRk--
