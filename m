From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: build failure after merge of the clk tree
Date: Thu, 26 Feb 2015 10:09:21 +0100
Message-ID: <1424941761.27971.2.camel@AMDC1943>
References: <20150226131413.2aceaf7e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61523 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752761AbbBZJJZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Feb 2015 04:09:25 -0500
In-reply-to: <20150226131413.2aceaf7e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On czw, 2015-02-26 at 13:14 +1100, Stephen Rothwell wrote:
> Hi Mike,
> 
> After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/clk/clk.c: In function 'clk_disable_unused_subtree':
> drivers/clk/clk.c:514:3: error: label 'out' used but not defined
>    goto out;
>    ^
> 
> Caused by commit a2146f032294 ("clk: Use lockdep asserts to find
> missing hold of prepare_lock").  Commit c440525cb967 ("clk: Remove
> unneeded NULL checks") removed that label along with the NULL check
> that a2146f032294 reintroduces (was this a bad rebase?).  Please do
> simple build tests.
> 
> I have used the clk tree from next-20150225 for today.

Mike,

It seems that my patch did not applied cleanly and the merge introduced
such artifacts. My patch adds only lockdep_asserts and does not
influence the program flow. I can rebase and resend the patch if you
wish.

Best regards,
Krzysztof
