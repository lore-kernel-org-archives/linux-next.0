From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build warning
Date: Thu, 17 Dec 2009 11:10:09 +1100
Message-ID: <20091217111009.35d480da.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Dec_2009_11_10_09_+1100_kHjEigWU=WJ82TY0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33237 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1762567AbZLQAKQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Dec 2009 19:10:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Thu__17_Dec_2009_11_10_09_+1100_kHjEigWU=WJ82TY0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

fs/nfs/super.c: In function 'nfs_follow_remote_path':
fs/nfs/super.c:2672: warning: label 'out_mntput' defined but not used

Introduced by commit e9496ff46a20a8592fdc7bdaaf41b45eb808d310 ("fix
mismerge with Trond's stuff (create_mnt_ns() export is gone now)").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Dec_2009_11_10_09_+1100_kHjEigWU=WJ82TY0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkspduEACgkQjjKRsyhoI8y4SQCfblKWw+81+Avx3NnTvgzHNcJV
lxEAoINg8shSBEgDuUsnp7gDUPVBT4uC
=55Pk
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Dec_2009_11_10_09_+1100_kHjEigWU=WJ82TY0--
