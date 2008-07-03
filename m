From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless tree
Date: Thu, 3 Jul 2008 14:43:08 +1000
Message-ID: <20080703144308.5f802ec7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_14_43_08_+1000_K1oNuCe46_pGfotT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33362 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751851AbYGCEnN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 00:43:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Zhu Yi <yi.zhu@intel.com>, Stefanik =?UTF-8?B?R8OhYm9y?= <netrolller.3d@gmail.com>

--Signature=_Thu__3_Jul_2008_14_43_08_+1000_K1oNuCe46_pGfotT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next merge of the wireless tree got a conflict in
drivers/net/wireless/iwlwifi/iwl3945-base.c between commit
6afe6828b19b4567768264831d101026cb5510ff ("iwlwifi: drop skb silently for
Tx request in monitor mode") from the wireless-current tree and commit
914233d68f07d5d9c22630cd5a84fdfd98f39da2 ("iwlwifi: enable packet
injection for iwl3945") from the wireless tree.

I used the version from you test merge, thanks again.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_14_43_08_+1000_K1oNuCe46_pGfotT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsWNwACgkQjjKRsyhoI8xT8ACgsg6CV9VIWxTMGLfPLHcbU5u2
nu4AniL5JkKudn8Ie1OhTCIlSQqCI/0w
=GnXB
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_14_43_08_+1000_K1oNuCe46_pGfotT--
