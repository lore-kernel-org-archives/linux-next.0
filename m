From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 8 Nov 2017 23:14:26 +1100
Message-ID: <20171108231426.3f2139de@canb.auug.org.au>
References: <20171108134717.578046db@canb.auug.org.au>
        <20171108030152.bd76eahiwjwjt3kp@treble>
        <20171108091827.pl3igqvpy56bvvn7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45433 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752023AbdKHMO3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Nov 2017 07:14:29 -0500
In-Reply-To: <20171108091827.pl3igqvpy56bvvn7@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Ingo,

On Wed, 8 Nov 2017 10:18:28 +0100 Ingo Molnar <mingo@kernel.org> wrote:
>
> Note, I created a commit out of this fix, with your SOB - let me know if you have 
> any objections.

Only a small nit - I didn't bisect it, I just figured it out by
inspection.  Unfortunately, I don't have time to do bisections while
building linux-next. :-(

Not a biggie, though.  Thanks for sorting this out.

-- 
Cheers,
Stephen Rothwell
