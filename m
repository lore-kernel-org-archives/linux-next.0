From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Mon, 1 Dec 2008 13:10:29 +1100
Message-ID: <20081201131029.58f6d00c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Dec_2008_13_10_29_+1100_LNcjgZUIl1l60EZ_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46443 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752883AbYLACKu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 30 Nov 2008 21:10:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__1_Dec_2008_13_10_29_+1100_LNcjgZUIl1l60EZ_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in
drivers/acpi/blacklist.c between commit
a6e0887f21bbab337ee32d9c0a84d7c0b6e9141b ("ACPI: delete OSI(Linux) DMI
dmesg spam") from Linus' tree and commit
865596071bb89ec67a44b0ef2da172e0e733ce16 ("ACPI: delete OSI(Linux) DMI
dmesg spam") from the acpi tree.

The former had a slightly later commit time, so I used that.  Please fix
up the conflict in the acpi tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Dec_2008_13_10_29_+1100_LNcjgZUIl1l60EZ_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkzR5UACgkQjjKRsyhoI8y18QCbBlsFrk53ew4QlGxJqUvBYy+6
dNMAoLEqumAzmnxHXo73ZHon4R8Qjnuh
=n5rf
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Dec_2008_13_10_29_+1100_LNcjgZUIl1l60EZ_--
