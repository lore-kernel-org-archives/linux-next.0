From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (wireless
 tree related)
Date: Wed, 5 Jan 2011 15:10:13 +1100
Message-ID: <20110105151013.3b833539.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Jan_2011_15_10_13_+1100_A0X5fLo2wlo/.=Jf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35800 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751089Ab1AEEKU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Jan 2011 23:10:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bruno Randolf <br1@einfach.org>

--Signature=_Wed__5_Jan_2011_15_10_13_+1100_A0X5fLo2wlo/.=Jf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/net/wireless/ath/ath9k/built-in.o:(.bss+0x13dc): multiple definitio=
n of `modparam_nohwcrypt'
drivers/net/wireless/ath/ath5k/built-in.o:(.bss+0x844c): first defined here

Caused by commit cd2c5486526b744fb505e18c9d981b35feaf283a ("ath5k: Move
mac80211 functions into new file").  This is what you get for using
unqualified global names ...

I reverted that commit for today.  The references in ath9k should
probably be qualified as well.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Jan_2011_15_10_13_+1100_A0X5fLo2wlo/.=Jf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNI+8lAAoJEDMEi1NhKgbsc10H/3DoMNn8YjgGwfphiGsST+wK
bd5ZPot7N25antGK/JgfvelZzUi1qGe2nyZ/W+ulihfWPBYk0m1O+txePiqjuVur
0f7718ywwQd6T9TfRIA9SqD2LBpq10R4iQ/X+6/e+gyKcUwNICzVMo/EmY+QYsYy
blo2toO2tOxCRpiYAliPPAmqBCd59B5/IX2AkGroHMWFzYhATV1QBxIWaW5LmrwH
8s6bcDUsAiiCFiOXLFkMGADpsERLEKU0/URGHH5rdHMEXSuZ66qWCRGdL9pWC602
rLV4etzqEKy+ggkjMSBSzPkWNfabv4wm5kwh6FX++/y7OprLXNs6FT34Dxg6yug=
=vFD8
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Jan_2011_15_10_13_+1100_A0X5fLo2wlo/.=Jf--
