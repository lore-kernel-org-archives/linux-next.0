From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the workqueues tree with the v4l-dvb
 tree
Date: Mon, 27 Dec 2010 15:38:55 +1100
Message-ID: <20101227153855.67152fd9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58506 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752703Ab0L0Ei6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 26 Dec 2010 23:38:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David =?UTF-8?B?SMODwqRyZGVtYW4=?= <david@hardeman.nu>, Mauro Carvalho Chehab <mchehab@redhat.com>

Hi Tejun,

Today's linux-next merge of the workqueues tree got a conflict in
drivers/media/video/bt8xx/bttv-input.c between commit
ed6ff10ea4e8748adad312c758ff12099cec6930 ("[media] bttv: merge ir
decoding timers") from the v4l-dvb tree and commit
8c71778cbf2c8beaefaa2dee5478aa0622d96682 ("media/video: don't use
flush_scheduled_work()") from the workqueues tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/media/video/bt8xx/bttv-input.c
index 7f48306,1989f00..0000000
--- a/drivers/media/video/bt8xx/bttv-input.c
+++ b/drivers/media/video/bt8xx/bttv-input.c
@@@ -327,8 -235,7 +325,7 @@@ static void bttv_ir_stop(struct bttv *b
  	if (btv->remote->rc5_gpio) {
  		u32 gpio;
  
 -		del_timer_sync(&btv->remote->timer_end);
 +		del_timer_sync(&btv->remote->timer);
- 		flush_scheduled_work();
  
  		gpio = bttv_gpio_read(&btv->c);
  		bttv_gpio_write(&btv->c, gpio & ~(1 << 4));
