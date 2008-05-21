From: Hans-Joachim Picht <hans@linux.vnet.ibm.com>
Subject: [PATCH] fix I/O memory related compile caused by wrong Kconfig
	dependencies
Date: Wed, 21 May 2008 18:05:23 +0200
Message-ID: <20080521160523.GA1351@blc4eb509856389.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate6.de.ibm.com ([195.212.29.155]:58059 "EHLO
	mtagate6.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759164AbYEUQGL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 May 2008 12:06:11 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate6.de.ibm.com (8.13.8/8.13.8) with ESMTP id m4LG5XXT572938
	for <linux-next@vger.kernel.org>; Wed, 21 May 2008 16:05:33 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id m4LG5WU83616822
	for <linux-next@vger.kernel.org>; Wed, 21 May 2008 18:05:32 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m4LG5WUW004598
	for <linux-next@vger.kernel.org>; Wed, 21 May 2008 18:05:32 +0200
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, Takashi Iwai <tiwai@suse.de>

On s390 linux-next fails with the following build error:

sound/core/memory.c: In function 'copy_to_user_fromio':
sound/core/memory.c:47: error: implicit declaration of function 'memcpy_fromio'
sound/core/memory.c: In function 'copy_from_user_toio':
sound/core/memory.c:82: error: implicit declaration of function 'memcpy_toio'

The problem was introduced with the following commit 
6a5751b42420dce9267d7d915eed8f8673d16fdd ("sound: Convert to menuconfig")
from Takashi's sound-2.6 tree.

Add "depends on HAS_IOMEM" to this menu to make the sound drivers
disappear for s390 which does not have I/O memory.

Signed-off-by: Hans-Joachim Picht <hans@linux.vnet.ibm.com>


diff --git a/sound/Kconfig b/sound/Kconfig
index b625855..51e7f7a 100644
--- a/sound/Kconfig
+++ b/sound/Kconfig
@@ -1,6 +1,8 @@
 # sound/Config.in
 #

+if HAS_IOMEM
+
 menuconfig SOUND
        tristate "Sound card support"
        help
@@ -99,3 +101,5 @@ config AC97_BUS
          should "select" this.

 endif # SOUND
+
+endif # HAS_IOMEM


