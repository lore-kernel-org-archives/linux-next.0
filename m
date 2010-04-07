From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless tree with the
 wireless-current tree
Date: Wed, 7 Apr 2010 12:58:28 +1000
Message-ID: <20100407125828.d9f03281.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__7_Apr_2010_12_58_28_+1000_M8Q8CpLQGxfkJREa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52307 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755648Ab0DGC6d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Apr 2010 22:58:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zhu Yi <yi.zhu@intel.com>

--Signature=_Wed__7_Apr_2010_12_58_28_+1000_M8Q8CpLQGxfkJREa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next merge of the wireless tree got conflicts in
drivers/net/wireless/iwlwifi/iwl-core.c,
drivers/net/wireless/iwlwifi/iwl-tx.c and
drivers/net/wireless/iwlwifi/iwl-core.h between commit
de0f60ea94e132c858caa64a44b2012e1e8580b0 ("iwlwifi: avoid Tx queue memory
allocation in interface down") from the wireless-current tree and commit
74bcdb33e99f49ef5202dd2f8109945b4570edc2 ("iwlwifi: move agn only tx
functions from iwlcore to iwlagn") from the wireless tree.

The latter moved the code modified by the former.  I couldn't see any
easy way to fix this up, so I effectively reverted the change in the
wireless-current tree.  Please do the merge fixup, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__7_Apr_2010_12_58_28_+1000_M8Q8CpLQGxfkJREa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAku79NQACgkQjjKRsyhoI8zJxQCgiNj3erOOCAq1lxLxenxA3j8u
9zQAnjx3vWfvLjTGpD3BTpoksb8KQqSd
=uv5W
-----END PGP SIGNATURE-----

--Signature=_Wed__7_Apr_2010_12_58_28_+1000_M8Q8CpLQGxfkJREa--
