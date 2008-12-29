From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the uwb tree
Date: Mon, 29 Dec 2008 23:36:05 +1100
Message-ID: <20081229233605.5ddd15a7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_23_36_05_+1100_v9LSq+FSWsXKIpvZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48072 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752585AbYL2MgL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 07:36:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Vrabel <david.vrabel@csr.com>
Cc: linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>

--Signature=_Mon__29_Dec_2008_23_36_05_+1100_v9LSq+FSWsXKIpvZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the uwb tree got a conflict in
drivers/uwb/wlp/eda.c between commit
a20fd0a783551831bb6b9b69710e5bbb93dc2730 ("uwb: use the %pM formatting
specifier in eda.c") from Linus' tree and commit
bce83697c5fe84a7a5d38c96fbbe43b4bc028c3e ("uwb: use dev_dbg() for debug
messages") from the uwb tree.

The latter removed the some code that the former was modifying.  I fixed
it up and can carry the fix for now.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_23_36_05_+1100_v9LSq+FSWsXKIpvZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYxDUACgkQjjKRsyhoI8zT+wCgqgEfn+mK1tvedM9a5rpvtCwQ
J3UAnRCYtmz2UICi0JObJB/JdsY67f3u
=m6Mz
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_23_36_05_+1100_v9LSq+FSWsXKIpvZ--
