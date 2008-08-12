From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Tue, 12 Aug 2008 17:09:54 +1000
Message-ID: <20080812170954.8dcf0318.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_Aug_2008_17_09_54_+1000_TmGi.EBkvtvtWRzM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46368 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751350AbYHLHKD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 03:10:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

--Signature=_Tue__12_Aug_2008_17_09_54_+1000_TmGi.EBkvtvtWRzM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the creds tree got a conflict in
fs/namespace.c between commit 7125f0b2f3b13510a2e786503aecd4e35822ea62
("finally get rid of nameidata in namespace.c") from the vfs tree and
commit f4d399d40debd14b22967153294b94087cbcf789 ("CRED: Wrap most
current->e?[ug]id and some task->e?[ug]id") from the creds tree.

I did the obvious fixup and can carry it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_Aug_2008_17_09_54_+1000_TmGi.EBkvtvtWRzM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkihN0IACgkQjjKRsyhoI8xVPwCeNIznCHLbUciObDl0tlfaAwch
1UAAoLF4pCHMLJNNd8CMz/pAf+oUAiT6
=JsDv
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Aug_2008_17_09_54_+1000_TmGi.EBkvtvtWRzM--
