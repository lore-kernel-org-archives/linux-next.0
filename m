From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi tree build failure
Date: Mon, 16 Mar 2009 21:39:45 +1100
Message-ID: <20090316213945.e33f3427.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Mar_2009_21_39_45_+1100_pclsOs0.e=g9S3gb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55269 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753032AbZCPKjv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 06:39:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, Eric Moore <eric.moore@lsi.com>, peter Bogdanovic <pbog@us.ibm.com>

--Signature=_Mon__16_Mar_2009_21_39_45_+1100_pclsOs0.e=g9S3gb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/message/built-in.o:(.data.rel+0x88): multiple definition of `ioc_li=
st'
drivers/scsi/built-in.o:(.data.rel+0x2760): first defined here

Caused by commit 635374e7eb110e80d9918b8611198edd56a32975 ("[SCSI]
mpt2sas v00.100.11.15").  ioc_list is not a good choice for a global
name.  The other definition is in drivers/message/fusion/mptbase.c.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Mar_2009_21_39_45_+1100_pclsOs0.e=g9S3gb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm+LHEACgkQjjKRsyhoI8wRPACfVfCxP+Z6uPhQG1IzsLSgfhVl
32UAnibbH5vqcEYX7nEnsxP4yHn1elZI
=6Gmu
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Mar_2009_21_39_45_+1100_pclsOs0.e=g9S3gb--
