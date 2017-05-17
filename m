From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound tree
Date: Wed, 17 May 2017 11:29:21 +1000
Message-ID: <20170517112921.0837160b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57773 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751045AbdEQB3Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 May 2017 21:29:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Takashi,

After merging the sound tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/delay.h:21:0,
                 from sound/pcmcia/vx/vxp_ops.c:23:
sound/pcmcia/vx/vxp_ops.c: In function 'vxp_dma_read':
sound/pcmcia/vx/vxp_ops.c:406:43: error: '_chip' undeclared (first use in this function)
  struct snd_vxpocket *pchip = to_vxpocket(_chip);
                                           ^
include/linux/kernel.h:854:49: note: in definition of macro 'container_of'
  const typeof( ((type *)0)->member ) *__mptr = (ptr); \
                                                 ^
sound/pcmcia/vx/vxp_ops.c:406:31: note: in expansion of macro 'to_vxpocket'
  struct snd_vxpocket *pchip = to_vxpocket(_chip);
                               ^
sound/pcmcia/vx/vxp_ops.c:406:43: note: each undeclared identifier is reported only once for each function it appears in
  struct snd_vxpocket *pchip = to_vxpocket(_chip);
                                           ^
include/linux/kernel.h:854:49: note: in definition of macro 'container_of'
  const typeof( ((type *)0)->member ) *__mptr = (ptr); \
                                                 ^
sound/pcmcia/vx/vxp_ops.c:406:31: note: in expansion of macro 'to_vxpocket'
  struct snd_vxpocket *pchip = to_vxpocket(_chip);
                               ^
sound/pcmcia/vx/vxp_ops.c: In function 'vx_set_mic_boost':
sound/pcmcia/vx/vxp_ops.c:470:43: error: '_chip' undeclared (first use in this function)
  struct snd_vxpocket *pchip = to_vxpocket(_chip);
                                           ^
include/linux/kernel.h:854:49: note: in definition of macro 'container_of'
  const typeof( ((type *)0)->member ) *__mptr = (ptr); \
                                                 ^
sound/pcmcia/vx/vxp_ops.c:470:31: note: in expansion of macro 'to_vxpocket'
  struct snd_vxpocket *pchip = to_vxpocket(_chip);
                               ^
sound/pcmcia/vx/vxp_ops.c: In function 'vx_set_mic_level':
sound/pcmcia/vx/vxp_ops.c:512:43: error: '_chip' undeclared (first use in this function)
  struct snd_vxpocket *pchip = to_vxpocket(_chip);
                                           ^
include/linux/kernel.h:854:49: note: in definition of macro 'container_of'
  const typeof( ((type *)0)->member ) *__mptr = (ptr); \
                                                 ^
sound/pcmcia/vx/vxp_ops.c:512:31: note: in expansion of macro 'to_vxpocket'
  struct snd_vxpocket *pchip = to_vxpocket(_chip);
                               ^

Caused by commit

  7c46696e8fef ("ALSA: vxpocket: Use container_of()")

I have used the sound tree from next-20170516 for today.
-- 
Cheers,
Stephen Rothwell
