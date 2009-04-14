From: Subrata Modak <subrata@linux.vnet.ibm.com>
Subject: [BUILD FAILURE 04/04] Next April 14 : x86_64 randconfig
	[drivers/media/video/cx231xx/cx231xx-alsa.ko]
Date: Tue, 14 Apr 2009 23:57:49 +0530
Message-ID: <1239733669.5344.72.camel@subratamodak.linux.ibm.com>
Reply-To: subrata@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>, Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, sachinp <sachinp@linux.vnet.ibm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-media@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Observed the following build error:
---
Kernel: arch/x86/boot/bzImage is ready  (#1)
  Building modules, stage 2.
  MODPOST 578 modules
ERROR:
"snd_pcm_period_elapsed" [drivers/media/video/cx231xx/cx231xx-alsa.ko]
undefined!
ERROR: "snd_card_create" [drivers/media/video/cx231xx/cx231xx-alsa.ko]
undefined!
ERROR:
"snd_pcm_hw_constraint_integer" [drivers/media/video/cx231xx/cx231xx-alsa.ko] undefined!
ERROR:
"snd_pcm_link_rwlock" [drivers/media/video/cx231xx/cx231xx-alsa.ko]
undefined!
ERROR: "snd_pcm_set_ops" [drivers/media/video/cx231xx/cx231xx-alsa.ko]
undefined!
ERROR: "snd_pcm_lib_ioctl" [drivers/media/video/cx231xx/cx231xx-alsa.ko]
undefined!
ERROR: "snd_card_free" [drivers/media/video/cx231xx/cx231xx-alsa.ko]
undefined!
ERROR: "snd_card_register" [drivers/media/video/cx231xx/cx231xx-alsa.ko]
undefined!
ERROR: "snd_pcm_new" [drivers/media/video/cx231xx/cx231xx-alsa.ko]
undefined!
make[1]: *** [__modpost] Error 1
make: *** [modules] Error 2
---

Regards--
Subrata


