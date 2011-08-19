From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (pm tree
 related)
Date: Fri, 19 Aug 2011 13:03:28 +1000
Message-ID: <20110819130328.ee5c4b7191db0ce2c8a02e39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__19_Aug_2011_13_03_28_+1000_wI76sgvF=9z/1+Fx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51951 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751399Ab1HSDDj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Aug 2011 23:03:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jean Pihet <j-pihet@ti.com>

--Signature=_Fri__19_Aug_2011_13_03_28_+1000_wI76sgvF=9z/1+Fx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
allnoconfig) failed like this:

In file included from include/linux/netdevice.h:34:0,
                 from include/linux/icmpv6.h:173,
                 from include/linux/ipv6.h:220,
                 from include/net/ipv6.h:16,
                 from include/linux/sunrpc/clnt.h:25,
                 from include/linux/nfs_fs.h:50,
                 from init/do_mounts.c:20:
include/linux/pm_qos.h: In function 'dev_pm_qos_add_request':
include/linux/pm_qos.h:123:6: warning: 'return' with no value, in function =
returning non-void
include/linux/pm_qos.h: In function 'dev_pm_qos_update_request':
include/linux/pm_qos.h:126:6: warning: 'return' with no value, in function =
returning non-void
include/linux/pm_qos.h: In function 'dev_pm_qos_remove_request':
include/linux/pm_qos.h:128:6: warning: 'return' with no value, in function =
returning non-void

Caused by commit b6d5b88750dc ("PM QoS: Implement per-device PM QoS
constraints").

Please, please compile test with CONFIG options that your patch depends
on switched on and switched off - in this case CONFIG_PM.

I have reverted that commit (and the followinf commit 57afcf09649c ("PM
QoS: Add global notification mechanism for device constraints")) for
today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__19_Aug_2011_13_03_28_+1000_wI76sgvF=9z/1+Fx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOTdKAAAoJEDMEi1NhKgbsgOIIAJ6QdpmDvXiotA/0VDIBVjG6
S3CtNqBJlmuGce213iXkrwEAMslD34byrKJecpv48yYWpBNmVUsYbTxl4YMjUWm2
It/iQ5eP0oQIiWL6YHyPI7Ow6P/Tr7KOnWFbP6yV/7l3khOXYlgHfsVCg3ixC5ZX
v0eIxZhKFfhWklf9JMnq1v3gc3NeCj3V+Kgate36mjg0Mkfdrb3Go9y+hW7v6Egw
7CI8yhffdl5QUZB9wdsFZqPNsATrE6wqWiqJtko1NzWTqF3oh/Mb2LCen7ld+4HO
C15ZOp9rrXh5myHpU94D6O8RUobB+cNz7O4gs+cfwbRwZw2psGroVqqZWtQmU0g=
=tSbO
-----END PGP SIGNATURE-----

--Signature=_Fri__19_Aug_2011_13_03_28_+1000_wI76sgvF=9z/1+Fx--
