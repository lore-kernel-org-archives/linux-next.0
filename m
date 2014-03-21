From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Fri, 21 Mar 2014 14:17:13 +0530
Message-ID: <532BFC91.3030505@linux.vnet.ibm.com>
References: <20140321152303.5e4071c94957a70831edd1a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp04.in.ibm.com ([122.248.162.4]:32775 "EHLO
	e28smtp04.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758082AbaCUIrf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 21 Mar 2014 04:47:35 -0400
Received: from /spool/local
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <srivatsa.bhat@linux.vnet.ibm.com>;
	Fri, 21 Mar 2014 14:17:32 +0530
In-Reply-To: <20140321152303.5e4071c94957a70831edd1a1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Stephane Eranian <eranian@google.com>

On 03/21/2014 09:53 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in
> arch/x86/kernel/cpu/perf_event_intel_uncore.c between commit 2c666adacc9e
> ("x86, intel, uncore: Fix CPU hotplug callback registration") from Linus'
> tree and commit 411cf180fa00 ("perf/x86/uncore: fix initialization of
> cpumask") from the tip tree.
> 
> I fixed it up (maybe incorrectly - see below) and can carry the fix as
> necessary (no action is required).
> 

The fix looks good to me. Thank you!

Regards,
Srivatsa S. Bhat
