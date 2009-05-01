From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cifs tree build warning
Date: Fri, 1 May 2009 13:28:48 +1000
Message-ID: <20090501132848.fc34569e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__1_May_2009_13_28_48_+1000_zp.QVzHP_9G2gdAt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49731 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756507AbZEAD24 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2009 23:28:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org
Cc: linux-next@vger.kernel.org, Igor Mammedov <niallain@gmail.com>

--Signature=_Fri__1_May_2009_13_28_48_+1000_zp.QVzHP_9G2gdAt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

fs/cifs/cifs_dfs_ref.c: In function 'cifs_dfs_follow_mountpoint':
fs/cifs/cifs_dfs_ref.c:345: warning: ISO C90 forbids mixed declarations and=
 code

Introduced by commit 1af28ceb923d04357733642a3dbc4497da4db1c2 ("Enable
dfs submounts to handle remote referrals").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__1_May_2009_13_28_48_+1000_zp.QVzHP_9G2gdAt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn6bHAACgkQjjKRsyhoI8xorwCgv2HOiS44ZZtzdrrn3KV46otR
A8MAn1ZaY6UrUnzHsoScojAVA2GDlFZP
=VGqp
-----END PGP SIGNATURE-----

--Signature=_Fri__1_May_2009_13_28_48_+1000_zp.QVzHP_9G2gdAt--
