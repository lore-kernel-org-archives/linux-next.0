From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Tue, 21 Apr 2015 11:54:09 +1000
Message-ID: <20150421115409.73e6a066@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/K4SXYqFUGtA3/ZntT15ZDZZ"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60534 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752676AbbDUByP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Apr 2015 21:54:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Dave Airlie <airlied@redhat.com>, Boris Brezillion <boris.brezillon@free-electrons.com>, Hyun Kwon <hyun.kwon@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--Sig_/K4SXYqFUGtA3/ZntT15ZDZZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in
include/uapi/linux/media-bus-format.h between various commits from
Linus' tree and various commits from the v4l-dvb tree.

I reported this previously against the drm tree but some fo the numbers
have changed.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/uapi/linux/media-bus-format.h
index 73c78f18a328,d391893064a0..000000000000
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@@ -45,18 -43,14 +45,20 @@@
  #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
  #define MEDIA_BUS_FMT_RGB565_2X8_LE		0x1008
  #define MEDIA_BUS_FMT_RGB666_1X18		0x1009
 +#define MEDIA_BUS_FMT_RGB666_1X24_CPADHI	0x1015
 +#define MEDIA_BUS_FMT_RGB666_1X7X3_SPWG		0x1010
 +#define MEDIA_BUS_FMT_BGR888_1X24		0x1013
 +#define MEDIA_BUS_FMT_GBR888_1X24		0x1014
+ #define MEDIA_BUS_FMT_RBG888_1X24		0x100e
  #define MEDIA_BUS_FMT_RGB888_1X24		0x100a
  #define MEDIA_BUS_FMT_RGB888_2X12_BE		0x100b
  #define MEDIA_BUS_FMT_RGB888_2X12_LE		0x100c
 +#define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
 +#define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
  #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
+ #define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
 =20
 -/* YUV (including grey) - next is	0x2025 */
 +/* YUV (including grey) - next is	0x2026 */
  #define MEDIA_BUS_FMT_Y8_1X8			0x2001
  #define MEDIA_BUS_FMT_UV8_1X8			0x2015
  #define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
@@@ -82,13 -80,7 +88,14 @@@
  #define MEDIA_BUS_FMT_VYUY10_1X20		0x201b
  #define MEDIA_BUS_FMT_YUYV10_1X20		0x200d
  #define MEDIA_BUS_FMT_YVYU10_1X20		0x200e
 +#define MEDIA_BUS_FMT_YUV8_1X24			0x2025
 +#define MEDIA_BUS_FMT_YUV10_1X30		0x2016
 +#define MEDIA_BUS_FMT_AYUV8_1X32		0x2017
 +#define MEDIA_BUS_FMT_UYVY12_2X12		0x201c
 +#define MEDIA_BUS_FMT_VYUY12_2X12		0x201d
 +#define MEDIA_BUS_FMT_YUYV12_2X12		0x201e
 +#define MEDIA_BUS_FMT_YVYU12_2X12		0x201f
+ #define MEDIA_BUS_FMT_VUY8_1X24			0x2024
  #define MEDIA_BUS_FMT_UYVY12_1X24		0x2020
  #define MEDIA_BUS_FMT_VYUY12_1X24		0x2021
  #define MEDIA_BUS_FMT_YUYV12_1X24		0x2022

--Sig_/K4SXYqFUGtA3/ZntT15ZDZZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVNa3FAAoJEMDTa8Ir7ZwVgdcQAJOBjsm4DJJfzJicChTIf+Ca
D6zln84R/OKbtmUuw7c8zfjXJ/JWAULbQGPhB9AA9uxfoqSHPMMChQPfxiHvb22B
UZa/IUV4pDgqw0dRSBa/tK8IzV3W4AJbxXGcs5RdTMQs0Nuh5FOuw9gOr1Q4wpRO
QukvCoQ08zw+roTW1b1ep97GI3FLNRhYQFcjkx/nGNCT92Ai/AY80e9T4b6lI45Q
lJx9uelOsfYLSBT2xl4cG9Nqn5jLoUaBKu4sYBDZFR6oSOstCiWwlkH26GJZU5s6
wVduY+GjGmVzcDfVDKnYWOPPe25PvQ/bZc0dcYF1cUGnIQMdtWFXOBamPv12MLWz
Rec08oFBKcumwk9HkHEppnuToQspgTFK5/N9u1k2TFl7KXsgzLlVB1bM/TUFJqEA
AapzVXuihhejN0scym/mmCy/PUFlhhNsTCdb4kojt/FJzCmz0ojogOdL1DGSEAVH
20V9O31qlWygBTzK/7euSylHB/8yRL0Z6C1OERYXBwGW4GGCjkQuAB3qRlLPwuRA
9A6m82mcxSxVduzdNmUNyh7V85qD5fyC1aDdlw8Ka7tP6CBU0I/MpK/xetb5LJpi
E8mqhHWijrJhCGF287aGrmHyOhNEr1LjkIyelL/WXe1ldGOfXgcNDkDk/arFXoVB
ziNLVVRWRWmbRMDiIPKc
=P/8e
-----END PGP SIGNATURE-----

--Sig_/K4SXYqFUGtA3/ZntT15ZDZZ--
