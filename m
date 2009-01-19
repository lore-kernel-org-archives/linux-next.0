From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the m68knommu tree with Linus' treee
Date: Tue, 20 Jan 2009 10:55:51 +1100
Message-ID: <20090120105551.a01eb74f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__20_Jan_2009_10_55_51_+1100_RRT6Y6Vo8604104Z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37926 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760770AbZASX4A (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Jan 2009 18:56:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Tue__20_Jan_2009_10_55_51_+1100_RRT6Y6Vo8604104Z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the m68knommu tree got a conflict in
arch/m68knommu/include/asm/Kbuild between commit
74d96f018673759d04d032c137d132f6447bfb1e ("byteorder: make swab.h include
asm/swab.h like a regular header") from Linus' tree and commit
49148020bcb6910ce71417bd990a5ce7017f9bd3 ("m68k,m68knommu: merge header
files") from the m68knommu tree.

The latter removed the file and the former removed a line from it.  So I
just removed the file.  I can keep doing that or you could do a merge
with Linus' tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__20_Jan_2009_10_55_51_+1100_RRT6Y6Vo8604104Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl1EwcACgkQjjKRsyhoI8yoWQCgkL5QvpgkrNa3LsZihK52WbyJ
MxkAn25qHUqcSSrSS+I5lu5PDAChFB34
=hcJu
-----END PGP SIGNATURE-----

--Signature=_Tue__20_Jan_2009_10_55_51_+1100_RRT6Y6Vo8604104Z--
