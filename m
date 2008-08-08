From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Fri, 8 Aug 2008 16:08:44 +1000
Message-ID: <20080808160844.796dfcc1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__8_Aug_2008_16_08_44_+1000_Gh=_TrDZDbrNz+_v"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48614 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752654AbYHHGIy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Aug 2008 02:08:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, David Chinner <dgc@sgi.com>, xfs-masters@oss.sgi.com

--Signature=_Fri__8_Aug_2008_16_08_44_+1000_Gh=_TrDZDbrNz+_v
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the creds tree got a conflict in
fs/xfs/xfs_acl.c between commit 6811235504abbeed42673cf70014759f39e12a9b
("[XFS] XFS: Kill xfs_vtoi()") from the xfs tree and commit
785af0f385cd424d4b40908bf0e467df3dc05434 ("CRED: Change current->fs[ug]id
to current_fs[ug]id()") from the creds tree.

I did the obvious fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__8_Aug_2008_16_08_44_+1000_Gh=_TrDZDbrNz+_v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkib4uwACgkQjjKRsyhoI8zbpACgkjv1EmzuloYm/9mvB+siZIyh
u/4AoK8kTsz+mpjwSCloIEQa7ysIh/w3
=+CkI
-----END PGP SIGNATURE-----

--Signature=_Fri__8_Aug_2008_16_08_44_+1000_Gh=_TrDZDbrNz+_v--
