From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: linux-next: build warning after merge of the clk tree
Date: Tue, 5 May 2015 21:41:26 -0700
Message-ID: <20150506044126.GA2817@codeaurora.org>
References: <20150506140543.426ed29b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49057 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750779AbbEFEl2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2015 00:41:28 -0400
Content-Disposition: inline
In-Reply-To: <20150506140543.426ed29b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@linaro.org>, Heiko Stuebner <heiko@sntech.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/06, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the clk tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/clk/clk.c:2231:13: warning: 'clk_is_orphan' defined but not used [-Wunused-function]
>  static bool clk_is_orphan(const struct clk *clk)
>              ^
> 
> Introduced by commit ece3ffbe1b7b ("clk: prevent orphan clocks from
> being used").
> 
> CONFIG_OF is not set for this build ...

Thanks for the report. kbuild robot also reported this problem
the other day. We came up with a way to not have this function at
all though so this problem should go away tomorrow.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
