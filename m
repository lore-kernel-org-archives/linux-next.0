From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the jc_docs tree with Linus' tree
Date: Fri, 5 Aug 2016 12:42:13 +1000
Message-ID: <20160805124213.1a1d0931@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33240 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754438AbcHECmQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Aug 2016 22:42:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>

Hi Jon,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/DocBook/Makefile

between commit:

  43f71d93a0cb ("doc-rst: Remove the media docbook")

from Linus' tree and commit:

  bdf107d87eb8 ("DocBook: use DOCBOOKS="" to ignore DocBooks instead of IGNORE_DOCBOOKS=1")

from the jc_docs tree.

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
index c481df33ef21,fb32ab85ea3a..000000000000
--- a/Documentation/DocBook/Makefile
+++ b/Documentation/DocBook/Makefile
@@@ -16,9 -14,19 +14,17 @@@ DOCBOOKS := z8530book.xml device-driver
  	    genericirq.xml s390-drivers.xml uio-howto.xml scsi.xml \
  	    80211.xml debugobjects.xml sh.xml regulator.xml \
  	    alsa-driver-api.xml writing-an-alsa-driver.xml \
 -	    tracepoint.xml gpu.xml media_api.xml w1.xml \
 +	    tracepoint.xml w1.xml \
  	    writing_musb_glue_layer.xml crypto-API.xml iio.xml
  
+ ifeq ($(DOCBOOKS),)
+ 
+ # Skip DocBook build if the user explicitly requested no DOCBOOKS.
+ .DEFAULT:
+ 	@echo "  SKIP    DocBook $@ target (DOCBOOKS=\"\" specified)."
+ 
+ else
+ 
 -include Documentation/DocBook/media/Makefile
 -
  ###
  # The build process is as follows (targets):
  #              (xmldocs) [by docproc]
