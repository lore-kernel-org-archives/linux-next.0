From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] clk: Properly initialize reference count
Date: Thu, 31 Oct 2013 13:09:11 -0600
Message-ID: <5272AAD7.9050305@wwwdotorg.org>
References: <1383220962-26836-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:51280 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750763Ab3JaTJO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2013 15:09:14 -0400
In-Reply-To: <1383220962-26836-1-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 10/31/2013 06:02 AM, Thierry Reding wrote:
> Commit a336ed7 (clk: Implement clk_unregister()) initializes the kref in
> clk_set_parent(), which is obviously the wrong place. Further research
> shows that the original patches initialized it correctly, so it probably
> ended up in clk_set_parent() by mistake during manual application of the
> patch.

Tested-by: Stephen Warren <swarren@nvidia.com>

BTW, it'd be nice to Cc fixes like this to linux-next@vger.kernel.org; I
/might/ have avoided doing a bisect if I'd seen this patch first!

I see the benefit of that "linux-next plus today's accumulated
bug-fixes" tree that I think you proposed:-)
