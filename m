From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: [PATCH] this_cpu: Use this_cpu_xx in trace_functions_graph.c
Date: Tue, 13 Oct 2009 10:36:13 -0400 (EDT)
Message-ID: <alpine.DEB.1.10.0910131035450.11413@gentwo.org>
References: <20091013144812.bdb376aa.sfr@canb.auug.org.au> <4AD48EC4.8040701@kernel.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760055AbZJMOoa@vger.kernel.org>
In-Reply-To: <4AD48EC4.8040701@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, 13 Oct 2009, Tejun Heo wrote:

> ftrace_cpu_disabled usage in trace_functions_graph.c were left out
> during this_cpu_xx conversion in commit 9288f99a causing compile
> failure.  Convert them.

Thanks.

Reviewed-by: Christoph Lameter <cl@linux-foundation.org>
