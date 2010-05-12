From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ext3 tree with the cifs tree
Date: Wed, 12 May 2010 10:13:15 +1000
Message-ID: <20100512101315.af5fb6f8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__12_May_2010_10_13_15_+1000_JYkBVl6sonDl6qnF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45887 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752331Ab0ELANW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 May 2010 20:13:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Christoph Hellwig <hch@infradead.org>, Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org

--Signature=_Wed__12_May_2010_10_13_15_+1000_JYkBVl6sonDl6qnF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jan,

Today's linux-next merge of the ext3 tree got a conflict in
fs/cifs/cifsfs.c between commit b6b38f704a8193daba520493ebdaf7e819962fc8
("[CIFS] Neaten cERROR and cFYI macros, reduce text space") from the cifs
tree and commit 31bb95a8175db36ed4772008a7e81014765bb782 ("cifs: drop
quota operation stubs") from the ext3 tree.

The latter removes some of the code that the former modifies.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__12_May_2010_10_13_15_+1000_JYkBVl6sonDl6qnF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvp8psACgkQjjKRsyhoI8w3UgCfSpdLB6ClPekNSMTfOSI077v4
btwAn1hOjQiwzhPzd22YLl2tRmQAGFCF
=Ezih
-----END PGP SIGNATURE-----

--Signature=_Wed__12_May_2010_10_13_15_+1000_JYkBVl6sonDl6qnF--
