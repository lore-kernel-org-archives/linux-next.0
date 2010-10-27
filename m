From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning from Linus' tree
Date: Wed, 27 Oct 2010 11:00:38 +1100
Message-ID: <20101027110038.9f2ca56a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__27_Oct_2010_11_00_38_+1100_svuGtmATILk0pScz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58122 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753799Ab0J0AAt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Oct 2010 20:00:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

--Signature=_Wed__27_Oct_2010_11_00_38_+1100_svuGtmATILk0pScz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ,

While building Linus' tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/char/pcmcia/synclink_cs.c:2194: warning: 'mgslpc_get_icount' define=
d but not used

Introduced by commit 0587102cf9f427c185bfdeb2cef41e13ee0264b1 ("tty:
icount changeover for other main devices").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__27_Oct_2010_11_00_38_+1100_svuGtmATILk0pScz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMx2umAAoJEDMEi1NhKgbsQ3UIAI59bXZhn4AeSyhr4LCH0647
kXVH8uK7UfHK/fAqGTP3sSAic4Xnl4DDAlcaLKVP6MhqzIhDh93Dld89He8DNFlz
/sNB+XoNVVnNKDgxBNaR9zwnfWgWxybb83nrnN19EW2+auRiX4ydy4sHVBrBlLD1
vvAtibbYzXqhfaBR7s+ss/VSfY6fKOI8lFKKrj27wSgDY0xI7860UyAysCzji2Uv
qmDTLtrK3dZX2o4boPbZlILW6VDcERcio9vhW3dMnyYNAQeNNSHH/99vrDUtDr8L
4HPDMJtbAC3jcsq6J1W1QbyHdh/MihWiCnsY2eoaiEptNWdubGEw0GaZYZtYkdo=
=3mq4
-----END PGP SIGNATURE-----

--Signature=_Wed__27_Oct_2010_11_00_38_+1100_svuGtmATILk0pScz--
