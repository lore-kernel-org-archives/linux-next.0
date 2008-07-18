From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree
Date: Fri, 18 Jul 2008 11:02:59 +1000
Message-ID: <20080718110259.271e5c2d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_11_02_59_+1000_P.1MJt1K9lS7MO2."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38772 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756322AbYGRBDJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 21:03:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Jan Glauber <jang@linux.vnet.ibm.com>

--Signature=_Fri__18_Jul_2008_11_02_59_+1000_P.1MJt1K9lS7MO2.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/s390/cio/qdio.c between commit
779e6e1c724d30e0fd1baca78b852e41e3a23c1d ("[S390] qdio: new qdio
driver.") from Linus' tree and commit
00bcc6c6a1b34a65803e997a142470531b0b4213 ("s390: bus_id -> dev_name
conversions") from the driver-core tree.

The former commit split the file into a set of other files (and removed
the original). I am guessing that there may be now some more dev_name
updates to be done.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_11_02_59_+1000_P.1MJt1K9lS7MO2.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh/68MACgkQjjKRsyhoI8yD1QCgvSkTO6oXaCwqnSybvF7o2pwj
xmYAoLdd/tTje/2VnL9nrkUmQz3MNSV8
=jyhz
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_11_02_59_+1000_P.1MJt1K9lS7MO2.--
