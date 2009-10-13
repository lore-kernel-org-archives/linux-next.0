From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: [PATCH] this_cpu: Use this_cpu_xx in trace_functions_graph.c
Date: Tue, 13 Oct 2009 11:14:28 -0400 (EDT)
Message-ID: <alpine.DEB.1.10.0910131110110.8088@gentwo.org>
References: <20091013144812.bdb376aa.sfr@canb.auug.org.au> <4AD48EC4.8040701@kernel.org> <alpine.DEB.1.10.0910131035450.11413@gentwo.org> <4AD49317.6080503@kernel.org> <alpine.DEB.1.10.0910131043460.8088@gentwo.org> <4AD49559.5050707@kernel.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp2.ultrahosting.com ([74.213.174.253]:49084 "EHLO
	smtp.ultrahosting.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755752AbZJMPWd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Oct 2009 11:22:33 -0400
In-Reply-To: <4AD49559.5050707@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 13 Oct 2009, Tejun Heo wrote:

> > For this_cpu_ptr / __this_cpu_ptr it does not matter. this_cpu_ptr gives
> > you additional checks.
>
> Yes, you're right.  The naming scheme in percpu sucks really hard.
> The subtle differences among [__]get_cpu_var(), [__]this_cpu_ptr() and
> other this_cpu ops.  Arghhhhhh.......

Yeah. __this_cpu_ptr is safe to use in preempt / irq disable sections
though the same way as __this_cpu_add/dec etc.

(__)get_cpu_var can be mostly gotten rid off through __this_cpu
operations.

We could define __get_cpu_var and get_cpu_var using this_cpu

#define get_cpu_var(x) (get_cpu(); this_cpu_read(per_cpu_var(x))

#define __get_cpu_var __this_cpu_read(per_cpu_var(x))
