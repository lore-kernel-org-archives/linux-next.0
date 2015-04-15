From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the v4l-dvb tree
Date: Wed, 15 Apr 2015 13:33:09 +1000
Message-ID: <20150415133309.24f0a36a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ORaam17kOxWX4CR4HgOp78f"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hyun Kwon <hyun.kwon@xilinx.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ORaam17kOxWX4CR4HgOp78f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
Documentation/DocBook/media/v4l/subdev-formats.xml between commit
7b0fd4568bee ("[media] v4l: Add RBG and RGB 8:8:8 media bus formats on
24 and 32 bit busses") and e8b2d7a565ae ("[media] v4l: Sort YUV formats
of v4l2_mbus_pixelcode") from the v4l-dvb tree and commits 08c38458be7e
("Add BGR888_1X24 and GBR888_1X24 media bus formats"), 0fc63eb104d7
("Add YUV8_1X24 media bus format") and 203508ef52e3 ("Add
RGB666_1X24_CPADHI media bus format") from the drm tree.

I fixed it up (almost certainly incorrectly - see below) and can carry
the fix as necessary.  Please sort out who "owns" this file and try to
coordinate updates to it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/DocBook/media/v4l/subdev-formats.xml
index bc8d3fb9e4a9,18b71aff48c9..000000000000
--- a/Documentation/DocBook/media/v4l/subdev-formats.xml
+++ b/Documentation/DocBook/media/v4l/subdev-formats.xml
@@@ -440,36 -482,96 +482,126 @@@ see <xref linkend=3D"colorspaces" />.</en
  	      <entry>b<subscript>1</subscript></entry>
  	      <entry>b<subscript>0</subscript></entry>
  	    </row>
 +	    <row id=3D"MEDIA-BUS-FMT-RBG888-1X24">
 +	      <entry>MEDIA_BUS_FMT_RBG888_1X24</entry>
 +	      <entry>0x100e</entry>
 +	      <entry></entry>
 +	      &dash-ent-8;
 +	      <entry>r<subscript>7</subscript></entry>
 +	      <entry>r<subscript>6</subscript></entry>
 +	      <entry>r<subscript>5</subscript></entry>
 +	      <entry>r<subscript>4</subscript></entry>
 +	      <entry>r<subscript>3</subscript></entry>
 +	      <entry>r<subscript>2</subscript></entry>
 +	      <entry>r<subscript>1</subscript></entry>
 +	      <entry>r<subscript>0</subscript></entry>
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
 +	    </row>
+ 	    <row id=3D"MEDIA-BUS-FMT-RGB666-1X24_CPADHI">
+ 	      <entry>MEDIA_BUS_FMT_RGB666_1X24_CPADHI</entry>
+ 	      <entry>0x1015</entry>
+ 	      <entry></entry>
+ 	      &dash-ent-8;
+ 	      <entry>0</entry>
+ 	      <entry>0</entry>
+ 	      <entry>r<subscript>5</subscript></entry>
+ 	      <entry>r<subscript>4</subscript></entry>
+ 	      <entry>r<subscript>3</subscript></entry>
+ 	      <entry>r<subscript>2</subscript></entry>
+ 	      <entry>r<subscript>1</subscript></entry>
+ 	      <entry>r<subscript>0</subscript></entry>
+ 	      <entry>0</entry>
+ 	      <entry>0</entry>
+ 	      <entry>g<subscript>5</subscript></entry>
+ 	      <entry>g<subscript>4</subscript></entry>
+ 	      <entry>g<subscript>3</subscript></entry>
+ 	      <entry>g<subscript>2</subscript></entry>
+ 	      <entry>g<subscript>1</subscript></entry>
+ 	      <entry>g<subscript>0</subscript></entry>
+ 	      <entry>0</entry>
+ 	      <entry>0</entry>
+ 	      <entry>b<subscript>5</subscript></entry>
+ 	      <entry>b<subscript>4</subscript></entry>
+ 	      <entry>b<subscript>3</subscript></entry>
+ 	      <entry>b<subscript>2</subscript></entry>
+ 	      <entry>b<subscript>1</subscript></entry>
+ 	      <entry>b<subscript>0</subscript></entry>
+ 	    </row>
+ 	    <row id=3D"MEDIA-BUS-FMT-BGR888-1X24">
+ 	      <entry>MEDIA_BUS_FMT_BGR888_1X24</entry>
+ 	      <entry>0x1013</entry>
+ 	      <entry></entry>
+ 	      &dash-ent-8;
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
+ 	      <entry>r<subscript>7</subscript></entry>
+ 	      <entry>r<subscript>6</subscript></entry>
+ 	      <entry>r<subscript>5</subscript></entry>
+ 	      <entry>r<subscript>4</subscript></entry>
+ 	      <entry>r<subscript>3</subscript></entry>
+ 	      <entry>r<subscript>2</subscript></entry>
+ 	      <entry>r<subscript>1</subscript></entry>
+ 	      <entry>r<subscript>0</subscript></entry>
+ 	    </row>
+ 	    <row id=3D"MEDIA-BUS-FMT-GBR888-1X24">
+ 	      <entry>MEDIA_BUS_FMT_GBR888_1X24</entry>
+ 	      <entry>0x1014</entry>
+ 	      <entry></entry>
+ 	      &dash-ent-8;
+ 	      <entry>g<subscript>7</subscript></entry>
+ 	      <entry>g<subscript>6</subscript></entry>
+ 	      <entry>g<subscript>5</subscript></entry>
+ 	      <entry>g<subscript>4</subscript></entry>
+ 	      <entry>g<subscript>3</subscript></entry>
+ 	      <entry>g<subscript>2</subscript></entry>
+ 	      <entry>g<subscript>1</subscript></entry>
+ 	      <entry>g<subscript>0</subscript></entry>
+ 	      <entry>b<subscript>7</subscript></entry>
+ 	      <entry>b<subscript>6</subscript></entry>
+ 	      <entry>b<subscript>5</subscript></entry>
+ 	      <entry>b<subscript>4</subscript></entry>
+ 	      <entry>b<subscript>3</subscript></entry>
+ 	      <entry>b<subscript>2</subscript></entry>
+ 	      <entry>b<subscript>1</subscript></entry>
+ 	      <entry>b<subscript>0</subscript></entry>
+ 	      <entry>r<subscript>7</subscript></entry>
+ 	      <entry>r<subscript>6</subscript></entry>
+ 	      <entry>r<subscript>5</subscript></entry>
+ 	      <entry>r<subscript>4</subscript></entry>
+ 	      <entry>r<subscript>3</subscript></entry>
+ 	      <entry>r<subscript>2</subscript></entry>
+ 	      <entry>r<subscript>1</subscript></entry>
+ 	      <entry>r<subscript>0</subscript></entry>
+ 	    </row>
  	    <row id=3D"MEDIA-BUS-FMT-RGB888-1X24">
  	      <entry>MEDIA_BUS_FMT_RGB888_1X24</entry>
  	      <entry>0x100a</entry>
@@@ -2719,33 -3047,92 +3106,92 @@@
  	      <entry>u<subscript>1</subscript></entry>
  	      <entry>u<subscript>0</subscript></entry>
  	    </row>
 +	    <row id=3D"MEDIA-BUS-FMT-YDYUYDYV8-1X16">
 +	      <entry>MEDIA_BUS_FMT_YDYUYDYV8_1X16</entry>
 +	      <entry>0x2014</entry>
 +	      <entry></entry>
 +	      &dash-ent-16;
 +	      <entry>y<subscript>7</subscript></entry>
 +	      <entry>y<subscript>6</subscript></entry>
 +	      <entry>y<subscript>5</subscript></entry>
 +	      <entry>y<subscript>4</subscript></entry>
 +	      <entry>y<subscript>3</subscript></entry>
 +	      <entry>y<subscript>2</subscript></entry>
 +	      <entry>y<subscript>1</subscript></entry>
 +	      <entry>y<subscript>0</subscript></entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
++	      <entry>d</entry>
++	    </row>
+ 	    <row id=3D"MEDIA-BUS-FMT-YUV8-1X24">
+ 	      <entry>MEDIA_BUS_FMT_YUV8_1X24</entry>
+ 	      <entry>0x2024</entry>
+ 	      <entry></entry>
+ 	      <entry>-</entry>
+ 	      <entry>-</entry>
+ 	      <entry>-</entry>
+ 	      <entry>-</entry>
+ 	      <entry>-</entry>
+ 	      <entry>-</entry>
+ 	      <entry>-</entry>
+ 	      <entry>-</entry>
+ 	      <entry>y<subscript>7</subscript></entry>
+ 	      <entry>y<subscript>6</subscript></entry>
+ 	      <entry>y<subscript>5</subscript></entry>
+ 	      <entry>y<subscript>4</subscript></entry>
+ 	      <entry>y<subscript>3</subscript></entry>
+ 	      <entry>y<subscript>2</subscript></entry>
+ 	      <entry>y<subscript>1</subscript></entry>
+ 	      <entry>y<subscript>0</subscript></entry>
+ 	      <entry>u<subscript>7</subscript></entry>
+ 	      <entry>u<subscript>6</subscript></entry>
+ 	      <entry>u<subscript>5</subscript></entry>
+ 	      <entry>u<subscript>4</subscript></entry>
+ 	      <entry>u<subscript>3</subscript></entry>
+ 	      <entry>u<subscript>2</subscript></entry>
+ 	      <entry>u<subscript>1</subscript></entry>
+ 	      <entry>u<subscript>0</subscript></entry>
+ 	      <entry>v<subscript>7</subscript></entry>
+ 	      <entry>v<subscript>6</subscript></entry>
+ 	      <entry>v<subscript>5</subscript></entry>
+ 	      <entry>v<subscript>4</subscript></entry>
+ 	      <entry>v<subscript>3</subscript></entry>
+ 	      <entry>v<subscript>2</subscript></entry>
+ 	      <entry>v<subscript>1</subscript></entry>
+ 	      <entry>v<subscript>0</subscript></entry>
+ 	    </row>
+ 	    <row id=3D"MEDIA-BUS-FMT-YUV10-1X30">
+ 	      <entry>MEDIA_BUS_FMT_YUV10_1X30</entry>
+ 	      <entry>0x2016</entry>
+ 	      <entry></entry>
 -	      <entry>-</entry>
 -	      <entry>-</entry>
 -	      <entry>y<subscript>9</subscript></entry>
 -	      <entry>y<subscript>8</subscript></entry>
++	      &dash-ent-16;
+ 	      <entry>y<subscript>7</subscript></entry>
+ 	      <entry>y<subscript>6</subscript></entry>
+ 	      <entry>y<subscript>5</subscript></entry>
+ 	      <entry>y<subscript>4</subscript></entry>
+ 	      <entry>y<subscript>3</subscript></entry>
+ 	      <entry>y<subscript>2</subscript></entry>
+ 	      <entry>y<subscript>1</subscript></entry>
+ 	      <entry>y<subscript>0</subscript></entry>
 -	      <entry>u<subscript>9</subscript></entry>
 -	      <entry>u<subscript>8</subscript></entry>
 -	      <entry>u<subscript>7</subscript></entry>
 -	      <entry>u<subscript>6</subscript></entry>
 -	      <entry>u<subscript>5</subscript></entry>
 -	      <entry>u<subscript>4</subscript></entry>
 -	      <entry>u<subscript>3</subscript></entry>
 -	      <entry>u<subscript>2</subscript></entry>
 -	      <entry>u<subscript>1</subscript></entry>
 -	      <entry>u<subscript>0</subscript></entry>
 -	      <entry>v<subscript>9</subscript></entry>
 -	      <entry>v<subscript>8</subscript></entry>
 -	      <entry>v<subscript>7</subscript></entry>
 -	      <entry>v<subscript>6</subscript></entry>
 -	      <entry>v<subscript>5</subscript></entry>
 -	      <entry>v<subscript>4</subscript></entry>
 -	      <entry>v<subscript>3</subscript></entry>
 -	      <entry>v<subscript>2</subscript></entry>
 -	      <entry>v<subscript>1</subscript></entry>
 -	      <entry>v<subscript>0</subscript></entry>
 +	      <entry>d</entry>
 +	      <entry>d</entry>
 +	      <entry>d</entry>
 +	      <entry>d</entry>
 +	      <entry>d</entry>
 +	      <entry>d</entry>
 +	      <entry>d</entry>
 +	      <entry>d</entry>
  	    </row>
 -	    <row id=3D"MEDIA-BUS-FMT-AYUV8-1X32">
 -	      <entry>MEDIA_BUS_FMT_AYUV8_1X32</entry>
 -	      <entry>0x2017</entry>
 +	    <row>
  	      <entry></entry>
 -	      <entry>a<subscript>7</subscript></entry>
 -	      <entry>a<subscript>6</subscript></entry>
 -	      <entry>a<subscript>5</subscript></entry>
 -	      <entry>a<subscript>4</subscript></entry>
 -	      <entry>a<subscript>3</subscript></entry>
 -	      <entry>a<subscript>2</subscript></entry>
 -	      <entry>a<subscript>1</subscript></entry>
 -	      <entry>a<subscript>0</subscript></entry>
 +	      <entry></entry>
 +	      <entry></entry>
 +	      &dash-ent-16;
  	      <entry>y<subscript>7</subscript></entry>
  	      <entry>y<subscript>6</subscript></entry>
  	      <entry>y<subscript>5</subscript></entry>

--Sig_/ORaam17kOxWX4CR4HgOp78f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVLdv6AAoJEMDTa8Ir7ZwVNxsP/0AbG6Nq+WbfP5So7spK9UjJ
CqAZbeHIP4HC8PzSd+sdq4mNXCciGY+Yo3vWCDNOmS/bU8OdIBUdIJQqR3oYnvDI
LaQ1aFqDpTc15iXG5QlqX5wkBk+u6RN277tsSO0Pbyee4BQXOAYbw8yNRCENrNTA
bYjeMVB/63jlsvYdss5hHfRELZKKUbqAkUrlJwbVGQHRknCyhOdlZ2R77diKowVQ
sbhjhJQwVWLyRcM+ywjxjPpZkyN2I7j4r8dXISxwfbKwx4BDV2FxBoZUPsE4Nl3K
pldKejuU61Um4XR2SbxK2LetYCJBxrC6L8OsE5avQTsH38oSnSCiPWcfIc4yN0ri
QxlzHP+WIImRi0z+GVfUyGL71fVVbm2NKbAV4OVeHhVtD6lV+61pP0FenZvNbdXV
tjKo3v2TfSQ1/6RGTr3so+G7XV0XgtmpX1aUvreFAEa47swVlMjp/C3RAQUvmo6P
aGj8BcPUI2uErSXDvgnhAkC7gUCclMJWw3uZ/SdCYQg7j0l2JmHO3K5DO7JWgjmn
otELCe3mp3pdtQRJPCcLVsTo+eshvkRUprntAkutSqTAraCO5E6e9/yAXJdprhil
MxAo2KSwvK1hVN1TpcX0as8wPfVNYtDj535gqR8Azx6zOQM6zoCNTNDjF7skeHAJ
ldW0YbAv5weKh+Nfx4rB
=+joM
-----END PGP SIGNATURE-----

--Sig_/ORaam17kOxWX4CR4HgOp78f--
