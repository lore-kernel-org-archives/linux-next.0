From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Thu, 4 Aug 2016 11:02:26 +1000
Message-ID: <20160804110226.46d29e94@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35894 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751351AbcHDBC3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Aug 2016 21:02:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  Documentation/DocBook/Makefile

between commit:

  88e196b337d6 ("Documentation/DocBook: remove gpu.tmpl")

from Linus' tree and commit:

  43f71d93a0cb ("doc-rst: Remove the media docbook")

from the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/DocBook/Makefile
index 8e6dd4b14314,2bfd664b5e35..000000000000
--- a/Documentation/DocBook/Makefile
+++ b/Documentation/DocBook/Makefile
@@@ -16,11 -16,9 +16,9 @@@ DOCBOOKS := z8530book.xml device-driver
  	    genericirq.xml s390-drivers.xml uio-howto.xml scsi.xml \
  	    80211.xml debugobjects.xml sh.xml regulator.xml \
  	    alsa-driver-api.xml writing-an-alsa-driver.xml \
- 	    tracepoint.xml media_api.xml w1.xml \
 -	    tracepoint.xml gpu.xml w1.xml \
++	    tracepoint.xml w1.xml \
  	    writing_musb_glue_layer.xml crypto-API.xml iio.xml
  
- include Documentation/DocBook/media/Makefile
- 
  ###
  # The build process is as follows (targets):
  #              (xmldocs) [by docproc]
