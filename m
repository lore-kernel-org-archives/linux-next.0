From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the trivial
 tree
Date: Wed, 3 Jun 2009 17:13:12 +1000
Message-ID: <20090603171312.b80e30bb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__3_Jun_2009_17_13_12_+1000_03lZ8zqPsYW9D0z+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50900 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753020AbZFCHNP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2009 03:13:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matt LaPlante <kernel1@cyberdogtech.com>, Jiri Kosina <jkosina@suse.cz>, GeunSik Lim <leemgs1@gmail.com>

--Signature=_Wed__3_Jun_2009_17_13_12_+1000_03lZ8zqPsYW9D0z+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
Documentation/trace/ftrace.txt between commit
9976d9daf91d146724ad9c336f74c60d2195c386 ("trivial: Miscellaneous
documentation typo fixes") from the trivial tree and commit
b6b8b2b9588b3e09fea0da0e86f6b8bcba827b65 ("debugfs: Fix terminology
inconsistency of dir name to mount debugfs filesystem") from the
driver-core tree.

The latter removes the text that is patched by the former.  I just used
the driver-core version.  I suggest that the part of the trivial tree
patch that touches this file be dropped.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__3_Jun_2009_17_13_12_+1000_03lZ8zqPsYW9D0z+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkomIogACgkQjjKRsyhoI8xyrwCfQ9PF6/EQu1+wY3nKE5CkkWBf
AjEAoI6Zz4QKpgPSPmpeh+ZnyGXJf7zm
=gTqf
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Jun_2009_17_13_12_+1000_03lZ8zqPsYW9D0z+--
