From: Andi Kleen <ak@linux.intel.com>
Subject: Re: linux-next: disabling -Wstringop-truncation
Date: Thu, 30 Aug 2018 15:32:06 -0700
Message-ID: <87in3r32qh.fsf@linux.intel.com>
References: <20180831080714.4f94fba9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831080714.4f94fba9@canb.auug.org.au> (Stephen Rothwell's
        message of "Fri, 31 Aug 2018 08:07:14 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, Linux-kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Linus,
>
> I am now mainly using gcc v8.2 for my builds and -Wstringop-truncation
> causes so many warnings that I am sure to miss others, so I have
> applied the below to my fixes tree until the noise reduces.

I have the same problem.

However It's not clear if they're all false positives (I suspect not)

It would be better to move the warning to W=2 or so, and also needs
someone actually looking at them.

-Andi
