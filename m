From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning in Linus' tree
Date: Mon, 25 Oct 2010 11:38:58 +1100
Message-ID: <20101025113858.feeff8a7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__25_Oct_2010_11_38_58_+1100_5miTshLFRzd.KrE."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55432 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750942Ab0JYAjI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Oct 2010 20:39:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Miller <mike.miller@hp.com>, Jens Axboe <jaxboe@fusionio.com>

--Signature=_Mon__25_Oct_2010_11_38_58_+1100_5miTshLFRzd.KrE.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/scsi/hpsa.c:94:1: warning: "PCI_DEVICE_ID_HP_CISSF" redefined
In file included from include/linux/pci.h:58,
                 from drivers/scsi/hpsa.c:25:
include/linux/pci_ids.h:746:1: warning: this is the location of the previou=
s definition

Introduced by commit 6362beea8914cbd4630ccde3617d944aeca2d48f ("cciss:
fix PCI IDs for new Smart Array controllers") a commit that never made it
to linus-next :-(.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__25_Oct_2010_11_38_58_+1100_5miTshLFRzd.KrE.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMxNGiAAoJEDMEi1NhKgbsBRMIAIiKOxW8uDB82ncT1qPRmNng
T1ZRrcYBPYGBJn7UtiQt2xoRZcyzPuxwE/mWppUWObjS2kBo4P3vgRGA0iWnSz0z
Km48xoeae3yYjXzyg5rMVjAL0vYH+UAuWRdX56QoY97ZbJDWqX+LZ3u8O6Ts65XG
kbqpmo0vtZ9pA7U/FRnXWXc9My5GO3Zwr/7bddQRMpUxLfCqGLkJNOqQdW+XPvWZ
9olssiZBlqWrYkfCmKkq9Th6R+ALkkT+cbe01rGR9N8Qtt1NLpCuy3NrlTPtf7Vj
F7LanX8Im1fkNa3kmKez0Ke1nieYAjnRWmcglKOA25tysmtgLXlckVqAtJAAS2U=
=Q/D/
-----END PGP SIGNATURE-----

--Signature=_Mon__25_Oct_2010_11_38_58_+1100_5miTshLFRzd.KrE.--
