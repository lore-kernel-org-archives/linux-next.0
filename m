From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-llseek tree with the rr tree
Date: Wed, 15 Sep 2010 13:26:46 +1000
Message-ID: <20100915132646.4aef58f8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46405 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752244Ab0IOD0s (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Sep 2010 23:26:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amit Shah <amit.shah@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>

Hi Arnd,

Today's linux-next merge of the bkl-llseek tree got a conflict in
drivers/char/virtio_console.c between commit
a0e1acd65fa6c2da3b039a67ac30cc3b73466c37 ("virtio: console: Send SIGIO to
processes that request it for host events") from the rr tree and commit
7f09912dd2169ca9ce56c5e3428c7b4c5e92e727 ("llseek: automatically
add .llseek fop") from the bkl-llseek tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/char/virtio_console.c
index f7adfd3,524907b..0000000
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@@ -824,7 -728,7 +824,8 @@@ static const struct file_operations por
  	.write = port_fops_write,
  	.poll  = port_fops_poll,
  	.release = port_fops_release,
 +	.fasync = port_fops_fasync,
+ 	.llseek = noop_llseek,/* read and write both use no f_pos */
  };
  
  /*
