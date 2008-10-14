From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree
Date: Tue, 14 Oct 2008 13:57:14 +1100
Message-ID: <20081014135714.63f3eb42.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_13_57_14_+1100_7gS_Jzfo0cGbuyJx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38067 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755574AbYJNDL7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Oct 2008 23:11:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Hannes Reinecke <hare@suse.de>

--Signature=_Tue__14_Oct_2008_13_57_14_+1100_7gS_Jzfo0cGbuyJx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
drivers/net/wireless/iwlwifi/iwl3945-base.c between commit
4b7679a561e552eeda1e3567119bef2bca99b66e ("mac80211: clean up rate
control API") from Linus' tree and commit
9ea9c3769253947978746fab5cab5df10bc1ee35 ("Driver core: Use
dev_get_drvdata() accessors") from the driver-core tree.

The latter just modifies code that the former removes (the show_rs_window
function).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_13_57_14_+1100_7gS_Jzfo0cGbuyJx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0CooACgkQjjKRsyhoI8xIBwCeL10nv8IUeHRbLWwkCnxgGkWi
lE8AnjQ5IxlyxCH7FwfP1G1zDcB05RqQ
=PXeP
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_13_57_14_+1100_7gS_Jzfo0cGbuyJx--
