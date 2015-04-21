From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Tue, 21 Apr 2015 11:50:53 +1000
Message-ID: <20150421115053.13833be2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1gKiC30yIXWKwUxTY+7U5bu"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41041 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751350AbbDUBvC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Apr 2015 21:51:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Dave Airlie <airlied@redhat.com>, Hyun Kwon <hyun.kwon@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Boris Brezillion <boris.brezillon@free-electrons.com>

--Sig_/1gKiC30yIXWKwUxTY+7U5bu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in
Documentation/DocBook/media/v4l/subdev-formats.xml between various
commits from Linus' tree and various commits from the v4l-dvb tree.

I reported this previously against the drm tree, but some of the
numbers have changed now.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/DocBook/media/v4l/subdev-formats.xml
index 553a38024745,bc8d3fb9e4a9..000000000000
--- a/Documentation/DocBook/media/v4l/subdev-formats.xml
+++ b/Documentation/DocBook/media/v4l/subdev-formats.xml
@@@ -482,96 -440,36 +482,126 @@@ see <xref linkend=3D"colorspaces" />.</en
  	      <entry>b<subscript>1</subscript></entry>
  	      <entry>b<subscript>0</subscript></entry>
  	    </row>
 +	    <row id=3D"MEDIA-BUS-FMT-RGB666-1X24_CPADHI">
 +	      <entry>MEDIA_BUS_FMT_RGB666_1X24_CPADHI</entry>
 +	      <entry>0x1015</entry>
 +	      <entry></entry>
 +	      &dash-ent-8;
 +	      <entry>0</entry>
 +	      <entry>0</entry>
 +	      <entry>r<subscript>5</subscript></entry>
 +	      <entry>r<subscript>4</subscript></entry>
 +	      <entry>r<subscript>3</subscript></entry>
 +	      <entry>r<subscript>2</subscript></entry>
 +	      <entry>r<subscript>1</subscript></entry>
 +	      <entry>r<subscript>0</subscript></entry>
 +	      <entry>0</entry>
 +	      <entry>0</entry>
 +	      <entry>g<subscript>5</subscript></entry>
 +	      <entry>g<subscript>4</subscript></entry>
 +	      <entry>g<subscript>3</subscript></entry>
 +	      <entry>g<subscript>2</subscript></entry>
 +	      <entry>g<subscript>1</subscript></entry>
 +	      <entry>g<subscript>0</subscript></entry>
 +	      <entry>0</entry>
 +	      <entry>0</entry>
 +	      <entry>b<subscript>5</subscript></entry>
 +	      <entry>b<subscript>4</subscript></entry>
 +	      <entry>b<subscript>3</subscript></entry>
 +	      <entry>b<subscript>2</subscript></entry>
 +	      <entry>b<subscript>1</subscript></entry>
 +	      <entry>b<subscript>0</subscript></entry>
 +	    </row>
 +	    <row id=3D"MEDIA-BUS-FMT-BGR888-1X24">
 +	      <entry>MEDIA_BUS_FMT_BGR888_1X24</entry>
 +	      <entry>0x1013</entry>
 +	      <entry></entry>
 +	      &dash-ent-8;
 +	      <entry>b<subscript>7</subscript></entry>
 +	      <entry>b<subscript>6</subscript></entry>
 +	      <entry>b<subscript>5</subscript></entry>
 +	      <entry>b<subscript>4</subscript></entry>
 +	      <entry>b<subscript>3</subscript></entry>
 +	      <entry>b<subscript>2</subscript></entry>
 +	      <entry>b<subscript>1</subscript></entry>
 +	      <entry>b<subscript>0</subscript></entry>
 +	      <entry>g<subscript>7</subscript></entry>
 +	      <entry>g<subscript>6</subscript></entry>
 +	      <entry>g<subscript>5</subscript></entry>
 +	      <entry>g<subscript>4</subscript></entry>
 +	      <entry>g<subscript>3</subscript></entry>
 +	      <entry>g<subscript>2</subscript></entry>
 +	      <entry>g<subscript>1</subscript></entry>
 +	      <entry>g<subscript>0</subscript></entry>
 +	      <entry>r<subscript>7</subscript></entry>
 +	      <entry>r<subscript>6</subscript></entry>
 +	      <entry>r<subscript>5</subscript></entry>
 +	      <entry>r<subscript>4</subscript></entry>
 +	      <entry>r<subscript>3</subscript></entry>
 +	      <entry>r<subscript>2</subscript></entry>
 +	      <entry>r<subscript>1</subscript></entry>
 +	      <entry>r<subscript>0</subscript></entry>
 +	    </row>
 +	    <row id=3D"MEDIA-BUS-FMT-GBR888-1X24">
 +	      <entry>MEDIA_BUS_FMT_GBR888_1X24</entry>
 +	      <entry>0x1014</entry>
 +	      <entry></entry>
 +	      &dash-ent-8;
 +	      <entry>g<subscript>7</subscript></entry>
 +	      <entry>g<subscript>6</subscript></entry>
 +	      <entry>g<subscript>5</subscript></entry>
 +	      <entry>g<subscript>4</subscript></entry>
 +	      <entry>g<subscript>3</subscript></entry>
 +	      <entry>g<subscript>2</subscript></entry>
 +	      <entry>g<subscript>1</subscript></entry>
 +	      <entry>g<subscript>0</subscript></entry>
 +	      <entry>b<subscript>7</subscript></entry>
 +	      <entry>b<subscript>6</subscript></entry>
 +	      <entry>b<subscript>5</subscript></entry>
 +	      <entry>b<subscript>4</subscript></entry>
 +	      <entry>b<subscript>3</subscript></entry>
 +	      <entry>b<subscript>2</subscript></entry>
 +	      <entry>b<subscript>1</subscript></entry>
 +	      <entry>b<subscript>0</subscript></entry>
 +	      <entry>r<subscript>7</subscript></entry>
 +	      <entry>r<subscript>6</subscript></entry>
 +	      <entry>r<subscript>5</subscript></entry>
 +	      <entry>r<subscript>4</subscript></entry>
 +	      <entry>r<subscript>3</subscript></entry>
 +	      <entry>r<subscript>2</subscript></entry>
 +	      <entry>r<subscript>1</subscript></entry>
 +	      <entry>r<subscript>0</subscript></entry>
 +	    </row>
+ 	    <row id=3D"MEDIA-BUS-FMT-RBG888-1X24">
+ 	      <entry>MEDIA_BUS_FMT_RBG888_1X24</entry>
+ 	      <entry>0x100e</entry>
+ 	      <entry></entry>
+ 	      &dash-ent-8;
+ 	      <entry>r<subscript>7</subscript></entry>
+ 	      <entry>r<subscript>6</subscript></entry>
+ 	      <entry>r<subscript>5</subscript></entry>
+ 	      <entry>r<subscript>4</subscript></entry>
+ 	      <entry>r<subscript>3</subscript></entry>
+ 	      <entry>r<subscript>2</subscript></entry>
+ 	      <entry>r<subscript>1</subscript></entry>
+ 	      <entry>r<subscript>0</subscript></entry>
+ 	      <entry>b<subscript>7</subscript></entry>
+ 	      <entry>b<subscript>6</subscript></entry>
+ 	      <entry>b<subscript>5</subscript></entry>
+ 	      <entry>b<subscript>4</subscript></entry>
+ 	      <entry>b<subscript>3</subscript></entry>
+ 	      <entry>b<subscript>2</subscript></entry>
+ 	      <entry>b<subscript>1</subscript></entry>
+ 	      <entry>b<subscript>0</subscript></entry>
+ 	      <entry>g<subscript>7</subscript></entry>
+ 	      <entry>g<subscript>6</subscript></entry>
+ 	      <entry>g<subscript>5</subscript></entry>
+ 	      <entry>g<subscript>4</subscript></entry>
+ 	      <entry>g<subscript>3</subscript></entry>
+ 	      <entry>g<subscript>2</subscript></entry>
+ 	      <entry>g<subscript>1</subscript></entry>
+ 	      <entry>g<subscript>0</subscript></entry>
+ 	    </row>
  	    <row id=3D"MEDIA-BUS-FMT-RGB888-1X24">
  	      <entry>MEDIA_BUS_FMT_RGB888_1X24</entry>
  	      <entry>0x100a</entry>
@@@ -3047,92 -2719,33 +3106,92 @@@
  	      <entry>u<subscript>1</subscript></entry>
  	      <entry>u<subscript>0</subscript></entry>
  	    </row>
 +	    <row id=3D"MEDIA-BUS-FMT-YUV8-1X24">
 +	      <entry>MEDIA_BUS_FMT_YUV8_1X24</entry>
 +	      <entry>0x2025</entry>
 +	      <entry></entry>
 +	      <entry>-</entry>
 +	      <entry>-</entry>
 +	      <entry>-</entry>
 +	      <entry>-</entry>
 +	      <entry>-</entry>
 +	      <entry>-</entry>
 +	      <entry>-</entry>
 +	      <entry>-</entry>
 +	      <entry>y<subscript>7</subscript></entry>
 +	      <entry>y<subscript>6</subscript></entry>
 +	      <entry>y<subscript>5</subscript></entry>
 +	      <entry>y<subscript>4</subscript></entry>
 +	      <entry>y<subscript>3</subscript></entry>
 +	      <entry>y<subscript>2</subscript></entry>
 +	      <entry>y<subscript>1</subscript></entry>
 +	      <entry>y<subscript>0</subscript></entry>
 +	      <entry>u<subscript>7</subscript></entry>
 +	      <entry>u<subscript>6</subscript></entry>
 +	      <entry>u<subscript>5</subscript></entry>
 +	      <entry>u<subscript>4</subscript></entry>
 +	      <entry>u<subscript>3</subscript></entry>
 +	      <entry>u<subscript>2</subscript></entry>
 +	      <entry>u<subscript>1</subscript></entry>
 +	      <entry>u<subscript>0</subscript></entry>
 +	      <entry>v<subscript>7</subscript></entry>
 +	      <entry>v<subscript>6</subscript></entry>
 +	      <entry>v<subscript>5</subscript></entry>
 +	      <entry>v<subscript>4</subscript></entry>
 +	      <entry>v<subscript>3</subscript></entry>
 +	      <entry>v<subscript>2</subscript></entry>
 +	      <entry>v<subscript>1</subscript></entry>
 +	      <entry>v<subscript>0</subscript></entry>
 +	    </row>
 +	    <row id=3D"MEDIA-BUS-FMT-YUV10-1X30">
 +	      <entry>MEDIA_BUS_FMT_YUV10_1X30</entry>
 +	      <entry>0x2016</entry>
 +	      <entry></entry>
- 	      <entry>-</entry>
- 	      <entry>-</entry>
- 	      <entry>y<subscript>9</subscript></entry>
- 	      <entry>y<subscript>8</subscript></entry>
++	      &dash-ent-16;
 +	      <entry>y<subscript>7</subscript></entry>
 +	      <entry>y<subscript>6</subscript></entry>
 +	      <entry>y<subscript>5</subscript></entry>
 +	      <entry>y<subscript>4</subscript></entry>
 +	      <entry>y<subscript>3</subscript></entry>
 +	      <entry>y<subscript>2</subscript></entry>
 +	      <entry>y<subscript>1</subscript></entry>
 +	      <entry>y<subscript>0</subscript></entry>
- 	      <entry>u<subscript>9</subscript></entry>
- 	      <entry>u<subscript>8</subscript></entry>
- 	      <entry>u<subscript>7</subscript></entry>
- 	      <entry>u<subscript>6</subscript></entry>
- 	      <entry>u<subscript>5</subscript></entry>
- 	      <entry>u<subscript>4</subscript></entry>
- 	      <entry>u<subscript>3</subscript></entry>
- 	      <entry>u<subscript>2</subscript></entry>
- 	      <entry>u<subscript>1</subscript></entry>
- 	      <entry>u<subscript>0</subscript></entry>
- 	      <entry>v<subscript>9</subscript></entry>
- 	      <entry>v<subscript>8</subscript></entry>
- 	      <entry>v<subscript>7</subscript></entry>
- 	      <entry>v<subscript>6</subscript></entry>
- 	      <entry>v<subscript>5</subscript></entry>
- 	      <entry>v<subscript>4</subscript></entry>
- 	      <entry>v<subscript>3</subscript></entry>
- 	      <entry>v<subscript>2</subscript></entry>
- 	      <entry>v<subscript>1</subscript></entry>
- 	      <entry>v<subscript>0</subscript></entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
 +	    </row>
- 	    <row id=3D"MEDIA-BUS-FMT-AYUV8-1X32">
- 	      <entry>MEDIA_BUS_FMT_AYUV8_1X32</entry>
- 	      <entry>0x2017</entry>
+ 	    <row id=3D"MEDIA-BUS-FMT-YDYUYDYV8-1X16">
+ 	      <entry>MEDIA_BUS_FMT_YDYUYDYV8_1X16</entry>
+ 	      <entry>0x2014</entry>
  	      <entry></entry>
- 	      <entry>a<subscript>7</subscript></entry>
- 	      <entry>a<subscript>6</subscript></entry>
- 	      <entry>a<subscript>5</subscript></entry>
- 	      <entry>a<subscript>4</subscript></entry>
- 	      <entry>a<subscript>3</subscript></entry>
- 	      <entry>a<subscript>2</subscript></entry>
- 	      <entry>a<subscript>1</subscript></entry>
- 	      <entry>a<subscript>0</subscript></entry>
+ 	      &dash-ent-16;
+ 	      <entry>y<subscript>7</subscript></entry>
+ 	      <entry>y<subscript>6</subscript></entry>
+ 	      <entry>y<subscript>5</subscript></entry>
+ 	      <entry>y<subscript>4</subscript></entry>
+ 	      <entry>y<subscript>3</subscript></entry>
+ 	      <entry>y<subscript>2</subscript></entry>
+ 	      <entry>y<subscript>1</subscript></entry>
+ 	      <entry>y<subscript>0</subscript></entry>
+ 	      <entry>d</entry>
+ 	      <entry>d</entry>
+ 	      <entry>d</entry>
+ 	      <entry>d</entry>
+ 	      <entry>d</entry>
+ 	      <entry>d</entry>
+ 	      <entry>d</entry>
+ 	      <entry>d</entry>
+ 	    </row>
+ 	    <row>
+ 	      <entry></entry>
+ 	      <entry></entry>
+ 	      <entry></entry>
+ 	      &dash-ent-16;
  	      <entry>y<subscript>7</subscript></entry>
  	      <entry>y<subscript>6</subscript></entry>
  	      <entry>y<subscript>5</subscript></entry>

--Sig_/1gKiC30yIXWKwUxTY+7U5bu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVNa0CAAoJEMDTa8Ir7ZwVM3EP/0OkmlH4BDblyHGa+g1iqVTK
kqs4RRWhtfGphZxY/6ACk5PN/cuDChVvebsB0AhzMic1d0thm3Mtdk0B6Mk0O5CA
earHBAv8tFZsGXpWNup62fGfbl+okOQEt9JKRCWw3IYDJN+PPju83rsYDkBhppR5
fDv880pGPlCu4AwZVZGAtTKp2n0e6ymKQm2d1Gcw+NMk4IFzec5DSOcmfoKvM625
nQisrpr+GYjstFiFOHboxRILEtlCfWAPwmruH/9lEkvly9Il9Vu0Kkgsv/fFR/rC
2R0HPQowivRoYqd4u309TaIokvQoIkYnFL0GgSSstRTqzjLCxFqdfiZC2Q8VSGYZ
h7w/mynLekE8kFPFbWz0dVmxWDM1DtOPVbZth0YH3c595/vxVo6kOekaeGxV1EKq
Ce6RWhZh4A6FDZCSv+qt8H1PSdFxHRlNpQ9lByuT9dZijMLxCtQJzwwsRBkIilSZ
H9IZ9PjyRalvIXHiekrAqmUWdS3G1FdXC/Sk2uRY3v9NuWmB85VxmWVT47w3oRjA
7D8OBn/YqWpoYhtjpb0QR/bhwovJo5JrJPaqDq3L2s21wHQnY6ItxbCYDO6NjSak
mgNgpDGC//VKsfy92kjMfva6tQb2+I0kkhRj3I8Q7uTbeE+64idxatO4gV9RcMnQ
RqttTESQAPyE5KqXQh52
=/1zA
-----END PGP SIGNATURE-----

--Sig_/1gKiC30yIXWKwUxTY+7U5bu--
