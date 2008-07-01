From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-removal tree
Date: Tue, 1 Jul 2008 19:45:44 +1000
Message-ID: <20080701194544.f2109cdd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_19_45_44_+1000_IF3iNpqwp31s25BE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54634 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751575AbYGAJpv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 05:45:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, Gerald Schaefer <gerald.schaefer@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>

--Signature=_Tue__1_Jul_2008_19_45_44_+1000_IF3iNpqwp31s25BE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

Today's linux-next merge of the bkl-removal tree got a conflict in
drivers/s390/char/monreader.c between commit
4b45ec0706ac12bf0c790747e55b4f3fec776c7a ("[S390] Cleanup monreader
printk messages.") from the s390 tree and commit
167ae8a4822ed405037e72d660acf3294ab32807 ("monreader: BKL pushdown") from
the bkl-removal tree.

Just a matter of overlapping additions. I can carry it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_19_45_44_+1000_IF3iNpqwp31s25BE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhp/MgACgkQjjKRsyhoI8yGPQCdHDviZEEHOgeJG4g1xp+9mSoH
zXMAnjh1sQuW/NdYZmcLE9R0Ip24qaim
=m0nB
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_19_45_44_+1000_IF3iNpqwp31s25BE--
