From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Fri, 27 Jun 2008 16:13:47 +1000
Message-ID: <20080627161347.0af905fb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_Jun_2008_16_13_47_+1000_iQ0u4PyHdRNqPM5l"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55266 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751429AbYF0GOE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 02:14:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Fri__27_Jun_2008_16_13_47_+1000_iQ0u4PyHdRNqPM5l
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a trivial conflict in
include/asm-x86/smp.h between commit
a4c81cf684350797939416c99effb9d3ae46bca6 ("x86: extend e820 ealy_res
support 32bit") from the x86 tree and commit
3b16cf874861436725c43ba0b68bdd799297be7c ("x86: convert to generic
helpers for IPI function calls") from the block tree.

A case of contextually close deletions.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_Jun_2008_16_13_47_+1000_iQ0u4PyHdRNqPM5l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhkhRsACgkQTgG2atn1QN/P+wCeIU+eP625C7JVxw6Bor1yDO8s
OTMAnRv3MS9e3xbsv3H8rH8cu3DXSwXv
=Y3Ou
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Jun_2008_16_13_47_+1000_iQ0u4PyHdRNqPM5l--
