From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: [PATCH] this_cpu: Use this_cpu_xx in trace_functions_graph.c
Date: Tue, 13 Oct 2009 10:45:39 -0400 (EDT)
Message-ID: <alpine.DEB.1.10.0910131043460.8088@gentwo.org>
References: <20091013144812.bdb376aa.sfr@canb.auug.org.au> <4AD48EC4.8040701@kernel.org> <alpine.DEB.1.10.0910131035450.11413@gentwo.org> <4AD49317.6080503@kernel.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933705AbZJMOx1@vger.kernel.org>
In-Reply-To: <4AD49317.6080503@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, 13 Oct 2009, Tejun Heo wrote:

> Oh... one question tho.  I used __this_cpu_*() as other conversions
> but I think we should be using the version without the underscores.
> The relationship between get_cpu_var() and __get_cpu_var() is
> different from the one between this_cpu_*() and __this_cpu_*().

For operations like inc/add/dec/sub you need to use the version with __
otherwise the arches that do not support these operations will have to
generate useless expensive code that disables / reenables preempt.

For this_cpu_ptr / __this_cpu_ptr it does not matter. this_cpu_ptr gives
you additional checks.
