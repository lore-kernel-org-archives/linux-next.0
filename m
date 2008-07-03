From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Thu, 3 Jul 2008 14:08:01 +1000
Message-ID: <20080703140801.301b74f3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_14_08_01_+1000_oNwfVv=Ks=dIOocl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43970 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750827AbYGCEIJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 00:08:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>, "John W. Linville" <linville@tuxdriver.com>, Rick Farrington <rickdic@hotmail.com>

--Signature=_Thu__3_Jul_2008_14_08_01_+1000_oNwfVv=Ks=dIOocl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/iwlwifi/iwl-4965.c between commit
ec04fd60fd74a9db9c63fe11d519be3642cabfdd ("iwlwifi: fix incorrect 5GHz
rates reported in monitor mode") from the wrieless-current tree and
commit radiotap ("iwlwifi: remove 4965 from iwl4965_rate_info") from the
net tree.

I did the obvious fixup (iwl4965_rates -> iwl_rates).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_14_08_01_+1000_oNwfVv=Ks=dIOocl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsUKEACgkQjjKRsyhoI8zgpACfee2qrr0jwKyucaG2yGVkedjG
dxkAoJBt0uaImLyGpJrYulnyny1fqtEV
=pKC3
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_14_08_01_+1000_oNwfVv=Ks=dIOocl--
