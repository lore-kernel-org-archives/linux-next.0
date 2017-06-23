From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Fri, 23 Jun 2017 14:22:00 +1000
Message-ID: <20170623142200.3df2515d@canb.auug.org.au>
References: <20170623135834.49322610@canb.auug.org.au>
        <20170623140006.26585989@canb.auug.org.au>
        <87efubqr7y.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55101 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751107AbdFWEWD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Jun 2017 00:22:03 -0400
In-Reply-To: <87efubqr7y.fsf@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, John Stultz <john.stultz@linaro.org>

Hi Michael,

On Fri, 23 Jun 2017 14:10:25 +1000 Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Fixed in my next today by:
> 
>   d4cfb11387ee ("powerpc: Convert VDSO update function to use new update_vsyscall interface")
> 
> But you must have pulled before I pushed that, so the warning will go
> away tomorrow.

Excellent, thanks.

-- 
Cheers,
Stephen Rothwell
