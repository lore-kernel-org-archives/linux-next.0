From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Tue, 23 May 2017 07:44:56 +1000
Message-ID: <20170523074456.353423fb@canb.auug.org.au>
References: <20170522132711.22b80ff5@canb.auug.org.au>
        <20170522083214.GA1478@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44847 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752658AbdEVVpB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 May 2017 17:45:01 -0400
In-Reply-To: <20170522083214.GA1478@leverpostej>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>

Hi Mark,

On Mon, 22 May 2017 09:32:15 +0100 Mark Rutland <mark.rutland@arm.com> wrote:
>
> Just to check, is your copy of tip up-to-date?

Yes, it was fetched just before being merged.  I use the auto-latest
branch of the tip tree which may not be as up to date as the master
branch.

> That latter commit was in the tip smp/hotplug branch, but that branch
> was reset to v4.12-rc1 a few days ago (before the first commit was sent
> to Linus), specifically to avoid this conflict.
> 
> ... did we miss another branch that was merged into, perhaps?

Presumably, but that's ok - I assume it will come good eventually.

> The good news is that the commit in Linus' tree is the correct fix. :)

Well, except that I only fixed up that one spot, the rest of the commit
from the tip tree was still there.

> The other commit was a slightly broken prior attempt, and shouldn't be
> in the tip tree any more.

OK.

-- 
Cheers,
Stephen Rothwell
