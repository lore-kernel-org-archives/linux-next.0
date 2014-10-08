From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH v2] Staging: octeon: ethernet-tx: fixed coding style
 warnings, missing blank lines
Date: Wed, 8 Oct 2014 15:39:41 -0400
Message-ID: <543592FD.9010900@windriver.com>
References: <1412795924-17759-1-git-send-email-robertoxmed@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1412795924-17759-1-git-send-email-robertoxmed@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Roberto Medina <robertoxmed@gmail.com>, gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, aaro.koskinen@iki.fi, josh@joshtripplet.org, linux-next@vger.kernel.org, ebiederm@xmission.com
List-Id: linux-next.vger.kernel.org

On 14-10-08 03:18 PM, Roberto Medina wrote:
> From: Roberto Medina <robertoxmed@gmail.com>
> 
> Fixed coding style warnings due to missing blank lines.
> Dubious additions removed.
> 
> Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
> 
> ---
>  drivers/staging/octeon/ethernet-tx.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
> index 4e54d85..b7a7854 100644
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
> @@ -258,6 +263,7 @@ int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
>  			    cvmx_read_csr(CVMX_GMXX_PRTX_CFG(index, interface));
>  			if (gmx_prt_cfg.s.duplex == 0) {
>  				int add_bytes = 64 - skb->len;
> +
>  				if ((skb_tail_pointer(skb) + add_bytes) <=
>  				    skb_end_pointer(skb))
>  					memset(__skb_put(skb, add_bytes), 0,
> @@ -289,6 +295,7 @@ int cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
>  		CVM_OCT_SKB_CB(skb)[0] = hw_buffer.u64;
>  		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
>  			struct skb_frag_struct *fs = skb_shinfo(skb)->frags + i;
> +
>  			hw_buffer.s.addr = XKPHYS_TO_PHYS(
>  				(u64)(page_address(fs->page.p) +
>  				fs->page_offset));
> @@ -495,6 +502,7 @@ skip_xmit:
>  
>  	while (skb_to_free > 0) {
>  		struct sk_buff *t = __skb_dequeue(&priv->tx_free_list[qos]);
> +
>  		t->next = to_free_list;
>  		to_free_list = t;
>  		skb_to_free--;
> @@ -505,6 +513,7 @@ skip_xmit:
>  	/* Do the actual freeing outside of the lock. */
>  	while (to_free_list) {
>  		struct sk_buff *t = to_free_list;
> +
>  		to_free_list = to_free_list->next;
>  		dev_kfree_skb_any(t);
>  	}
> @@ -550,6 +559,7 @@ int cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
>  
>  	/* Get a work queue entry */
>  	cvmx_wqe_t *work = cvmx_fpa_alloc(CVMX_FPA_WQE_POOL);
> +
>  	if (unlikely(work == NULL)) {

This one is still bogus.

P.
--

>  		printk_ratelimited("%s: Failed to allocate a work queue entry\n",
>  				   dev->name);
> @@ -713,6 +723,7 @@ static void cvm_oct_tx_do_cleanup(unsigned long arg)
>  	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++) {
>  		if (cvm_oct_device[port]) {
>  			struct net_device *dev = cvm_oct_device[port];
> +
>  			cvm_oct_free_tx_skbs(dev);
>  		}
>  	}
> 
