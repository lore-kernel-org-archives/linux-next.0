From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ubifs tree
Date: Thu, 24 Jul 2008 15:22:05 +1000
Message-ID: <20080724152205.1bb53acb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__24_Jul_2008_15_22_05_+1000_lIDIF6FvmfcT+qAX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42512 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752558AbYGXFWR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Jul 2008 01:22:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__24_Jul_2008_15_22_05_+1000_lIDIF6FvmfcT+qAX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Artem,

Today's linux-next merge of the ubifs tree got conflicts in
Documentation/filesystems/ubifs.txt, fs/ubifs/budget.c,
fs/ubifs/commit.c, fs/ubifs/debug.c, fs/ubifs/dir.c, fs/ubifs/file.c,
fs/ubifs/io.c, fs/ubifs/journal.c, fs/ubifs/log.c, fs/ubifs/misc.h,
fs/ubifs/orphan.c, fs/ubifs/super.c and fs/ubifs/ubifs.h against Linus'
tree.

This has happened because of a partial merge of this tree into Linus'
tree.  I just took the ubifs tree's version of all those files.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__24_Jul_2008_15_22_05_+1000_lIDIF6FvmfcT+qAX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiIEX0ACgkQjjKRsyhoI8w5BQCglyOauw2TuwM8sLknQpuyJi8W
w0UAni9O8u5WcjNXV+dY723bq2AOrbki
=cAzR
-----END PGP SIGNATURE-----

--Signature=_Thu__24_Jul_2008_15_22_05_+1000_lIDIF6FvmfcT+qAX--
