From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cifs tree build failure
Date: Fri, 3 Apr 2009 13:07:31 +1100
Message-ID: <20090403130731.6e117eb1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__3_Apr_2009_13_07_31_+1100_S5c.T.XqQPfANsN7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44356 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750825AbZDCCHm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Apr 2009 22:07:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org
Cc: linux-next@vger.kernel.org, Igor Mammedov <niallain@gmail.com>, Jeff Layton <jlayton@redhat.com>

--Signature=_Fri__3_Apr_2009_13_07_31_+1100_S5c.T.XqQPfANsN7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/cifs/connect.c: In function 'cifs_mount':
fs/cifs/connect.c:2545: error: 'struct cifs_sb_info' has no member named 'm=
ountdata'

Caused by commit da9e1ebdf6fc4630329afcad11855113ad6023b6 ("Remote DFS
root support").  I will use the cifs tree form next-20090402 (which
really just drops that one commit).

Presumably CONFIG_CIFS_DFS_UPCALL is not defined in my config.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__3_Apr_2009_13_07_31_+1100_S5c.T.XqQPfANsN7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknVb2MACgkQjjKRsyhoI8wSMwCfQiWqFzq0WoNFs715C15IEuAW
C6UAnjQqZMluPf+GVfGciz7Rjb02QmRe
=tQ0R
-----END PGP SIGNATURE-----

--Signature=_Fri__3_Apr_2009_13_07_31_+1100_S5c.T.XqQPfANsN7--
