From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: failed to fetch the device-mapper tree
Date: Thu, 26 May 2011 10:04:07 +1000
Message-ID: <20110526100407.532d4105.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_May_2011_10_04_07_+1000_n565DlhQr.a.LzQ5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44766 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753741Ab1EZAER (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 May 2011 20:04:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__26_May_2011_10_04_07_+1000_n565DlhQr.a.LzQ5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alasdair,

Fetching the device-mapper tree today filaed like this:

rsync: change_dir "/pub/linux/kernel/people/agk/patches/2.6/editing/" faile=
d: Permission denied (13)

I have used the version of the tree I fetched yesterday.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_May_2011_10_04_07_+1000_n565DlhQr.a.LzQ5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN3Zj3AAoJEDMEi1NhKgbsAAUH/ilMuBXDdn712dvH2K8RF/VR
JOGlp/pTabeTQixpmdZjuwhHbPP0y7vF/H/fOXNHjEK9jPXUTSbVr94eahNgfeBK
F3Ud8OKVjghZC+IYimiLF0/8FKABm026O40gMuplKSLYYHbxSR/rXDpyoOG4ngkL
mY+aY3sxvYHRb6PIHHS496AVq8ygBz0lzG8t7KhP2LIUrp9cE4qayHi8UnTs9ZCd
XvQ7Q+UkJvSlGirfHuVcKBlj+wyurb8zwoGjfdydi79c4MURJod8WqEaic+Ch23e
yGo3GNvdx7xbEOvaS/H0zYiX4tSupht8uly3t95GMIEoBZgVJLQARKIoNwj5BZM=
=g7zY
-----END PGP SIGNATURE-----

--Signature=_Thu__26_May_2011_10_04_07_+1000_n565DlhQr.a.LzQ5--
