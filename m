From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Tue, 12 Aug 2008 17:13:16 +1000
Message-ID: <20080812171316.31599db4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_Aug_2008_17_13_16_+1000_IelJJ7+r7N.cj/Yy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33640 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751388AbYHLHN2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 03:13:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

--Signature=_Tue__12_Aug_2008_17_13_16_+1000_IelJJ7+r7N.cj/Yy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the creds tree got a conflict in
fs/nfsd/nfs4recover.c between commit
eec56f5904cd79d7cf99efd74ad02f39c829fff1 ("switch nfsd to kern_path()")
from the vfs tree and commit 3aef995c0537d5ba27936d2e8cb42d307084932c
("CRED: Pass credentials through dentry_open()") from the creds tree.

I did the obvious fixup and can carry it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_Aug_2008_17_13_16_+1000_IelJJ7+r7N.cj/Yy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkihOAwACgkQjjKRsyhoI8w2bwCeL4kzEQGxb3/Vx7dAF7kvvvjz
+HwAn0ZgOiiDSWPVXPqfuo1FDNgXdHel
=SRqZ
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Aug_2008_17_13_16_+1000_IelJJ7+r7N.cj/Yy--
