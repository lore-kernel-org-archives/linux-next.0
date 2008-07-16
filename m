From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the generic-ipi tree
Date: Wed, 16 Jul 2008 19:45:17 +1000
Message-ID: <20080716194517.fc260962.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_19_45_17_+1000_KsmHV2pox7syV/rm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37379 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755624AbYGPJpY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 05:45:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>, Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__16_Jul_2008_19_45_17_+1000_KsmHV2pox7syV/rm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens, Ingo,

Today's linux-next merge of the generic-ipi tree got a conflict in
arch/powerpc/Kconfig between commit
3affedc4e1ce837033b6c5e9289d2ce2f5a62d31 ("powerpc/dma: implement new
dma_*map*_attrs() interfaces") and
7ff86b0317bc40c665aab62f3b7669713ade07c5 ("powerpc: Fix a build problem
on ppc32 with new DMA_ATTRs") from the powerpc tree and commit
07d55acad88f25177559f81aec42179e00c50360 ("manual merge of generic-ipi")
from the generic-ipi tree.

Some mixture of those and other commits.  I took a superset.  I guess
this will disappear tomorrow when things are more merged in Linus' tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_19_45_17_+1000_KsmHV2pox7syV/rm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9wy0ACgkQjjKRsyhoI8x5rACgsO1HHERRqfkdda4VDonOzZ9o
Mc0AnjROJdQyn8XTTWD8Upfm2wYOlyNM
=8pI9
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_19_45_17_+1000_KsmHV2pox7syV/rm--
