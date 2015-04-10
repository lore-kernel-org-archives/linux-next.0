From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Date: Fri, 10 Apr 2015 20:11:43 +1000
Message-ID: <20150410201143.4adb51b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mhq40439hrA/4AzuBwz+mb3"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50585 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754365AbbDJKLt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Apr 2015 06:11:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hyun Kwon <hyun.kwon@xilinx.com>, Radhey Shyam Pandey <radheys@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Hans Verkuil <hans.verkuil@cisco.com>

--Sig_/mhq40439hrA/4AzuBwz+mb3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

After merging the v4l-dvb tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/media/platform/xilinx/xilinx-dma.c:15:35: fatal error: linux/amba/x=
ilinx_dma.h: No such file or directory
 #include <linux/amba/xilinx_dma.h>
                                   ^

Caused by commit df3305156f98 ("[media] v4l: xilinx: Add Xilinx Video
IP core").

I have reverted that commit (and the 2 following it) for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/mhq40439hrA/4AzuBwz+mb3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJ6HjAAoJEMDTa8Ir7ZwVOCgP/AqooEP4oHfnXhd3x5XGWFWP
rbH4MbdCwXfc4mvGgbov0BxkBZ3rV9UWf5sF2ZDLm2zRj2dbsRSGWaBQiH4CsRLy
f6GRLCYFlou8XZNHH85dPGGs3C0n1PvfgmJIJ3ieKLA+qmAKHjZueJxiIzcrFVHF
WcOBO/37dysPti5qZMD4VGrbOU+AmbS5x4+BcBUdravY6rnXQSJEFmW+rbSD+w5c
jIaUCSl82EWjnm5H0RK0S/4Gwr60YoEcFxtfDg8vxoyU/hqKJnz2IQ48YiQ+KY3K
fZAOEa1GZwIr8eVdZlxgCFqXTKy6clASALfPbu2Q0wsjVEsMQjKhEmlJiIicCXeM
4piT9wieXalPxkGbPRxnIrKztz+MM6H87/sMhI5tKO2XfdXkBc9sTlPzZNnzAi72
JsOYwypGtmAhq9Y0cT3+iDAYai79dMHYsUWxtb0CyY18zGRUEbCj2flEB/GQs3ne
FlOCUofOVO8cMXpl+6w/ylkUnvmORJbOOCS73SpOs7vE8Ar2H46HyAJeiP9Y1hsc
bIWJYjgjVhQ5m/BJFOEGXEW2TLFUmhCkcz5z/4bNlWa6rJhGXDA2jwZQtQ6Jzipn
lHKLOgaAlvc1ML2QcXCkyQkSmHtRk21EVS/S3QHNQ5Vn4EFpYIabnVUTjVB+s8pe
aICljkSOTte3m5tzE59b
=7yfy
-----END PGP SIGNATURE-----

--Sig_/mhq40439hrA/4AzuBwz+mb3--
