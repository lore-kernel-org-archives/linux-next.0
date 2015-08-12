From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the clk tree
Date: Wed, 12 Aug 2015 01:03:18 -0700
Message-ID: <20150812080318.GL26614@codeaurora.org>
References: <20150812171912.03110efc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:38761 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933731AbbHLIDV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2015 04:03:21 -0400
Content-Disposition: inline
In-Reply-To: <20150812171912.03110efc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>

On 08/12, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: "pm_genpd_init" [drivers/clk/qcom/clk-qcom.ko] undefined!
> 
> Caused by commit
> 
>   0c4172846b0b ("clk: qcom: Add support for GDSCs")
> 
> I have used the clk tree from next-20150810 for today.

Thanks. I've removed these patches from the clk tree until this
is resolved.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
