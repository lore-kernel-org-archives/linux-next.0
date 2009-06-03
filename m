From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: gfs2 tree build warning
Date: Wed, 3 Jun 2009 15:40:31 +1000
Message-ID: <20090603154031.3652281b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__3_Jun_2009_15_40_31_+1000_mU+DuB=o09+oZmEU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60008 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751784AbZFCFkf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2009 01:40:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Whitehouse <swhiteho@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Abhijith Das <adas@redhat.com>

--Signature=_Wed__3_Jun_2009_15_40_31_+1000_mU+DuB=o09+oZmEU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steven,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

fs/gfs2/file.c: In function 'gfs2_flock':
fs/gfs2/file.c:697: warning: unused variable 'ip'

Introduced by commit a12af1ebe675e85831fde3c4d0908fc3b0908b7a ("GFS2:
smbd proccess hangs with flock() call") which removed the last usage of
'ip'.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__3_Jun_2009_15_40_31_+1000_mU+DuB=o09+oZmEU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkomDM8ACgkQjjKRsyhoI8wOSACgtrMdUcBm6juQB/YGvc4ZnfvK
9R4AoLoXeKvcovLB8DTV4D+gDtyRJ1rn
=iu+9
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Jun_2009_15_40_31_+1000_mU+DuB=o09+oZmEU--
