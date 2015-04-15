From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: linux-next: manual merge of the drm tree with the v4l-dvb tree
Date: Wed, 15 Apr 2015 11:09:02 +0200
Message-ID: <1429088942.3480.6.camel@pengutronix.de>
References: <20150415133309.24f0a36a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:35701 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751876AbbDOJJJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2015 05:09:09 -0400
In-Reply-To: <20150415133309.24f0a36a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>, Hyun Kwon <hyun.kwon@xilinx.com>

Am Mittwoch, den 15.04.2015, 13:33 +1000 schrieb Stephen Rothwell:
> Hi Dave,
> 
> Today's linux-next merge of the drm tree got a conflict in
> Documentation/DocBook/media/v4l/subdev-formats.xml between commit
> 7b0fd4568bee ("[media] v4l: Add RBG and RGB 8:8:8 media bus formats on
> 24 and 32 bit busses") and e8b2d7a565ae ("[media] v4l: Sort YUV formats
> of v4l2_mbus_pixelcode") from the v4l-dvb tree and commits 08c38458be7e
> ("Add BGR888_1X24 and GBR888_1X24 media bus formats"), 0fc63eb104d7
> ("Add YUV8_1X24 media bus format") and 203508ef52e3 ("Add
> RGB666_1X24_CPADHI media bus format") from the drm tree.
> 
> I fixed it up (almost certainly incorrectly - see below) and can carry
> the fix as necessary.  Please sort out who "owns" this file and try to
> coordinate updates to it.

Together with the corresponding fixup for include/uapi/linux/media-bus-format.h,
how about this:

-----8<-----
diff --git a/Documentation/DocBook/media/v4l/subdev-formats.xml b/Documentation/DocBook/media/v4l/subdev-formats.xml
index 0881d55..1af86c1 100644
--- a/Documentation/DocBook/media/v4l/subdev-formats.xml
+++ b/Documentation/DocBook/media/v4l/subdev-formats.xml
@@ -484,7 +484,7 @@ see <xref linkend="colorspaces" />.</entry>
 	    </row>
 	    <row id="MEDIA-BUS-FMT-RBG888-1X24">
 	      <entry>MEDIA_BUS_FMT_RBG888_1X24</entry>
-	      <entry>0x100e</entry>
+	      <entry>0x1016</entry>
 	      <entry></entry>
 	      &dash-ent-8;
 	      <entry>r<subscript>7</subscript></entry>
@@ -743,7 +743,7 @@ see <xref linkend="colorspaces" />.</entry>
 	    </row>
 	    <row id="MEDIA-BUS-FMT-RGB888-1X32-PADHI">
 	      <entry>MEDIA_BUS_FMT_RGB888_1X32_PADHI</entry>
-	      <entry>0x100f</entry>
+	      <entry>0x1017</entry>
 	      <entry></entry>
 	      <entry>0</entry>
 	      <entry>0</entry>
@@ -3463,7 +3463,7 @@ see <xref linkend="colorspaces" />.</entry>
 	    </row>
 	    <row id="MEDIA-BUS-FMT-VUY8-1X24">
 	      <entry>MEDIA_BUS_FMT_VUY8_1X24</entry>
-	      <entry>0x201a</entry>
+	      <entry>0x2025</entry>
 	      <entry></entry>
 	      &dash-ent-8;
 	      <entry>v<subscript>7</subscript></entry>
-- 
2.1.4
----->8-----

regards
Philipp
