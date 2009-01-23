From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: proc tree build failure
Date: Fri, 23 Jan 2009 17:15:15 +1100
Message-ID: <20090123171515.a0af4f8b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47782 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751418AbZAWGPV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jan 2009 01:15:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, Cyrill Gorcunov <gorcunov@openvz.org>, "David S. Miller" <davem@davemloft.net>, "Eric W. Biederman" <ebiederm@xmission.com>

Hi Alexey,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/net/pppoe.c: In function 'pppoe_seq_open':
drivers/net/pppoe.c:1102: error: implicit declaration of function 'PDE_NET'
drivers/net/pppol2tp.c: In function 'pppol2tp_proc_open':
drivers/net/pppol2tp.c:2579: error: implicit declaration of function 'PDE_NET'

Caused by commits a6bcf1c1d38e0672db35e0d9f2504ac04ddf3ed5 ("net: pppoe -
introduce net-namespace functionality") and
4e9fb8016a351b5b9da7fea32bcfdbc9d836e421 ("net: pppol2tp - introduce
net-namespace functionality") from the net tree interacting with commit
0e6a2bfcbae4ee3cf770a6a5da203b4a336ff8ff ("proc 5/6: simplify network
namespace lookup") from the proc tree.

I added the following fix to the merge and can carry it as necessary.

I expect that there is a better fix for this, though.  These are the only
references to PDE_NET outside fs/proc.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/drivers/net/pppoe.c b/drivers/net/pppoe.c
index 798b8cf..3aabf92 100644
--- a/drivers/net/pppoe.c
+++ b/drivers/net/pppoe.c
@@ -1099,7 +1099,7 @@ static int pppoe_seq_open(struct inode *inode, struct file *file)
 		return err;
 
 	m = file->private_data;
-	net = maybe_get_net(PDE_NET(PDE(inode)));
+	net = maybe_get_net(inode->i_sb->s_fs_info);
 	BUG_ON(!net);
 	m->private = net;
 
diff --git a/drivers/net/pppol2tp.c b/drivers/net/pppol2tp.c
index 056e22a..d21470f 100644
--- a/drivers/net/pppol2tp.c
+++ b/drivers/net/pppol2tp.c
@@ -2576,7 +2576,7 @@ static int pppol2tp_proc_open(struct inode *inode, struct file *file)
 		goto out;
 
 	pd = m->private;
-	net = maybe_get_net(PDE_NET(PDE(inode)));
+	net = maybe_get_net(inode->i_sb->s_fs_info);
 	BUG_ON(!net);
 	pd->seq_net = net;
 	return 0;
