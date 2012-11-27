From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH rcu] use new nesting value for rcu_dyntick trace in
 rcu_eqs_enter_common
Date: Tue, 27 Nov 2012 07:18:32 -0800
Message-ID: <20121127151831.GU2474@linux.vnet.ibm.com>
References: <1353993325.14050.49.camel@ThinkPad-T5421.cn.ibm.com>
 <1353995907.14050.60.camel@ThinkPad-T5421.cn.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e9.ny.us.ibm.com ([32.97.182.139]:53408 "EHLO e9.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755242Ab2K0P5A (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 Nov 2012 10:57:00 -0500
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 27 Nov 2012 10:56:59 -0500
Content-Disposition: inline
In-Reply-To: <1353995907.14050.60.camel@ThinkPad-T5421.cn.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Li Zhong <zhong@linux.vnet.ibm.com>
Cc: linux-next list <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, dipankar@in.ibm.com

On Tue, Nov 27, 2012 at 01:58:27PM +0800, Li Zhong wrote:
> This patch uses the real new value of dynticks_nesting instead of 0 in
> rcu_eqs_enter_common(). 
> 
> Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>

Good catch!  Queued for 3.9.

							Thanx, Paul

> ---
>  kernel/rcutree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/rcutree.c b/kernel/rcutree.c
> index 7733eb5..6b7e314 100644
> --- a/kernel/rcutree.c
> +++ b/kernel/rcutree.c
> @@ -339,7 +339,7 @@ static struct rcu_node *rcu_get_root(struct rcu_state *rsp)
>  static void rcu_eqs_enter_common(struct rcu_dynticks *rdtp, long long oldval,
>  				bool user)
>  {
> -	trace_rcu_dyntick("Start", oldval, 0);
> +	trace_rcu_dyntick("Start", oldval, rdtp->dynticks_nesting);
>  	if (!user && !is_idle_task(current)) {
>  		struct task_struct *idle = idle_task(smp_processor_id());
> 
> -- 
> 1.7.11.4
> 
