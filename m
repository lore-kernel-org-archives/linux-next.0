From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ext4 tree build failure
Date: Tue, 28 Apr 2009 11:27:22 +1000
Message-ID: <20090428112722.22c844ea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__28_Apr_2009_11_27_22_+1000_enCJqAIP5eISguh2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36468 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752667AbZD1B1e (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Apr 2009 21:27:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Tso <tytso@MIT.EDU>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__28_Apr_2009_11_27_22_+1000_enCJqAIP5eISguh2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ted,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/ext4/super.c: In function 'ext4_put_super':
fs/ext4/super.c:590: error: implicit declaration of function 'vfree'
fs/ext4/super.c: In function 'ext4_fill_flex_info':
fs/ext4/super.c:1644: error: implicit declaration of function 'vmalloc'
fs/ext4/super.c:1644: warning: assignment makes pointer from integer withou=
t a cast

Probably caused by commit a4ded943dff5de6fee2b397de9bcb2ffd5556253
("ext4: Fallback to vmalloc if kmalloc can't allocate s_flex_groups
array").  Presumably a missing explicit include of linux/vmalloc.h.

I have used the ext4 tree from next-20090424.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__28_Apr_2009_11_27_22_+1000_enCJqAIP5eISguh2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn2W3oACgkQjjKRsyhoI8zd3gCgjTZ6ezuo1soFWNi8lUFHVN2N
n9kAnAi9pYdMWl2y/lcsNSuyUT1uTswT
=aaU8
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Apr_2009_11_27_22_+1000_enCJqAIP5eISguh2--
