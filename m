From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net-current/net tree build failure
Date: Fri, 13 Mar 2009 13:16:55 +1100
Message-ID: <20090313131655.33117fb9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Mar_2009_13_16_55_+1100_RZKkmzxQt=Ud2+qS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50390 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751150AbZCMCRI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 22:17:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Ben Hutchings <bhutchings@solarflare.com>, Ilya Yanok <yanok@emcraft.com>

--Signature=_Fri__13_Mar_2009_13_16_55_+1100_RZKkmzxQt=Ud2+qS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/net/dnet.c: In function 'dnet_poll':
drivers/net/dnet.c:411: error: implicit declaration of function 'netif_rx_c=
omplete'
drivers/net/dnet.c: In function 'dnet_interrupt':
drivers/net/dnet.c:510: error: implicit declaration of function 'netif_rx_s=
chedule_prep'
drivers/net/dnet.c:519: error: implicit declaration of function '__netif_rx=
_schedule'

Caused by commit 4796417417a62e2ae83d92cb92e1ecf9ec67b5f5 ("dnet: Dave
DNET ethernet controller driver (updated)") from the net-current tree
interacting with commit 288379f050284087578b77e04f040b57db3db3f8 ("net:
Remove redundant NAPI functions") from the net tree.

So for today, I have reverted the net-current commit and commit
2c5849ea38fdad477d72dcf1c8c4842db4b33aae ("dnet: Fix warnings on 64-bit")
that depended on it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Mar_2009_13_16_55_+1100_RZKkmzxQt=Ud2+qS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm5whcACgkQjjKRsyhoI8zSxQCgjZH+ucqRsgbRJXCHNbHpb5fo
8Q4An2qXUXvghbNAkbrvFYN6LR0uvXh5
=osgg
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Mar_2009_13_16_55_+1100_RZKkmzxQt=Ud2+qS--
