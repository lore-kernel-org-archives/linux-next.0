From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging-next tree with the v4l-dvb
 tree
Date: Wed, 28 Jul 2010 15:27:36 +1000
Message-ID: <20100728152736.bcaa5d59.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43886 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751297Ab0G1F1j (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Jul 2010 01:27:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jarod Wilson <jarod@redhat.com>, Mauro Carvalho Chehab <mchehab@redhat.com>

Hi Greg,

Today's linux-next merge of the staging-next tree got a conflict in
drivers/staging/Kconfig between commit
44d349d2b19019e0b5912bc4e6c8531e50b394aa ("V4L/DVB: staging/lirc: wire up
Kconfig and Makefile bits") from the v4l-dvb tree and several commits
from the staging-next tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/Kconfig
index 0e4122e,6796265..0000000
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@@ -145,7 -149,13 +147,15 @@@ source "drivers/staging/mrst-touchscree
  
  source "drivers/staging/msm/Kconfig"
  
 +source "drivers/staging/lirc/Kconfig"
 +
+ source "drivers/staging/easycap/Kconfig"
+ 
+ source "drivers/staging/solo6x10/Kconfig"
+ 
+ source "drivers/staging/tidspbridge/Kconfig"
+ 
+ source "drivers/staging/quickstart/Kconfig"
+ 
  endif # !STAGING_EXCLUDE_BUILD
  endif # STAGING
