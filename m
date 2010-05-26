From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning in Linus'tree
Date: Wed, 26 May 2010 11:05:06 +1000
Message-ID: <20100526110506.f2f4f22c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__26_May_2010_11_05_06_+1000_sjAMTDJwyHgOtG8p"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39195 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754155Ab0EZBFO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 May 2010 21:05:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Joakim Tjernlund <Joakim.Tjernlund@transmode.se>

--Signature=_Wed__26_May_2010_11_05_06_+1000_sjAMTDJwyHgOtG8p
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

lib/crc32.c:53:22: warning: "__LITTLE_ENDIAN" is not defined
lib/crc32.c:53:22: warning: "__LITTLE_ENDIAN" is not defined
In file included from fs/jfs/jfs_types.h:33,
                 from fs/jfs/jfs_incore.h:26,
                 from fs/jfs/file.c:22:
fs/jfs/endian24.h:36:101: warning: "__LITTLE_ENDIAN" is not defined

and more of the same ...

Introduced by commit 4762bbc1a3a1f22095278b74dd1b8cee04858641 ("crc32:
use __BYTE_ORDER macro for endian detection") and (probably) commit b3b77c8=
caef1750ebeea1054e39e358550ea9f55 ("endian: #define __BYTE_ORDER").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__26_May_2010_11_05_06_+1000_sjAMTDJwyHgOtG8p
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkv8c8IACgkQjjKRsyhoI8ywAQCfcbouvU4PoKngixFlPZQy0dn/
vAEAn26VmkYHJJ/eLq5+A4kXhjNxavqs
=4iWW
-----END PGP SIGNATURE-----

--Signature=_Wed__26_May_2010_11_05_06_+1000_sjAMTDJwyHgOtG8p--
