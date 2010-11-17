From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (wireless
 tree related)
Date: Wed, 17 Nov 2010 13:48:20 +1100
Message-ID: <20101117134820.bca8d764.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__17_Nov_2010_13_48_20_+1100_5Td4/Oml8GCUpaOk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35763 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757436Ab0KQCsc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Nov 2010 21:48:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>

--Signature=_Wed__17_Nov_2010_13_48_20_+1100_5Td4/Oml8GCUpaOk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

After merging the final tree, today's linux-next build (powerpc allyesconfi=
g)
failed like this:

drivers/net/wireless/iwlwifi/iwl3945.o: In function `iwl_legacy_mac_reset_t=
sf':
(.opd+0xf00): multiple definition of `iwl_legacy_mac_reset_tsf'
drivers/net/wireless/iwlwifi/iwlagn.o:(.opd+0x90): first defined here
drivers/net/wireless/iwlwifi/iwl3945.o: In function `.iwl_legacy_mac_config=
':
(.text+0x50ae4): multiple definition of `.iwl_legacy_mac_config'
drivers/net/wireless/iwlwifi/iwlagn.o:(.text+0x2b34): first defined here
drivers/net/wireless/iwlwifi/iwl3945.o: In function `.iwl_legacy_mac_bss_in=
fo_changed':
(.text+0x4f778): multiple definition of `.iwl_legacy_mac_bss_info_changed'
drivers/net/wireless/iwlwifi/iwlagn.o:(.text+0x17c8): first defined here
drivers/net/wireless/iwlwifi/iwl3945.o: In function `.iwl_legacy_tx_cmd_pro=
tection':
(.text+0x4dfb0): multiple definition of `.iwl_legacy_tx_cmd_protection'
drivers/net/wireless/iwlwifi/iwlagn.o:(.text+0x0): first defined here
drivers/net/wireless/iwlwifi/iwl3945.o: In function `iwl_legacy_mac_bss_inf=
o_changed':
(.opd+0xee8): multiple definition of `iwl_legacy_mac_bss_info_changed'
drivers/net/wireless/iwlwifi/iwlagn.o:(.opd+0x78): first defined here
drivers/net/wireless/iwlwifi/iwl3945.o: In function `iwl_legacy_tx_cmd_prot=
ection':
(.opd+0xe70): multiple definition of `iwl_legacy_tx_cmd_protection'
drivers/net/wireless/iwlwifi/iwlagn.o:(.opd+0x0): first defined here
drivers/net/wireless/iwlwifi/iwl3945.o: In function `.iwl_isr_legacy':
(.text+0x4e0e0): multiple definition of `.iwl_isr_legacy'
drivers/net/wireless/iwlwifi/iwlagn.o:(.text+0x130): first defined here
drivers/net/wireless/iwlwifi/iwl3945.o: In function `.iwl_legacy_mac_reset_=
tsf':
(.text+0x50620): multiple definition of `.iwl_legacy_mac_reset_tsf'
drivers/net/wireless/iwlwifi/iwlagn.o:(.text+0x2670): first defined here
drivers/net/wireless/iwlwifi/iwl3945.o: In function `iwl_isr_legacy':
(.opd+0xe88): multiple definition of `iwl_isr_legacy'
drivers/net/wireless/iwlwifi/iwlagn.o:(.opd+0x18): first defined here
drivers/net/wireless/iwlwifi/iwl3945.o: In function `iwl_legacy_mac_config':
(.opd+0xf18): multiple definition of `iwl_legacy_mac_config'
drivers/net/wireless/iwlwifi/iwlagn.o:(.opd+0xa8): first defined here

I should have known when I reported the warning ...

Caused by commit dd0dd411f7178a20ea93a3cfa39123f078a07e25 ("iwlwifi: fix
modular legacy build errors").

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__17_Nov_2010_13_48_20_+1100_5Td4/Oml8GCUpaOk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJM40J0AAoJEDMEi1NhKgbs3NcIAIZrYagDfn0Nxgt5Qyndcn/M
KPiWm8T1bQRp++D8r9wISZZoPI/ZFR6wWYIqHgY1g7NaRjf9SteOiJmQeYCgarRm
mqAv7DNcJIXFhbb0CMXSFbr+egtUgchtK294LW+tuMb+n1NCV7WezTnuDV2tK6Rg
ZGZ/Mm4QElwrd/oDzQegD/TriF+mJQsnDC3wRukWyMf18Kv8/uhdTZpp22soujeQ
giqonpeWEn+MkC3naWF1XQJF+XOA10nF1Q1F3NewXjCAisP6RVHZnwapaS50yJpE
9Y2EBPGjGPqXrsKcjdUVlcxssJUaPHsz3M8L2+DxPelHPS4bW5kyNWWpWqHsoic=
=UJ58
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Nov_2010_13_48_20_+1100_5Td4/Oml8GCUpaOk--
