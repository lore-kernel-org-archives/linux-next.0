From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: manual merge of the moduleh tree with the arm tree
Date: Thu, 25 Aug 2011 18:40:54 -0400
Message-ID: <4E56CF76.70201@windriver.com>
References: <20110825151748.8e41e0ded739187a1432cf0b@canb.auug.org.au> <4E56796F.8090703@windriver.com> <20110825163901.GA467@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:63237 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755725Ab1HYWlJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Aug 2011 18:41:09 -0400
In-Reply-To: <20110825163901.GA467@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Medhurst <tixy@yxit.co.uk>

On 11-08-25 12:39 PM, Russell King wrote:
> On Thu, Aug 25, 2011 at 12:33:51PM -0400, Paul Gortmaker wrote:
>> On 11-08-25 01:17 AM, Stephen Rothwell wrote:
>>> Hi Paul,
>>>
>>> Today's linux-next merge of the moduleh tree got a conflict in
>>> arch/arm/mach-bcmring/mm.c between commit 2d5e975b2194 ("ARM:
>>> mach-bcmring: Setup consistent dma size at boot time") from the arm tree
>>> and commit 9bc7d81e271e ("arm: fix implicit use of page.h in
>>> mach-bcmring/mach-jornada") from the moduleh tree.
>>
>> I can't really relocate the page.h inclusion in a trivial way to
>> make this conflict go away.  But since the implicit header use fixes
>> for arm are independent and don't actually depend on anything in the
>> rest of the module.h tree, I can set about to giving these to Russell
>> for his arm-next branch anytime.  I'll do that shortly.
> 
> For such a trivial conflict, I don't think we need to do anything.  Linus
> has said publically that he likes to sort out conflicts as it allows him
> to have a wider knowledge of what's going on in the kernel tree.
> 
> So, given that the fixup is soo obvious, I don't think we need to play
> games redistributing patches - we just need to be aware of the conflict
> and mention it to Linus when we merge.

OK.  I was entertaining feeding some of the really obvious and simple
parts of the moduleh branch out to the various maintainers just to
reduce its overall size, but in the end I guess that just makes work
for me and them -- vs. a single pull request to Linus for addition to
v3.2-rc1.   I'll just stay the course and Stephen will have to rerere
the merge conflict resolution for a while -- something I'm certain
that he has automated long long ago.

Thanks,
Paul.
