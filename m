From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: manual merge of the ftrace tree with Linus' tree
Date: Wed, 4 Nov 2015 22:20:25 -0500
Message-ID: <20151104222025.0da837f6@grimm.local.home>
References: <20151105135140.2399976f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0047.hostedemail.com ([216.40.44.47]:46079 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1031670AbbKEDU1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Nov 2015 22:20:27 -0500
In-Reply-To: <20151105135140.2399976f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 5 Nov 2015 13:51:40 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Steven,
> 
> Today's linux-next merge of the ftrace tree got a conflict in:
> 
>   kernel/trace/trace_stack.c
> 
> between commit:
> 
>   a2d762904832 ("tracing: Have stack tracer force RCU to be watching")
> 
> from Linus' tree and commit:
> 
>   d332736df0c2 ("tracing: Rename max_stack_lock to stack_trace_max_lock")
> 
> from the ftrace tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 

Thanks, the fix looks good.

-- Steve
