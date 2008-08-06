From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ide tree
Date: Wed, 6 Aug 2008 13:35:28 +1000
Message-ID: <20080806133528.f96811af.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__6_Aug_2008_13_35_28_+1000_0rA/hbD+nxsB7Fxu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44858 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752013AbYHFDfe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 23:35:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__6_Aug_2008_13_35_28_+1000_0rA/hbD+nxsB7Fxu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Today's linux-next merge of the ide tree got conflicts in
drivers/ide/ide-iops.c and drivers/ide/ide-dma.c between commits
367fdcb4e401161e51aaee5d06b3f82098bafefc ("ide: fix pre-EIDE SWDMA
support on big-endian") and 242f44261e6c5fdc13e3cd12f949ab717dc37d58
("ide: fix ide_fix_driveid()") from Linus' tree (which are also in the
ide tree) and further changes in the ide tree.

This is just to let you know, there is not problem here.

I just used the versions from the ide tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__6_Aug_2008_13_35_28_+1000_0rA/hbD+nxsB7Fxu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiZHAAACgkQjjKRsyhoI8zaigCfR8pcuDx9KToa3zfScrqPpah/
m1cAoI/GBUnZQNHhod0dnnixOhjWzBOa
=tN/V
-----END PGP SIGNATURE-----

--Signature=_Wed__6_Aug_2008_13_35_28_+1000_0rA/hbD+nxsB7Fxu--
