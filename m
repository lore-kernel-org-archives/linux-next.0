From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cifs tree build warnings
Date: Mon, 6 Apr 2009 15:14:57 +1000
Message-ID: <20090406151457.e73250a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__6_Apr_2009_15_14_57_+1000_Evcw5bcBJrt4Y++2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42357 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751067AbZDFFPI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Apr 2009 01:15:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org
Cc: linux-next@vger.kernel.org

--Signature=_Mon__6_Apr_2009_15_14_57_+1000_Evcw5bcBJrt4Y++2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Today's linux-next build (powerpc ppc64_defconfig) produces these new
warnings:

fs/cifs/connect.c: In function 'cifs_mount':
fs/cifs/connect.c:2280: warning: label 'try_mount_again' defined but not us=
ed
fs/cifs/connect.c:2276: warning: unused variable 'num_referrals'
fs/cifs/connect.c:2275: warning: unused variable 'referrals'
fs/cifs/connect.c: At top level:
fs/cifs/connect.c:2239: warning: 'build_unc_path_to_root' defined but not u=
sed

Caused by commit 924cb95aad14c2f2726547938bf44bbce91a2f3e ("[CIFS] Fix
build break from recent DFS patch when DFS support not enabled").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__6_Apr_2009_15_14_57_+1000_Evcw5bcBJrt4Y++2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknZj9EACgkQjjKRsyhoI8xN8gCgvLbP5nRTd2u7f06Kgy96k13E
nwAAni6Qx01KSsgA+KQgb36SYHbwGA+H
=ogYg
-----END PGP SIGNATURE-----

--Signature=_Mon__6_Apr_2009_15_14_57_+1000_Evcw5bcBJrt4Y++2--
