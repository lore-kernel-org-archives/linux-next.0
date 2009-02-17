From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the v4l-dvb tree
Date: Tue, 17 Feb 2009 16:11:38 +1100
Message-ID: <20090217161138.1c50812b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55159 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750973AbZBQFLr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 00:11:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>, Arjan van de Ven <arjan@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>

Hi Rusty,

Today's linux-next merge of the rr tree got conflicts in
drivers/media/video/saa7134/saa7134-core.c and
drivers/media/video/saa7134/saa7134.h between commits
33a68ac0156dde8a60d8f23926d89b85be0a4e09 ("V4L/DVB (10247): saa7134:
convert to the new v4l2 framework"),
9777b5ef44a88c8f16b885d9ea6a7240e170465e ("V4L/DVB (10404): saa7134-core:
remove oss option, since saa7134-oss doesn't exist anymore") and
d8f5b7fe03a2ee412b9aa7a7dc1b38c1c8d54d84 ("V4L/DVB (10405): saa7134-core:
loading saa7134-alsa is now the default") from the v4l-dvb tree and
commit 1b779d7819c3a19c4fdcb23144e7c2d04e4693fe ("use the new
request_module_nowait() in drivers/media") from the rr tree.

Overlapping changes.  I fixed it up (see below, please check) and can
carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/media/video/saa7134/saa7134-core.c
index ac57445,a4bc939..0000000
--- a/drivers/media/video/saa7134/saa7134-core.c
+++ b/drivers/media/video/saa7134/saa7134-core.c
@@@ -147,25 -149,18 +147,18 @@@ void saa7134_set_gpio(struct saa7134_de
  /* delayed request_module                                      */
  
  #if defined(CONFIG_MODULES) && defined(MODULE)
- 
- static void request_module_async(struct work_struct *work){
- 	struct saa7134_dev* dev = container_of(work, struct saa7134_dev, request_module_wk);
+ static void request_submodules(struct saa7134_dev *dev)
+ {
  	if (card_is_empress(dev))
- 		request_module("saa7134-empress");
+ 		request_module_nowait("saa7134-empress");
  	if (card_is_dvb(dev))
- 		request_module("saa7134-dvb");
+ 		request_module_nowait("saa7134-dvb");
 -	if (alsa)
 -		request_module_nowait("saa7134-alsa");
 -	if (oss)
 -		request_module_nowait("saa7134-oss");
 +	if (alsa) {
 +		if (dev->pci->device != PCI_DEVICE_ID_PHILIPS_SAA7130)
- 			request_module("saa7134-alsa");
++			request_module_nowait("saa7134-alsa");
 +	}
  }
  
- static void request_submodules(struct saa7134_dev *dev)
- {
- 	INIT_WORK(&dev->request_module_wk, request_module_async);
- 	schedule_work(&dev->request_module_wk);
- }
- 
  #else
  #define request_submodules(dev)
  #endif /* CONFIG_MODULES */
diff --cc drivers/media/video/saa7134/saa7134.h
index 4552a4d,d13d16f..0000000
--- a/drivers/media/video/saa7134/saa7134.h
+++ b/drivers/media/video/saa7134/saa7134.h
@@@ -482,9 -482,6 +482,7 @@@ struct saa7134_dev 
  	struct mutex               lock;
  	spinlock_t                 slock;
  	struct v4l2_prio_state     prio;
 +	struct v4l2_device         v4l2_dev;
- 	/* workstruct for loading modules */
- 	struct work_struct request_module_wk;
  
  	/* insmod option/autodetected */
  	int                        autodetected;
