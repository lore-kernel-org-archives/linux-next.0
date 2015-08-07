From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the clk tree
Date: Fri, 7 Aug 2015 16:56:56 -0700
Message-ID: <20150807235656.GA9678@codeaurora.org>
References: <20150727141117.1153348e@canb.auug.org.au>
 <20150803100825.GN16878@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:37318 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946411AbbHGX47 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Aug 2015 19:56:59 -0400
Content-Disposition: inline
In-Reply-To: <20150803100825.GN16878@atomide.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Turquette <mturquette@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>

On 08/03, Tony Lindgren wrote:
> 
> Sorry for the delay in replying, I was offline for a few days. Thanks
> for fixing it up. I assume no need to apply this fix into arm-soc
> for-next but please let me know if you prefer that.
> 

Can we apply it into arm-soc. I'm worried we're going to forget
about it, and having the include there in arm-soc (where
a3314e9cf69c isn't present) doesn't hurt anything from what I can
tell.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
