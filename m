From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the  tree
Date: Thu, 5 Feb 2009 13:55:11 +1100
Message-ID: <20090205135511.71fbd3f6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Feb_2009_13_55_11_+1100_DNk0JUwT4KX4qR+o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48897 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752103AbZBECzU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2009 21:55:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>, "John W. Linville" <linville@tuxdriver.com>, Helmut Schaa <helmut.schaa@googlemail.com>

--Signature=_Thu__5_Feb_2009_13_55_11_+1100_DNk0JUwT4KX4qR+o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/iwlwifi/iwl-agn.c between commit
c4e061ace75513aee227090486cc46dec7810c00 ("iwlwifi: save PCI state before
suspend, restore after resume") from the wireless-current tree and
commit 6cd0b1cb872b3bf9fc5de4536404206ab74bafdd ("iwlagn: fix hw-rfkill
while the interface is down") from the net and wireless trees.

The former just appears to be a subset of the latter.  I fixed it up and
can carry the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Feb_2009_13_55_11_+1100_DNk0JUwT4KX4qR+o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmKVQ8ACgkQjjKRsyhoI8ym+wCeJlKchCD4nAP2rc4P0Bk2a5fs
6MAAoIT84b+YMxz5uinRz+rjjSKLcjoF
=8v8U
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Feb_2009_13_55_11_+1100_DNk0JUwT4KX4qR+o--
