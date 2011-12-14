From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: build warnings after merge of the final tree
Date: Wed, 14 Dec 2011 11:32:02 -0500
Message-ID: <1323880322.23971.33.camel@gandalf.stny.rr.com>
References: <20111214181545.6e13bc954cb7ddce9086e861@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:35266 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755044Ab1LNQcE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Dec 2011 11:32:04 -0500
In-Reply-To: <20111214181545.6e13bc954cb7ddce9086e861@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Wed, 2011-12-14 at 18:15 +1100, Stephen Rothwell wrote:

> Maybe caused by commit d5e553d6e0a4 ("trace: Include <asm/asm-offsets.h>
> in trace_syscalls.c") from the tip tree.  These warnings may have been
> here for a while as it is hard to catch the new ones among the flood.
> 

hpa,

Was this change only needed for x86? If so, could you put that into
asm/ftrace.h instead?

-- Steve
