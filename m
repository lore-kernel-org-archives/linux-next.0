From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Thu, 13 May 2010 11:52:58 +1000
Message-ID: <20100513115258.41b01dec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48467 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753424Ab0EMBw7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 May 2010 21:52:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in
drivers/input/evdev.c between commit
58b939959d228681208ba997595411fddc860849 ("Input: scancode in
get/set_keycodes should be unsigned") from Linus' tree and commit
edeada2cde748860846784cf3e5518d7c7c51ca2 ("V4L/DVB: input: Add support
for EVIO[CS]GKEYCODEBIG") from the v4l-dvb tree.

Just context changes.  I fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/input/evdev.c
index 2ee6c7a,1730b5b..0000000
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@@ -515,7 -513,9 +515,9 @@@ static long evdev_do_ioctl(struct file 
  	struct input_absinfo abs;
  	struct ff_effect effect;
  	int __user *ip = (int __user *)p;
+ 	struct keycode_table_entry kt, *kt_p = p;
+ 	char scancode[16];
 -	int i, t, u, v;
 +	unsigned int i, t, u, v;
  	int error;
  
  	switch (cmd) {
