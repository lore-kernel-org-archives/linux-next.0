From: mkrufky@linuxtv.org
Subject: Re: linux-next: Tree for July 14
Date: Mon, 14 Jul 2008 11:06:15 -0400
Message-ID: <487B6B67.9030804@linuxtv.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.hauppauge.com ([167.206.143.4]:3403 "EHLO
	mail.hauppauge.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753898AbYGNPWA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Jul 2008 11:22:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: nix.or.die@googlemail.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, mchehab@infradead.org

Stephen Rothwell wrote:
> On Mon, 14 Jul 2008 13:43:17 +0200 "Gabriel C" <nix.or.die@googlemail.com>
wrote:
>   
>> make clean / mrproper is broken , I'm not sure when it broken , I'm
>> updating from
>> 2.6.26-rc8-next-20080630.
>>
>> ...
>>
>> crazy@thor:/work/crazy/linux/linux-next/git/linux-2.6$ LC_ALL=C make
clean
>> scripts/Makefile.clean:17:
>> /work/crazy/linux/linux-next/git/linux-2.6/drivers/media/mdtv/Makefile:
>> No such file or directory
>> make[3]: *** No rule to make target
>> `/work/crazy/linux/linux-next/git/linux-2.6/drivers/media/mdtv/Makefile'.
>>  Stop.
>> make[2]: *** [drivers/media/mdtv] Error 2
>> make[1]: *** [drivers/media] Error 2
>> make: *** [_clean_drivers] Error 2
>>
>> ...
>>
>> drivers/media/Makefile has 'obj-$(CONFIG_MDTV_ADAPTERS)  += mdtv/' but
>> I cannot see such a folder under drivers/media =). Removing mdtv from
>> Makefile fixes the problem.
>>     
>
> Commit 0fdb296d34c14520f061828d69a6e537e7dd78a4 ("V4L/DVB (8272):
> sms1xxx: move driver from media/mdtv/ to media/dvb/siano/") moved all of
> drivers/media/mdtv, but didn;t remove the reference from
> drivers/media/Makefile.
>
> Added some cc's
>   
Thank you for pointing this out, Stephen.

It looks like the patches did not carry over into git correctly.  This 
issue SHOULD have been fixed two changesets later, by the changeset 
entitled, "V4L/DVB (8274): sms1xxx: build cleanup after driver 
relocation" ... but, as you can see, the Makefile change didn't get applied.

This is the (incomplete) change in Mauro's git tree:

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig index 
e6a5879..7a7803b 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -115,20 +115,6 @@ source "drivers/media/radio/Kconfig"
 
 source "drivers/media/dvb/Kconfig"
 
-#
-# Mobile Digital TV devices (DVB-H, T-DMB, etc.)
-#
-menuconfig MDTV_ADAPTERS
-    bool "Mobile Digital TV adapter"
-    default y
-
-if MDTV_ADAPTERS
-
-source "drivers/media/mdtv/Kconfig"
-
-endif # MDTV_ADAPTERS
-
-
 config DAB
     boolean "DAB adapters"
     ---help---



But THIS is the change that should have been applied:

http://linuxtv.org/hg/v4l-dvb/rev/6949d67b8fbb

# HG changeset patch
# User Michael Krufky <mkrufky@linuxtv.org>
# Date 1211481160 14400
# Node ID 6949d67b8fbb301df8970bf464dd53a6cbb4072c
# Parent bb2d949c18602351d0cc43386b7caa63e5bf15b7
sms1xxx: build cleanup after driver relocation

From: Michael Krufky <mkrufky@linuxtv.org>

Signed-off-by: Michael Krufky <mkrufky@linuxtv.org>

--- a/linux/drivers/media/Kconfig    Thu May 22 14:30:17 2008 -0400
+++ b/linux/drivers/media/Kconfig    Thu May 22 14:32:40 2008 -0400
@@ -115,20 +115,6 @@ source "drivers/media/radio/Kconfig"
 
 source "drivers/media/dvb/Kconfig"
 
-#
-# Mobile Digital TV devices (DVB-H, T-DMB, etc.)
-#
-menuconfig MDTV_ADAPTERS
-    bool "Mobile Digital TV adapter"
-    default y
-
-if MDTV_ADAPTERS
-
-source "drivers/media/mdtv/Kconfig"
-
-endif # MDTV_ADAPTERS
-
-
 config DAB
     boolean "DAB adapters"
     ---help---
--- a/linux/drivers/media/Makefile    Thu May 22 14:30:17 2008 -0400
+++ b/linux/drivers/media/Makefile    Thu May 22 14:32:40 2008 -0400
@@ -6,4 +6,3 @@ obj-y += common/ video/
 
 obj-$(CONFIG_VIDEO_DEV) += radio/
 obj-$(CONFIG_DVB_CORE)  += dvb/
-obj-$(CONFIG_MDTV_ADAPTERS)  += mdtv/
\ No newline at end of file



Mauro,

Why didn't the Makefile change get applied?  Can you update your tree 
with this 1 line removal?

Thanks,

Mike Krufky
