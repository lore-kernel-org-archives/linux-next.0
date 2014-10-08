From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] Staging: octeon: ethernet-tx: fixed coding style warnings,
 missing blank lines
Date: Wed, 8 Oct 2014 14:46:16 -0400
Message-ID: <54358678.8050307@windriver.com>
References: <1412790687-15731-1-git-send-email-robertoxmed@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:48762 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753492AbaJHSqX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Oct 2014 14:46:23 -0400
In-Reply-To: <1412790687-15731-1-git-send-email-robertoxmed@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roberto Medina <robertoxmed@gmail.com>, gregkh@linuxfoundation.org
Cc: josh@joshtripplet.org, ebru.akagunduz@gmail.com, aaro.koskinen@iki.fi, ebiederm@xmission.com, devel@driverdev.osuosl.org, linux-next@vger.kernel.org

On 14-10-08 01:51 PM, Roberto Medina wrote:
> From: Roberto Medina <robertoxmed@gmail.com>
> 
> Fixed coding style warnings due to missing blank lines.

Seems some dubious additions -- annotated below....

> 
> Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
> 
> ---
>  drivers/staging/octeon/ethernet-tx.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
> index 4e54d85..f2a41f0 100644
> --- a/drivers/staging/octeon/ethernet-tx.c
> +++ b/drivers/staging/octeon/ethernet-tx.c
> @@ -77,6 +77,7 @@ static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup, 0);
>  static inline int32_t cvm_oct_adjust_skb_to_free(int32_t skb_to_free, int fau)
>  {
>  	int32_t undo;
> +
>  	undo = skb_to_free > 0 ? MAX_SKB_TO_FREE : skb_to_free +
>  						   MAX_SKB_TO_FREE;
>  	if (undo > 0)
> @@ -89,6 +90,7 @@ static inline int32_t cvm_oct_adjust_skb_to_free(int32_t skb_to_free, int fau)
>  static void cvm_oct_kick_tx_poll_watchdog(void)
>  {
>  	union cvmx_ciu_timx ciu_timx;
> +
>  	ciu_timx.u64 = 0;
>  	ciu_timx.s.one_shot = 1;
>  	ciu_timx.s.len = cvm_oct_tx_poll_interval;
> @@ -118,9 +120,11 @@ static void cvm_oct_free_tx_skbs(struct net_device *dev)
>  		total_freed += skb_to_free;
>  		if (skb_to_free > 0) {
>  			struct sk_buff *to_free_list = NULL;
> +
>  			spin_lock_irqsave(&priv->tx_free_list[qos].lock, flags);
>  			while (skb_to_free > 0) {
>  				struct sk_buff *t;
> +
>  				t = __skb_dequeue(&priv->tx_free_list[qos]);
>  				t->next = to_free_list;
>  				to_free_list = t;
> @@ -131,6 +135,7 @@ static void cvm_oct_free_tx_skbs(struct net_device *dev)
>  			/* Do the actual freeing outside of the lock. */
>  			while (to_free_list) {
>  				struct sk_buff *t = to_free_list;
> +
>  				to_free_list = to_free_list->next;
>  				dev_kfree_skb_any(t);
>  			}
> @@ -256,8 +261,10 @@ int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
>  			/* We only need to pad packet in half duplex mode */
>  			gmx_prt_cfg.u64 =
>  			    cvmx_read_csr(CVMX_GMXX_PRTX_CFG(index, interface));
> +

Why would checkpatch want a newline here?

>  			if (gmx_prt_cfg.s.duplex == 0) {
>  				int add_bytes = 64 - skb->len;
> +
>  				if ((skb_tail_pointer(skb) + add_bytes) <=
>  				    skb_end_pointer(skb))
>  					memset(__skb_put(skb, add_bytes), 0,
> @@ -287,8 +294,10 @@ int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
>  		hw_buffer.s.pool = 0;
>  		hw_buffer.s.size = skb_headlen(skb);
>  		CVM_OCT_SKB_CB(skb)[0] = hw_buffer.u64;
> +

...or here?

>  		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
>  			struct skb_frag_struct *fs = skb_shinfo(skb)->frags + i;
> +
>  			hw_buffer.s.addr = XKPHYS_TO_PHYS(
>  				(u64)(page_address(fs->page.p) +
>  				fs->page_offset));
> @@ -495,6 +504,7 @@ skip_xmit:
>  
>  	while (skb_to_free > 0) {
>  		struct sk_buff *t = __skb_dequeue(&priv->tx_free_list[qos]);
> +
>  		t->next = to_free_list;
>  		to_free_list = t;
>  		skb_to_free--;
> @@ -505,6 +515,7 @@ skip_xmit:
>  	/* Do the actual freeing outside of the lock. */
>  	while (to_free_list) {
>  		struct sk_buff *t = to_free_list;
> +
>  		to_free_list = to_free_list->next;
>  		dev_kfree_skb_any(t);
>  	}
> @@ -550,6 +561,7 @@ int cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
>  
>  	/* Get a work queue entry */
>  	cvmx_wqe_t *work = cvmx_fpa_alloc(CVMX_FPA_WQE_POOL);
> +

...or here?  Seems broken if you ask me.

P.
--

>  	if (unlikely(work == NULL)) {
>  		printk_ratelimited("%s: Failed to allocate a work queue entry\n",
>  				   dev->name);
> @@ -713,6 +725,7 @@ static void cvm_oct_tx_do_cleanup(unsigned long arg)
>  	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++) {
>  		if (cvm_oct_device[port]) {
>  			struct net_device *dev = cvm_oct_device[port];
> +
>  			cvm_oct_free_tx_skbs(dev);
>  		}
>  	}
> 
