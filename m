From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the clk tree
Date: Tue, 2 Jan 2018 11:58:30 -0800
Message-ID: <20180102195830.GK7997@codeaurora.org>
References: <20180102085134.198ea1f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:46658 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751014AbeABT6c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Jan 2018 14:58:32 -0500
Content-Disposition: inline
In-Reply-To: <20180102085134.198ea1f7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@baylibre.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Georgi Djakov <georgi.djakov@linaro.org>

On 01/02, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: "clk_regmap_mux_div_ops" [drivers/clk/qcom/apcs-msm8916.ko] undefined!
> ERROR: "__mux_div_set_src_div" [drivers/clk/qcom/apcs-msm8916.ko] undefined!
> 
> Caused by commit
> 
>   8a77f61118a2 ("clk: qcom: Add APCS clock controller support")
> 
> I have used the clk tree from next-20171222 for today.
> 

Thanks for the report. I've fixed it up and I'm going to roll
more build coverage into my scripts now.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
