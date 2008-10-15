From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Wed, 15 Oct 2008 15:14:21 +1100
Message-ID: <20081015151421.5c4c4ed8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58033 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750973AbYJOFL7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 01:11:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>, Harald Welte <laforge@gnumonks.org>

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in MAINTAINERS
between commit 4fa971811cda4036d84574bfb38bd9b22b5c35ec ("MN10300: MEI
are renaming themselves to Panasonic") from Linus' tree and commit
709ee531c153038d81b30649b9eeed3c44a4d5cc ("panasonic-laptop: add
Panasonic Let's Note laptop extras driver v0.94") from the acpi tree.

Just overlapping addition/move.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc MAINTAINERS
index 5d0b8a2,f9f6d4b..0000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -3161,15 -3153,11 +3167,20 @@@ M:	olof@lixom.ne
  L:	i2c@lm-sensors.org
  S:	Maintained
  
+ PANASONIC LAPTOP ACPI EXTRAS DRIVER
+ P:	Harald Welte
+ M:	laforge@gnumonks.org
+ S:	Maintained
+ 
 +PANASONIC MN10300/AM33 PORT
 +P:	David Howells
 +M:	dhowells@redhat.com
 +P:	Koichi Yasutake
 +M:	yasutake.koichi@jp.panasonic.com
 +L:	linux-am33-list@redhat.com (moderated for non-subscribers)
 +W:	ftp://ftp.redhat.com/pub/redhat/gnupro/AM33/
 +S:	Maintained
 +
  PARALLEL PORT SUPPORT
  L:	linux-parport@lists.infradead.org (subscribers-only)
  S:	Orphan
