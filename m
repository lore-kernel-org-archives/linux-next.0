From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ide tree
Date: Wed, 16 Jul 2008 15:05:28 +1000
Message-ID: <20080716150528.a350b196.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_15_05_28_+1000_R/DE41o.RRJkJ2yc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53935 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751577AbYGPFFl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 01:05:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Jonathan Corbet <corbet@lwn.net>

--Signature=_Wed__16_Jul_2008_15_05_28_+1000_R/DE41o.RRJkJ2yc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Today's linux-next merge of the ide tree got a conflict in lots of files
because all of the changes that have been merged into Linus' tree are
common, but followed by further changes in the ide tree to the same
regions of some files.

I just took the ide tree versions of the files except for
drivers/ide/ide-tape.c which had some further changes from commit
04f4ac9d1bb8a9103609ce8e927f8e98826ce339 ("ide-tape: cdev lock_kernel()
pushdown") from Linus' tree and commit
463ddc2102da76e76bfd1efc721cc5ff9b81cc54 ("device create: ide: convert
device_create to device_create_drvdata") from the driver-core tree.  You
might consider adding those changes to your tree (or in the former case
just rebasing on top of Linus' tree).  The rebase will, of course,
eliminate the conflicts in all the other files as well.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_15_05_28_+1000_R/DE41o.RRJkJ2yc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9gZgACgkQjjKRsyhoI8ypSQCguiPjALgZmKKtzrPpUTk9F5EL
FdcAn3Y+riLi+uahl7WNNDvqdkwEglU6
=O0OK
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_15_05_28_+1000_R/DE41o.RRJkJ2yc--
