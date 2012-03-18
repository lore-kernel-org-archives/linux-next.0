From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: linux-next: "ALSA: hda - Fix build of patch_sigmatel.c" commit
 breaks sparc
Date: Sun, 18 Mar 2012 14:25:56 -0400
Message-ID: <20120318182555.GB2095@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:47439 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751746Ab2CRS0E (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 18 Mar 2012 14:26:04 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: tiwai@suse.de
Cc: linux-next@vger.kernel.org

Hi Takashi,

If you have a spare moment, can you look at the following build failure?

http://kisskb.ellerman.id.au/kisskb/buildresult/5884004/

I didn't bisect to be 100% sure, but it does look like it might be
caused by your commit below.

Thanks,
Paul.
---

commit 7907ae3e50613ae1c6d1a10f34fcd63f4123b93d
Author: Takashi Iwai <tiwai@suse.de>
Date:   Wed Mar 14 08:20:20 2012 +0100

    ALSA: hda - Fix build of patch_sigmatel.c without CONFIG_SND_HDA_POWER_SAVE

    Now the mute-LED is controlled without powersave hack, and the ifdefs must
    be removed.

    Signed-off-by: Takashi Iwai <tiwai@suse.de>
