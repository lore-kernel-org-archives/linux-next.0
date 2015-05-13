From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the security tree with the vfs tree
Date: Wed, 13 May 2015 14:26:23 +1000
Message-ID: <20150513142623.2b956887@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/q+5AXnJI9y2PSXYxOK1LAsN"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53898 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750727AbbEME0a (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 May 2015 00:26:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, NeilBrown <neilb@suse.de>, Casey Schaufler <casey@schaufler-ca.com>

--Sig_/q+5AXnJI9y2PSXYxOK1LAsN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next merge of the security tree got a conflict in
security/capability.c between commits 37882db0546c ("SECURITY: remove
nameidata arg from inode_follow_link") and bda0be7ad994 ("security:
make inode_follow_link RCU-walk aware") from the vfs tree and commit
1ddd3b4e07a4 ("LSM: Remove unused capability.c") from the security tree.

I fixed it up (the latter removed the file, so I did that) and can
carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/q+5AXnJI9y2PSXYxOK1LAsN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVUtJzAAoJEMDTa8Ir7ZwVt0cP/0XYFZFbfssnv47yAxfgOxxj
sFkrIHl9b9WSPHZ6JTC3vl17c4upSzfFww/M5GEyut+Gfa1CtS6Qf8b2E6WEEtIf
7LUKwSbF4/Bht1L6D1euW01tMUA7iJ9x+6e1u+94CVzT98OvPyOTttUP0nO49hM6
GO0r9vrtj5VWZRsgfBxA+Usqz+Tq+tiiO7gCxPJtqTm0/9DWIovnf6A7pzOtSjst
PpRsgeduBDC1ZE+rbLCrZANcThqqvvSVlaY6HsMIXj+djjr2u035uoVvl+uuGaRI
6Nq5jfYQYl2gKMXPb+nNT2c4fLX01VvQsOGqXJR8ZbDfP3SSze/fPkkM4p1tHDB4
8Rt5c5EZXuH/5ZqZlaEQNq6FwYpAvJWfpRCnmPSpXYuYhKxoKWdGijFF+r3yT5F3
x7Y6rvriBQbgLHr3z5M+rGpUfFDMqOtToIFNAMOqFDpzkBwsEenwQniaCplMwnwK
AUjPlMCoA2E2pXd/75WHQWObiO1RqXLsmG/RbtpVtE/p6hrNn3oW1M9S0Pvb5xwy
Bpyx1RhHFk+dVsX6W3ejryyklrSuE8SeWruhCqJXnEZqM8p7/DsKdmOdQi0NAcpG
wL1QS7pq4HyV6a5q9CXlscFjfk920k8rr6EXbQTZr2kKrxtXLmqsP8/WqYDcIAWu
YGeKYSYSaMfTwX3/AXD0
=d07q
-----END PGP SIGNATURE-----

--Sig_/q+5AXnJI9y2PSXYxOK1LAsN--
