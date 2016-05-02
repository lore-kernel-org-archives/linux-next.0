From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Mon, 2 May 2016 04:06:45 -0700
Message-ID: <20160502110645.GS3686@linux.vnet.ibm.com>
References: <20160502143736.631f2a44@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e33.co.us.ibm.com ([32.97.110.151]:56095 "EHLO
	e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753624AbcEBLGs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 May 2016 07:06:48 -0400
Received: from localhost
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Mon, 2 May 2016 05:06:47 -0600
Content-Disposition: inline
In-Reply-To: <20160502143736.631f2a44@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>

On Mon, May 02, 2016 at 02:37:36PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> arch/x86/kvm/vmx.c: In function 'vmx_init':
> arch/x86/kvm/vmx.c:11026:2: error: function '_r_a_p__v' is initialized like a variable
>   rcu_assign_pointer(crash_vmclear_loaded_vmcss,
>   ^
> In file included from include/linux/rbtree.h:34:0,
>                  from include/linux/mm_types.h:9,
>                  from arch/x86/kvm/irq.h:25,
>                  from arch/x86/kvm/vmx.c:19:
> include/linux/rcupdate.h:657:45: warning: the comparison will always evaluate as 'false' for the address of '_r_a_p__v' will never be NULL [-Waddress]
>   if (__builtin_constant_p(v) && (_r_a_p__v) == NULL) \
>                                              ^
> arch/x86/kvm/vmx.c:11026:2: note: in expansion of macro 'rcu_assign_pointer'
>   rcu_assign_pointer(crash_vmclear_loaded_vmcss,
>   ^
> include/linux/rcupdate.h:655:12: error: nested function '_r_a_p__v' declared but never defined  
>   typeof(v) _r_a_p__v = (v); \
>             ^
> arch/x86/kvm/vmx.c:11026:2: note: in expansion of macro 'rcu_assign_pointer'
>   rcu_assign_pointer(crash_vmclear_loaded_vmcss,
>   ^
> 
> Caused by commit
> 
>   16d7afcaa530 ("rcu: No ordering for rcu_assign_pointer() of NULL")
> 
> I have reverted that commit for today.

Too much fun when rcu_assign_pointer() is invoked on a pointer to a
function...  Sorry for the hassle!

							Thanx, Paul
