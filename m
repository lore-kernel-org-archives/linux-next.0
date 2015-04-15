From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the v4l-dvb tree
Date: Wed, 15 Apr 2015 13:49:08 +1000
Message-ID: <20150415134908.751fd80f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8_9NcHO/zM+b/ov5TOlmfqW"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37322 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932375AbbDODtQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2015 23:49:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillion <boris.brezillon@free-electrons.com>, Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>, Hyun Kwon <hyun.kwon@xilinx.com>

--Sig_/8_9NcHO/zM+b/ov5TOlmfqW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
include/uapi/linux/media-bus-format.h between commits 7b0fd4568bee
("[media] v4l: Add RBG and RGB 8:8:8 media bus formats on 24 and 32 bit
busses"), e8b2d7a565ae ("[media] v4l: Sort YUV formats of
v4l2_mbus_pixelcode") and 2dca0551e4e2 ("[media] v4l: Add VUY8 24 bits
bus format") from the v4l-dvb tree and commits 4b3a81a917a5 ("Add
RGB444_1X12 and RGB565_1X16 media bus formats"), b295c22978b8 ("Add
LVDS RGB media bus formats"), 08c38458be7e ("Add BGR888_1X24 and
GBR888_1X24 media bus formats") and 203508ef52e3 ("Add
RGB666_1X24_CPADHI media bus format") from the drm tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

(what a mess :-()
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/uapi/linux/media-bus-format.h
index d391893064a0,83ea46f4be51..000000000000
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@@ -43,12 -45,16 +45,18 @@@
  #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
  #define MEDIA_BUS_FMT_RGB565_2X8_LE		0x1008
  #define MEDIA_BUS_FMT_RGB666_1X18		0x1009
 +#define MEDIA_BUS_FMT_RBG888_1X24		0x100e
+ #define MEDIA_BUS_FMT_RGB666_1X24_CPADHI	0x1015
+ #define MEDIA_BUS_FMT_RGB666_1X7X3_SPWG		0x1010
+ #define MEDIA_BUS_FMT_BGR888_1X24		0x1013
+ #define MEDIA_BUS_FMT_GBR888_1X24		0x1014
  #define MEDIA_BUS_FMT_RGB888_1X24		0x100a
  #define MEDIA_BUS_FMT_RGB888_2X12_BE		0x100b
  #define MEDIA_BUS_FMT_RGB888_2X12_LE		0x100c
+ #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
+ #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
  #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
 +#define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
 =20
  /* YUV (including grey) - next is	0x2025 */
  #define MEDIA_BUS_FMT_Y8_1X8			0x2001
@@@ -80,7 -82,13 +88,8 @@@
  #define MEDIA_BUS_FMT_VYUY10_1X20		0x201b
  #define MEDIA_BUS_FMT_YUYV10_1X20		0x200d
  #define MEDIA_BUS_FMT_YVYU10_1X20		0x200e
+ #define MEDIA_BUS_FMT_YUV8_1X24			0x2024
 -#define MEDIA_BUS_FMT_YUV10_1X30		0x2016
 -#define MEDIA_BUS_FMT_AYUV8_1X32		0x2017
 -#define MEDIA_BUS_FMT_UYVY12_2X12		0x201c
 -#define MEDIA_BUS_FMT_VYUY12_2X12		0x201d
 -#define MEDIA_BUS_FMT_YUYV12_2X12		0x201e
 -#define MEDIA_BUS_FMT_YVYU12_2X12		0x201f
 +#define MEDIA_BUS_FMT_VUY8_1X24			0x2024
  #define MEDIA_BUS_FMT_UYVY12_1X24		0x2020
  #define MEDIA_BUS_FMT_VYUY12_1X24		0x2021
  #define MEDIA_BUS_FMT_YUYV12_1X24		0x2022

--Sig_/8_9NcHO/zM+b/ov5TOlmfqW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVLd+6AAoJEMDTa8Ir7ZwV1X8P/RUafeuX84WTufiJjG6EOV1g
YJMEYbN6Yq+3lOduNt/5tWLJLBoxPVJvfIxByFywMPQTHxY5ivDTEYEZQ+W2SM9B
8AQCoditE75EivCyU6sbi/wVEh1A3HvC2C+ki7ej1ZIR08J4+yq7BvHELmbeI9n8
QXRhW3GrKpjl+KeyrUAOaI7pkPYv9eMqIwBy732TVtGwBjkVgX9looThG4Tl46KX
R5Fqd7lxfj4u7Kdih1CqB+38dZ9ntIgKgxZgfbOlWLILJDtp53Av61aeST7dz68N
G27f5lWF6FtukeRVGXTOq3XxFgjQ3ufICcJ1M8lq0soTxnRrPF9mIoOZjajTArcp
aRJI6lF6HV/AJeOnc00yM67DV+a05LrGIexQm+uDTuVn+WffLRVKktEX70KLGtlv
s4kVLQckQLxK8LTHH5NWtCTEUneHe9bem5qv4dehfKVcOmiH9Xd5b/dVu5jyNoLj
z0VKTdJT/bGIt18R0tuI4XZLW10A9Rb/+Kc0fEkKv3+EXIVAYZIF9KtQKFhPxQ9a
Pzmj6TWU+ApGMn/VtDgi5E13S02IAe1KXP3VTeuGQqo9xp0hjprF950bNKY6ZUh3
FWpNeC+b3fS46TZi288rxMHYisqtLEDXQnf8lXuI9cpc7bLWyzC3jbqVNhL/0PmP
r9KKmp1MuXm9ZGCCABbk
=GY3H
-----END PGP SIGNATURE-----

--Sig_/8_9NcHO/zM+b/ov5TOlmfqW--
