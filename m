From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ide tree build failure
Date: Mon, 15 Jun 2009 11:34:30 +1000
Message-ID: <20090615113430.21122e44.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__15_Jun_2009_11_34_30_+1000_d0I1JT_cMBc0ciLP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52068 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750832AbZFOBee (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Jun 2009 21:34:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__15_Jun_2009_11_34_30_+1000_d0I1JT_cMBc0ciLP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/ide/ide-tape.c: In function 'idetape_chrdev_open':
drivers/ide/ide-tape.c:1515: error: implicit declaration of function 'ideta=
pe_read_position'

Caused by commit 55ce3a129ea2e8faba4a11bb5dbc305590d1c20c ("ide-tape: fix
READ POSITION cmd handling") interacting with the later merge
8dcce4081305d3d1629190edd112e6473c315cbc ("Merge branch
'bp-remove-pc-buf' into for-next").

I have used the ide tree from next-20090612 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__15_Jun_2009_11_34_30_+1000_d0I1JT_cMBc0ciLP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko1pSYACgkQjjKRsyhoI8yD9wCfSZsN8CDe8weESLLFnQFJ/pkH
YYUAni+krUpzr3WQfgYAY8c1NOe5KYqa
=mQjJ
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Jun_2009_11_34_30_+1000_d0I1JT_cMBc0ciLP--
