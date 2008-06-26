From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: dev_name, dev_set_name conversions
Date: Thu, 26 Jun 2008 16:03:28 +1000
Message-ID: <20080626160328.8ec34a28.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Jun_2008_16_03_28_+1000_.lwkoJ/LbAcQwaTz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40204 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751099AbYFZGDl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Jun 2008 02:03:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Kay Sievers <kay.sievers@vrfy.org>, Cornelia Huck <cornelia.huck@de.ibm.com>, linux-next@vger.kernel.org

--Signature=_Thu__26_Jun_2008_16_03_28_+1000_.lwkoJ/LbAcQwaTz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Given that simple implementations of dev_name and dev_set_name now exist
in Linus' tree, is there any reason that these conversion patches cannot
go via the respective subsystem trees?  This would reduce the number of
conflicts in the linux-next tree (and presumably in the next merge window
for Linus).

Even if they were in both your tree and the subsystem trees, I think the
conflicts would be less.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Jun_2008_16_03_28_+1000_.lwkoJ/LbAcQwaTz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhjMTAACgkQTgG2atn1QN/k1wCeK2t7B1bFjA/5/GepGmWHZ64R
aRQAnirB7khZ5SvOxk72yZkn+4Hp1TTg
=m2bH
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Jun_2008_16_03_28_+1000_.lwkoJ/LbAcQwaTz--
