From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: [PATCH] pppol2tp: stop using proc internals
Date: Sun, 25 Jan 2009 11:47:18 +0300
Message-ID: <20090125084718.GC8203@localhost>
References: <20090123171515.a0af4f8b.sfr@canb.auug.org.au> <20090123070955.GA8491@localhost> <20090124220048.GA5753@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.24]:43142 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751755AbZAYIr2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 25 Jan 2009 03:47:28 -0500
Received: by ey-out-2122.google.com with SMTP id 22so1144877eye.37
        for <linux-next@vger.kernel.org>; Sun, 25 Jan 2009 00:47:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20090124220048.GA5753@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, "Eric W. Biederman" <ebiederm@xmission.com>

[Alexey Dobriyan - Sun, Jan 25, 2009 at 01:00:48AM +0300]
| On Fri, Jan 23, 2009 at 10:09:55AM +0300, Cyrill Gorcunov wrote:
| > [Stephen Rothwell - Fri, Jan 23, 2009 at 05:15:15PM +1100]
| > | Hi Alexey,
| > | 
| > | Today's linux-next build (powerpc ppc64_defconfig) failed like this:
| > | 
| > | drivers/net/pppoe.c: In function 'pppoe_seq_open':
| > | drivers/net/pppoe.c:1102: error: implicit declaration of function 'PDE_NET'
| > | drivers/net/pppol2tp.c: In function 'pppol2tp_proc_open':
| > | drivers/net/pppol2tp.c:2579: error: implicit declaration of function 'PDE_NET'
| > | 
| > | Caused by commits a6bcf1c1d38e0672db35e0d9f2504ac04ddf3ed5 ("net: pppoe -
| > | introduce net-namespace functionality") and
| > | 4e9fb8016a351b5b9da7fea32bcfdbc9d836e421 ("net: pppol2tp - introduce
| > | net-namespace functionality") from the net tree interacting with commit
| > | 0e6a2bfcbae4ee3cf770a6a5da203b4a336ff8ff ("proc 5/6: simplify network
| > | namespace lookup") from the proc tree.
| > | 
| > | I added the following fix to the merge and can carry it as necessary.
| > | 
| > | I expect that there is a better fix for this, though.  These are the only
| > | references to PDE_NET outside fs/proc.
| > | -- 
| > | Cheers,
| > | Stephen Rothwell                    sfr@canb.auug.org.au
| > | http://www.canb.auug.org.au/~sfr/
| > | 
| > | diff --git a/drivers/net/pppoe.c b/drivers/net/pppoe.c
| > | index 798b8cf..3aabf92 100644
| > | --- a/drivers/net/pppoe.c
| > | +++ b/drivers/net/pppoe.c
| > | @@ -1099,7 +1099,7 @@ static int pppoe_seq_open(struct inode *inode, struct file *file)
| > |  		return err;
| > |  
| > |  	m = file->private_data;
| > | -	net = maybe_get_net(PDE_NET(PDE(inode)));
| > | +	net = maybe_get_net(inode->i_sb->s_fs_info);
| > |  	BUG_ON(!net);
| > |  	m->private = net;
| > |  
| > | diff --git a/drivers/net/pppol2tp.c b/drivers/net/pppol2tp.c
| > | index 056e22a..d21470f 100644
| > | --- a/drivers/net/pppol2tp.c
| > | +++ b/drivers/net/pppol2tp.c
| > | @@ -2576,7 +2576,7 @@ static int pppol2tp_proc_open(struct inode *inode, struct file *file)
| > |  		goto out;
| > |  
| > |  	pd = m->private;
| > | -	net = maybe_get_net(PDE_NET(PDE(inode)));
| > | +	net = maybe_get_net(inode->i_sb->s_fs_info);
| 
| Someone with ppp setup, please test this:
| 
| 
| 
| [PATCH] pppol2tp: stop using proc internals
| 
| PDE_NET usage in driver code is a sign and, indeed, switching
| to seq_open_net/seq_release_net saves code and fixes bogus things, like
| user triggerabble BUG_ON(!net) after maybe_get_net, and NULLifying ->private.
| 
| Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
| ---
| 
|  drivers/net/pppol2tp.c |   48 +++++-------------------------------------------
|  1 file changed, 5 insertions(+), 43 deletions(-)
| 
| --- a/drivers/net/pppol2tp.c
| +++ b/drivers/net/pppol2tp.c
| @@ -2371,7 +2371,7 @@ end:
|  #include <linux/seq_file.h>
|  
|  struct pppol2tp_seq_data {
| -	struct net *seq_net;			/* net of inode */
| +	struct seq_net_private p;
|  	struct pppol2tp_tunnel *tunnel;		/* current tunnel */
|  	struct pppol2tp_session *session;	/* NULL means get first session in tunnel */
|  };
| @@ -2436,7 +2436,7 @@ static void *pppol2tp_seq_start(struct seq_file *m, loff_t *offs)
|  
|  	BUG_ON(m->private == NULL);
|  	pd = m->private;
| -	pn = pppol2tp_pernet(pd->seq_net);
| +	pn = pppol2tp_pernet(seq_file_net(m));
|  
|  	if (pd->tunnel == NULL) {
|  		if (!list_empty(&pn->pppol2tp_tunnel_list))
| @@ -2558,46 +2558,8 @@ static const struct seq_operations pppol2tp_seq_ops = {
|   */
|  static int pppol2tp_proc_open(struct inode *inode, struct file *file)
|  {
| -	struct seq_file *m;
| -	struct pppol2tp_seq_data *pd;
| -	struct net *net;
| -	int ret = 0;
| -
| -	ret = seq_open(file, &pppol2tp_seq_ops);
| -	if (ret < 0)
| -		goto out;
| -
| -	m = file->private_data;
| -
| -	/* Allocate and fill our proc_data for access later */
| -	ret = -ENOMEM;
| -	m->private = kzalloc(sizeof(*pd), GFP_KERNEL);
| -	if (m->private == NULL)
| -		goto out;
| -
| -	pd = m->private;
| -	net = maybe_get_net(PDE_NET(PDE(inode)));
| -	BUG_ON(!net);
| -	pd->seq_net = net;
| -	return 0;
| -
| -out:
| -	return ret;
| -}
| -
| -/* Called when /proc file access completes.
| - */
| -static int pppol2tp_proc_release(struct inode *inode, struct file *file)
| -{
| -	struct seq_file *m = (struct seq_file *)file->private_data;
| -	struct pppol2tp_seq_data *pd = m->private;
| -
| -	put_net(pd->seq_net);
| -
| -	kfree(m->private);
| -	m->private = NULL;
| -
| -	return seq_release(inode, file);
| +	return seq_open_net(inode, file, &pppol2tp_seq_ops,
| +			    sizeof(struct pppol2tp_seq_data));
|  }
|  
|  static const struct file_operations pppol2tp_proc_fops = {
| @@ -2605,7 +2567,7 @@ static const struct file_operations pppol2tp_proc_fops = {
|  	.open		= pppol2tp_proc_open,
|  	.read		= seq_read,
|  	.llseek		= seq_lseek,
| -	.release	= pppol2tp_proc_release,
| +	.release	= seq_release_net,
|  };
|  
|  #endif /* CONFIG_PROC_FS */
| 

Thanks a lot Alexey! I'll fix PPPoE too.

		- Cyrill -
