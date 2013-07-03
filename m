From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with Linus' tree
Date: Wed, 3 Jul 2013 15:29:06 +1000
Message-ID: <20130703152906.872979a7f0af80287e827920@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__3_Jul_2013_15_29_06_+1000_BTO0ANibGsJ.sVOG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:56138 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751348Ab3GCF3K (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jul 2013 01:29:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?IlV3ZSBLbGVpbmUtS8O2bmlnIg==?= <u.kleine-koenig@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>

--Signature=_Wed__3_Jul_2013_15_29_06_+1000_BTO0ANibGsJ.sVOG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
kernel/irq/generic-chip.c between commit ccc414f83914 ("genirq: Add the
generic chip to the genirq docbook") from Linus' tree and commit
37074c5a1b99 ("irq/generic-chip: fix a few kernel-doc entries") from the
trivial tree.

I fixed it up (I just arbitrarily used Linus' tree version) and can
carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__3_Jul_2013_15_29_06_+1000_BTO0ANibGsJ.sVOG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJR07aiAAoJEECxmPOUX5FE+/sQAKHgvjJNFY/Oc5ZrVYiWu/Bf
rji+dFG4Pxc1PVtn653WIOCyXHczEeT2Yij0SDqXXFrroVQ651iWBKEDFXLzDBsC
oz54mLt6G9x6Rjf7cBGAPrwn3RU4KhlVMLTjogaxArQ1cpqprZyPdA8p53j4/2yZ
w19WmUxbcoc31eIk/XxbWzxKWPdaSe4DBD/1+cFO8jodIIXO2LEYFXIv1qJP6O6a
WDhH0E/bLB+i3swyL0T2EQxR/Ui7JhCzK1zNzHpXKRV9TJUZmJtMqW9iOFk0+lRU
gJnhNorWgcoJnq+OBJGuoK+aBdEct38zxYmqwU12P/ivSZh1J/BAjIq+rprgCAmT
CMnqKp1xnxxvNIT2Wtfz/MVKgn5bvQ4yTPQ/QooTyDn2vTRVg66kp4vTg/sXz0ti
lG1rNzwpA7oaqoo3gp0aJY6D00CmrG8Skj8t2HwehnMIdOUhFueLyjvKJrpXiLrM
RMYuMm2D/ddZqH5xp/qeiPON9f9F0djqUn52P1Es7pPip7H3PF/tvkdcS9E1OG+i
PeHRbBJhb/VQ8N2JpA6TRgnu1omRZ8CiNmkLn1IqK9WwuoitHJoRjD4I60SXl+lI
s1wAgux/34KcIIbrsn5aKGy2kInX5M31Hp3ydTm8ZENVRoj6iQjqt59VmXx1TQdR
dBhd2LJRiREAWlgpYUJV
=C4KC
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Jul_2013_15_29_06_+1000_BTO0ANibGsJ.sVOG--
