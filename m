From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Tue, 13 Oct 2009 15:33:08 +1100
Message-ID: <20091013153308.af56910a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__13_Oct_2009_15_33_08_+1100_u011ej/GoWJIxg=t"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44123 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750988AbZJMEdw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Oct 2009 00:33:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Chan <mchan@broadcom.com>, Shmulik Ravid - Rabinovitz <shmulikr@broadcom.com>

--Signature=_Tue__13_Oct_2009_15_33_08_+1100_u011ej/GoWJIxg=t
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/net/cnic.c: In function 'cnic_init_storm_conn_bufs':
drivers/net/cnic.c:1757: error: implicit declaration of functi
on 'csum_ipv6_magic'

Caused by commit 71034ba845c9ff219373066f904286c0b7506922 ("cnic: Add
main functions to support bnx2x devices") which I have reverted for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__13_Oct_2009_15_33_08_+1100_u011ej/GoWJIxg=t
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrUAwQACgkQjjKRsyhoI8wAZQCgo+JJQAvbApKo4HW+pi0ytiI7
kwAAnR4qZ7tFCyw0jTRBkAiZIY8gt26v
=NEBl
-----END PGP SIGNATURE-----

--Signature=_Tue__13_Oct_2009_15_33_08_+1100_u011ej/GoWJIxg=t--
