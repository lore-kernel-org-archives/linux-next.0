From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] this_cpu: Use this_cpu_xx in trace_functions_graph.c
Date: Tue, 13 Oct 2009 23:47:51 +0900
Message-ID: <4AD49317.6080503@kernel.org>
References: <20091013144812.bdb376aa.sfr@canb.auug.org.au> <4AD48EC4.8040701@kernel.org> <alpine.DEB.1.10.0910131035450.11413@gentwo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760000AbZJMOs5@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.0910131035450.11413@gentwo.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Lameter <cl@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Christoph Lameter wrote:
> On Tue, 13 Oct 2009, Tejun Heo wrote:
> 
>> ftrace_cpu_disabled usage in trace_functions_graph.c were left out
>> during this_cpu_xx conversion in commit 9288f99a causing compile
>> failure.  Convert them.
> 
> Thanks.
> 
> Reviewed-by: Christoph Lameter <cl@linux-foundation.org>

Oh... one question tho.  I used __this_cpu_*() as other conversions
but I think we should be using the version without the underscores.
The relationship between get_cpu_var() and __get_cpu_var() is
different from the one between this_cpu_*() and __this_cpu_*().

Thanks.

-- 
tejun
