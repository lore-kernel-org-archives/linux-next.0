From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the wireless-current
 tree
Date: Fri, 6 Mar 2009 14:55:01 +1100
Message-ID: <20090306145501.b92c93a0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Mar_2009_14_55_01_+1100_tvP=f+V8/T=WlnTw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35119 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751756AbZCFDzO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 22:55:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>, "John W. Linville" <linville@tuxdriver.com>

--Signature=_Fri__6_Mar_2009_14_55_01_+1100_tvP=f+V8/T=WlnTw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/iwlwifi/iwl3945-base.c between commit
623d563e52d4d4041612e24b33a5610a900dd778 ("iwlwifi: fix error flow in
iwl*_pci_probe") from the wireless-current tree and various commit(s?)
from the net tree.

I used the version of the file from the merge-test branch of the wireless
tree (thanks, John).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Mar_2009_14_55_01_+1100_tvP=f+V8/T=WlnTw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmwnpUACgkQjjKRsyhoI8zh4wCgg4rIDJI4nPyoyxZMswYm/tby
AiwAnjizQz8sniV7RsqR/AvwWV/0K4ch
=ivOb
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Mar_2009_14_55_01_+1100_tvP=f+V8/T=WlnTw--
