From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: jfs tree unfetchable
Date: Wed, 14 May 2008 10:58:26 +1000
Message-ID: <20080514105826.11e87263.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__14_May_2008_10_58_26_+1000_4AUXVehs/CVy9g90"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59310 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756189AbYENA6n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 May 2008 20:58:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__14_May_2008_10_58_26_+1000_4AUXVehs/CVy9g90
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Trying to fetch the jfs tree today gets this error:

fatal: git-upload-pack: cannot find object b2e03ca7485cac033a0667d9e45e28d3=
2fdee9a5:
fatal: The remote end hung up unexpectedly

So I will be using what I fetched yesterday ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__14_May_2008_10_58_26_+1000_4AUXVehs/CVy9g90
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIKjk5TgG2atn1QN8RAljpAJ4gzTXI+dR/LgOrPpuNzZb1THhWFgCgkusy
0EhxNwdq8dCkiows76XNvPM=
=aXWx
-----END PGP SIGNATURE-----

--Signature=_Wed__14_May_2008_10_58_26_+1000_4AUXVehs/CVy9g90--
