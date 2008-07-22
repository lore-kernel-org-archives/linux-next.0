From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: manual merge of the rr tree
Date: Tue, 22 Jul 2008 07:21:11 -0700
Message-ID: <4885ECD7.9020607@sgi.com>
References: <20080722145838.9248b80a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.sgi.com ([192.48.171.29]:58892 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751404AbYGVOVN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 10:21:13 -0400
In-Reply-To: <20080722145838.9248b80a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next merge of the rr tree got a conflict in
> kernel/stop_machine.c between commit
> 65c011845316d3c1381f478ca0d8265c43b3b039 ("cpumask: Replace
> cpumask_of_cpu with cpumask_of_cpu_ptr") from the cpus4096 tree and
> commit 775664f6fd1530f5c90a7e55984459fd8cbb74a5 ("stop_machine:simplify")
> (and some later commits) from the rr tree.
> 
> The update done in the former seems not to be needed any more, so I used
> the version of this file from the rr tree.  Someone should check.
> 

Yes, it looks like you are correct.  The older code from cpus4096 is not
needed for kernel/stop_machine.c.  I'll look through the other changes and
send a note if there's any other issues.

Thanks!
Mike
