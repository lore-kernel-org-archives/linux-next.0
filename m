From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: xfs tree build failure
Date: Fri, 3 Jul 2009 10:05:51 +1000
Message-ID: <20090703100551.e3f21aa0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__3_Jul_2009_10_05_51_+1000_flDlnoq/yzeTOhDc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39035 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751892AbZGCAF4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Jul 2009 20:05:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Sandeen <sandeen@sandeen.net>, Christoph Hellwig <hch@lst.de>, Felix Blyakher <felixb@sgi.com>

--Signature=_Fri__3_Jul_2009_10_05_51_+1000_flDlnoq/yzeTOhDc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next build (x86_64 allmodconfig) failed like this:

fs/xfs/xfs_log_recover.c: In function 'xlog_recover_check_summary':
fs/xfs/xfs_log_recover.c:4046: error: implicit declaration of function 'xfs=
_read_agf'

Caused by commit 370f048214b4e9aa2102fa3c454ae1374da287c5 ("xfs: add more
statics & drop some unused functions").

I have used the xfs tree from next-20090702 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__3_Jul_2009_10_05_51_+1000_flDlnoq/yzeTOhDc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpNS18ACgkQjjKRsyhoI8wY+QCfVZysJFo5zF6EbO8ZfzsZB65G
qfwAoLoz5/zTWhXVrPFI+g3EklbJJSlc
=BWTK
-----END PGP SIGNATURE-----

--Signature=_Fri__3_Jul_2009_10_05_51_+1000_flDlnoq/yzeTOhDc--
