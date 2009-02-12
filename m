From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the net-current tree
Date: Thu, 12 Feb 2009 13:46:04 +1100
Message-ID: <20090212134604.5ce2fe53.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Feb_2009_13_46_04_+1100_Qa07PNmoA/TkzC_Q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45050 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755620AbZBLCqS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Feb 2009 21:46:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>, "John W. Linville" <linville@tuxdriver.com>

--Signature=_Thu__12_Feb_2009_13_46_04_+1100_Qa07PNmoA/TkzC_Q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the net tree got conflicts in
drivers/net/wireless/iwlwifi/iwl-agn.c and
drivers/net/wireless/iwlwifi/iwl3945-base.c between commit
89c581b3fb2986e303f1299e6458e3e9b115fa3f ("iwlwifi: fix suspend/resume
and its usage of pci saved state") from the net-current tree and commits
from the net tree.

I assume this is what John was referring to when he said:

> The iwlwifi patch corrects a problem (introduced by the previous iwlwifi
> fix) that disables the iwlwifi devices after suspend/resume.  It will
> conflict with what is already in -next -- just take the hunks that are
> already in -next and ignore the hunks introduced here.

So I took that advise.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Feb_2009_13_46_04_+1100_Qa07PNmoA/TkzC_Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmTjWwACgkQjjKRsyhoI8y5jQCbBxfKqBjKfCJZ2urtQbWd4R1d
VygAmwZtsvDtOlU1FliVkD7Tvnq4IyR/
=eJdJ
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Feb_2009_13_46_04_+1100_Qa07PNmoA/TkzC_Q--
