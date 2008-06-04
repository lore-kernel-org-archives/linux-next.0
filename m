From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: semaphore-removal/wireless merge conflict
Date: Wed, 4 Jun 2008 17:53:26 +1000
Message-ID: <20080604175326.8a60c0e6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__4_Jun_2008_17_53_26_+1000_IEJqcdkP=cktv8gd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50215 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751549AbYFDHxf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Jun 2008 03:53:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: linux-next@vger.kernel.org, Daniel Walker <dwalker@mvista.com>, "John W. Linville" <linville@tuxdriver.com>

--Signature=_Wed__4_Jun_2008_17_53_26_+1000_IEJqcdkP=cktv8gd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Sorry to those who get this twice, I am just resending with the correct
quoting of the CC addresses]

Hi Willy,

Today's linux-next merge of the semaphore-removal tree got conflicts in
drivers/net/ps3_gelic_wireless.c between commits in the wireless tree and
commit ffb433ddbbeb625e665e7ecb713e91684c74ac9b ("Convert ps3 gelic
drivers from semaphores to mutexes") from the semaphore-removal tree.

In the wireless tree, commit 706ddd600ca637720f87cef630179934add32b13
("ps3: gelic: scan_lock semaphore to mutex") converts the scan_lock while
commit bb2d67a34fe80c14d0a379695ab81362b3da1d53 ("ps3: gelic:
assoc_stat_lock semaphore to mutex") converts the assoc_stat_lock.  So I
would say that the semaphore-removal tree commit above is not longer
required.

The conflicts were purely contextual (conflicting with some other changes
to the gelic driver) and I kept the added code from the wireless driver
in each case.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__4_Jun_2008_17_53_26_+1000_IEJqcdkP=cktv8gd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIRkn7TgG2atn1QN8RAoQBAKCVscPiFbv2o1EREvvXm4DycN9ekgCgmTVy
CCOdd0rnCn8BBeV17Z27Rzo=
=6L0U
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Jun_2008_17_53_26_+1000_IEJqcdkP=cktv8gd--
