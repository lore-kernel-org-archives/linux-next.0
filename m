From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless tree
Date: Thu, 3 Jul 2008 14:38:32 +1000
Message-ID: <20080703143832.bfa5911a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_14_38_32_+1000_TIeMbjrbwbfEO8_O"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:32936 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751765AbYGCEil (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 00:38:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Rick Farrington <rickdic@hotmail.com>

--Signature=_Thu__3_Jul_2008_14_38_32_+1000_TIeMbjrbwbfEO8_O
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next merge of the wireless tree got a conflict in
drivers/net/wireless/iwlwifi/iwl-4965.c between commit
ec04fd60fd74a9db9c63fe11d519be3642cabfdd ("iwlwifi: fix incorrect 5GHz
rates reported in monitor mode") from the wireles-current tree (or maybe
the merge fixup with the net tree) and commit
1781a07fbe9cce3dc1697288a5edd260ea7edc02 ("iwlwifi: move RX handlers to
iwl-rx.c") from the wireless tree.

I took the version from the wireless tree (which matched the version in
you test merge, thanks).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_14_38_32_+1000_TIeMbjrbwbfEO8_O
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhsV8kACgkQjjKRsyhoI8wvcgCfdm9qgiNVYLtAGctj9e8zr+2A
gUAAn29tWbcXd/OsCWfvmtFoNbZoa4Z/
=JBv1
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_14_38_32_+1000_TIeMbjrbwbfEO8_O--
