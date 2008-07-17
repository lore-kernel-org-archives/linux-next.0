From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ubifs tree
Date: Thu, 17 Jul 2008 17:10:59 +1000
Message-ID: <20080717171059.1bf8b572.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Jul_2008_17_10_59_+1000_VUIzwZ8LOTdcn0oO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53839 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752198AbYGQHLK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 03:11:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__17_Jul_2008_17_10_59_+1000_VUIzwZ8LOTdcn0oO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Artem,

Today's linux-next merge of the ubifs tree got conflicts in
fs/ubifs/budget.c, fs/ubifs/debug.c, fs/ubifs/dir.c, fs/ubifs/file.c,
fs/ubifs/io.c, fs/ubifs/journal.c, fs/ubifs/shrinker.c, fs/ubifs/tnc.c
and fs/ubifs/xattr.c between commit
1e51764a3c2ac05a23a22b2a95ddee4d9bffb16d ("UBIFS: add new flash file
system") from Linus' tree and various commits from the ubifs tree.

This is due to a different thing being sent to Linus to what is in the
-next tree.

I used the versions from the ubifs tree for now, please clean this up for
tomorrow.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Jul_2008_17_10_59_+1000_VUIzwZ8LOTdcn0oO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh+8IMACgkQjjKRsyhoI8wBpQCeJplDfLOAeMiBTDARvMfVO8Ca
9oYAn03NdqVzs86e3u+jILzl7/8QC3/P
=dRXA
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Jul_2008_17_10_59_+1000_VUIzwZ8LOTdcn0oO--
