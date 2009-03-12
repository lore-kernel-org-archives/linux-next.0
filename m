From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: import of ide quilt series failed
Date: Fri, 13 Mar 2009 09:30:48 +1100
Message-ID: <20090313093048.c61dd9f4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Mar_2009_09_30_48_+1100_3GamEl9ZKV3ZqQ13"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45254 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754096AbZCLWay (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 18:30:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__13_Mar_2009_09_30_48_+1100_3GamEl9ZKV3ZqQ13
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Today's import of the ide tree failed like this:

ide-floppy-do-not-map-dataless-cmds-to-an-sg.patch
fatal: corrupt patch at line 52

Even patch(1) did not like that patch:

$ patch -p1 -E <.git/rebase-apply/patch=20
patching file drivers/ide/ide-atapi.c
patching file drivers/ide/ide-floppy.c
patch unexpectedly ends in middle of line

I will use yesterday's ide tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Mar_2009_09_30_48_+1100_3GamEl9ZKV3ZqQ13
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm5jRgACgkQjjKRsyhoI8xGGACdFmgR62d5XIZXHHm1nrZiUdXy
ydwAnRgBwdSr3d5Pb5oqPPpHnXQRWvUo
=P6gs
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Mar_2009_09_30_48_+1100_3GamEl9ZKV3ZqQ13--
