From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s390 tree
Date: Tue, 24 Jun 2008 13:45:46 +1000
Message-ID: <20080624134546.c8ac496d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Jun_2008_13_45_46_+1000_yOn9SgIj/6Jpzoji"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44718 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752867AbYFXDp5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jun 2008 23:45:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <greg@kroah.com>

--Signature=_Tue__24_Jun_2008_13_45_46_+1000_yOn9SgIj/6Jpzoji
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin, Greg,

Today's linux-next merge of the s390 tree got a conflict in
drivers/s390/cio/qdio.c between commit
4836b98e1d4c0b5e86ce4e071321367cf28885c4 ("s390: bus_id -> dev_name
conversions") from the driver-core tree and commit
bc3817177fc931f0ade32808e4cb61be2f0999fb ("[S390] qdio: Repair timeout
handling for qdio_shutdown") from the s390 tree.

It is a simple near overlap of changes, and I fixed it up.  I can carry
the fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_Jun_2008_13_45_46_+1000_yOn9SgIj/6Jpzoji
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhgbeoACgkQTgG2atn1QN8SywCgjN6Zipjrd14kWYX4mEhR4EE5
79cAn2ZCWfppzj9KWQ9Etsem0jDYAn9I
=RwN+
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Jun_2008_13_45_46_+1000_yOn9SgIj/6Jpzoji--
