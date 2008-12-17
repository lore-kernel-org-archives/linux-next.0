From: Mike Travis <travis@sgi.com>
Subject: Re: [PATCH 1/1] cpumask: add alloc_cpumask_var_node V2
Date: Wed, 17 Dec 2008 10:11:44 -0800
Message-ID: <494940E0.704@sgi.com>
References: <49471353.9070204@sgi.com> <494724E7.4090701@sgi.com> <49472C59.4030104@sgi.com> <200812172218.12608.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:43983 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750774AbYLQSLr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2008 13:11:47 -0500
In-Reply-To: <200812172218.12608.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@redhat.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Rusty Russell wrote:
> On Tuesday 16 December 2008 14:49:37 Mike Travis wrote:
>> Add alloc_cpumask_var_node.  This will be needed in x86 code to
>> allocate the domain and old_domain cpumasks on the same node as
>> where the containing irq_cfg struct is allocated.
> 
> OK, this is understandable.  If you don't mind I'll split this patch
> into documentation and node patches separately.
> 
> Since kmalloc(size, gfp) == kmalloc_node(size, gfp, -1), I think
> we can change this to implement alloc_cpumask_var() in terms of
> alloc_cpumask_var_node(..., numa_node_id()).
> 

Cool, thanks!

Mike
