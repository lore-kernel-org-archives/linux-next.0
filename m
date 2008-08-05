From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless-current tree build failure
Date: Tue, 5 Aug 2008 16:21:52 +1000
Message-ID: <20080805162152.2b55ae5c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__5_Aug_2008_16_21_52_+1000_a57gTnvlpP_RUlqf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41559 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750723AbYHEGWX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 02:22:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <lrodriguez@atheros.com>

--Signature=_Tue__5_Aug_2008_16_21_52_+1000_a57gTnvlpP_RUlqf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/net/wireless/ath9k/hw.c: In function 'ath9k_hw_9280_spur_mitigate':
drivers/net/wireless/ath9k/hw.c:4660: internal compiler error: in expand_ex=
pr_real_1, at expr.c:9199

Clearly not our fault! :-) I have informed our toolchain person.  This
was using the Debian gcc-4.3.  It also fails using the Debian 4.2
compiler but not the 4.1 one.

For now, I will apply the following patch to just stop it building on
PowerPC.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__5_Aug_2008_16_21_52_+1000_a57gTnvlpP_RUlqf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiX8YEACgkQjjKRsyhoI8zKogCfQZ+T2UdUsrR/IDt9RYaEGPoA
99wAn0k7H6CBAscrsD/gqtHyBoY6eJWe
=j6yf
-----END PGP SIGNATURE-----

--Signature=_Tue__5_Aug_2008_16_21_52_+1000_a57gTnvlpP_RUlqf--
