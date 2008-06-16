From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net/wireless tree
Date: Mon, 16 Jun 2008 15:12:55 +1000
Message-ID: <20080616151255.fff40da4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Jun_2008_15_12_55_+1000_ISl5jbU5/q.mIZ4Z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52362 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751035AbYFPFNG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Jun 2008 01:13:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>, Ivo van Doorn <ivdoorn@gmail.com>

--Signature=_Mon__16_Jun_2008_15_12_55_+1000_ISl5jbU5/q.mIZ4Z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next merge of the net tree got a trivial conflict in
drivers/net/wireless/rt2x00/rt2x00usb.c between commit
edfa78b2ba651782d70be6d1fef214e21a26d8cb ("rt2x00: Don't kill
guardian_urb when it wasn't created") from the
net-current/wireless-current tree and commit
b8be63ffa5dc44324e7f507997870fa3e4b17619 ("rt2x00: Merge RX and TX entry
private data") from the net/wireless tree.

I fixed it up as per your test merge, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Jun_2008_15_12_55_+1000_ISl5jbU5/q.mIZ4Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhV9lcACgkQTgG2atn1QN978QCffiRc4mrfnANlbr8eNaMKWrAp
TmsAn3K33XYYghcy6sF8KeniMVhxGy72
=7U1B
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Jun_2008_15_12_55_+1000_ISl5jbU5/q.mIZ4Z--
