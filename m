From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the clk tree
Date: Wed, 13 Dec 2017 16:57:38 -0800
Message-ID: <20171214005738.GU7997@codeaurora.org>
References: <20171211101632.6ebe90eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:40748 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750749AbdLNA5l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Dec 2017 19:57:41 -0500
Content-Disposition: inline
In-Reply-To: <20171211101632.6ebe90eb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@baylibre.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>, Taniya Das <tdas@codeaurora.org>

On 12/11, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: "clk_alpha_pll_regs" [drivers/clk/qcom/mmcc-msm8996.ko] undefined!
> ERROR: "clk_alpha_pll_regs" [drivers/clk/qcom/gcc-msm8996.ko] undefined!
> ERROR: "clk_alpha_pll_regs" [drivers/clk/qcom/gcc-msm8994.ko] undefined!
> ERROR: "clk_alpha_pll_regs" [drivers/clk/qcom/gcc-ipq8074.ko] undefined!
> ERROR: "clk_hw_is_enabled" [drivers/clk/qcom/clk-qcom.ko] undefined!
> 
> Caused by commits
> 
>   d1506b749e92 ("clk: qcom: support for alpha pll properties")
>   e66a4d6d0081 ("clk: qcom: support for dynamic updating the PLL")
>   301803e6013b ("clk: qcom: support Huayra type Alpha PLL")
> 
> I have used the clk tree from next-20171208 for today.
> 

Thanks. I believe this is fixed up now.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
