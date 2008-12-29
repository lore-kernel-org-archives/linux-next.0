From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build warnings
Date: Mon, 29 Dec 2008 11:35:25 +1100
Message-ID: <20081229113525.89450db7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_11_35_25_+1100_.ieb+79n/2P1izS7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42215 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751665AbYL2Afc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Dec 2008 19:35:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Horman <nhorman@tuxdriver.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org

--Signature=_Mon__29_Dec_2008_11_35_25_+1100_.ieb+79n/2P1izS7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

Today's linux-next build (powerpc ppc64_defconfig) produced these new
warnings:

drivers/net/pasemi_mac.c: In function 'pasemi_mac_rx_intr':
drivers/net/pasemi_mac.c:957: warning: unused variable 'dev'
drivers/net/pasemi_mac.c: In function 'pasemi_mac_poll':
drivers/net/pasemi_mac.c:1637: warning: unused variable 'dev'
drivers/net/spider_net.c: In function 'spider_net_poll':
drivers/net/spider_net.c:1280: warning: unused variable 'netdev'

Probably caused by commit 908a7a16b852ffd618a9127be8d62432182d81b4 ("net:
Remove unused netdev arg from some NAPI interfaces").

Please fix these up.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_11_35_25_+1100_.ieb+79n/2P1izS7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYG00ACgkQjjKRsyhoI8yvTQCfXkccGACpqZBgDNgq1nynu8O3
7ckAnjSCx7ansntuMEzxqXkOf4wnpJRP
=d48q
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_11_35_25_+1100_.ieb+79n/2P1izS7--
