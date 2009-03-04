From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the  tree
Date: Wed, 4 Mar 2009 13:03:43 +1100
Message-ID: <20090304130343.e677eb88.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__4_Mar_2009_13_03_43_+1100_+orunKHjl8RwsheB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47700 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752695AbZCDCDw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Mar 2009 21:03:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Xose Vazquez Perez <xose.vazquez@gmail.com>, "John W. Linville" <linville@tuxdriver.com>, Ivo van Doorn <ivdoorn@gmail.com>

--Signature=_Wed__4_Mar_2009_13_03_43_+1100_+orunKHjl8RwsheB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/rt2x00/rt73usb.c between commit
98a2103b0e9725ce5b3dcecd8dfcae977e6938ed ("rt2x00 : more devices to
rt73usb.c") from the wireless-current tree and various commits from the
net tree.

I used the version of the file from the wireless tree merge-test branch
(thanks John).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__4_Mar_2009_13_03_43_+1100_+orunKHjl8RwsheB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmt4X8ACgkQjjKRsyhoI8ybqQCgt9hl6uzmfmy4Hq3LNtHDzi/r
0zAAn1FMvzfPpfpHrqY8jT2rw2srprzA
=TFeO
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Mar_2009_13_03_43_+1100_+orunKHjl8RwsheB--
