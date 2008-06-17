From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of nfsd tree
Date: Tue, 17 Jun 2008 15:39:14 +1000
Message-ID: <20080617153914.5068b609.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Jun_2008_15_39_14_+1000_3Onac4/jdDYmgntd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35506 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754852AbYFQFj0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 01:39:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, Trond Myklebust <trond.myklebust@fys.uio.no>, Kevin Coffman <kwc@citi.umich.edu>

--Signature=_Tue__17_Jun_2008_15_39_14_+1000_3Onac4/jdDYmgntd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Today's linux-next merge of the nfsd tree got a conflict in
net/sunrpc/auth_gss/auth_gss.c between commit
733e73be1865a3f5bc97b5533145064136636b27 ("rpc: remove some unused
macros") from the nfs tree and commit
767b4b6b4f2a6a282deb18c2c80f070e32b70f52 ("rpcauth: update and document
available space in xdr_buf when doing privacy") from the nfsd tree.

I did the obvious fixup, but it may be worth a look.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Jun_2008_15_39_14_+1000_3Onac4/jdDYmgntd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhXTgIACgkQTgG2atn1QN/RRwCdHW4jKW0pImVPq69hnDCw1R6Z
akMAoI8iFi3K9YCby6pYS+D2HWfjdn1b
=IOPo
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Jun_2008_15_39_14_+1000_3Onac4/jdDYmgntd--
