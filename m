From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nfsd tree with the nfs tree
Date: Mon, 10 Aug 2009 10:58:51 +1000
Message-ID: <20090810105851.80333493.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55974 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753706AbZHJA65 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 9 Aug 2009 20:58:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, NeilBrown <neilb@suse.de>, Trond Myklebust <Trond.Myklebust@netapp.com>

Hi Bruce,

Today's linux-next merge of the nfsd tree got a conflict in
net/sunrpc/cache.c between commit
173912a6add00f4715774dcecf9ee53274c5924c ("SUNRPC: Move procfs-specific
stuff out of the generic sunrpc cache code") from the nfs tree and commit
f866a8194f7cbabb9135b98b9ac7d26237b88367 ("sunrpc/cache: rename
queue_loose to cache_dequeue") from the nfsd tree.

Just context changes. I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc net/sunrpc/cache.c
index db7720e,d19c075..0000000
--- a/net/sunrpc/cache.c
+++ b/net/sunrpc/cache.c
@@@ -884,7 -908,19 +884,7 @@@ static int cache_release(struct inode *
  
  
  
- static void queue_loose(struct cache_detail *detail, struct cache_head *ch)
 -static const struct file_operations cache_file_operations = {
 -	.owner		= THIS_MODULE,
 -	.llseek		= no_llseek,
 -	.read		= cache_read,
 -	.write		= cache_write,
 -	.poll		= cache_poll,
 -	.ioctl		= cache_ioctl, /* for FIONREAD */
 -	.open		= cache_open,
 -	.release	= cache_release,
 -};
 -
 -
+ static void cache_dequeue(struct cache_detail *detail, struct cache_head *ch)
  {
  	struct cache_queue *cq;
  	spin_lock(&queue_lock);
