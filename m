From: Bintian <bintian.wang@huawei.com>
Subject: Re: linux-next: manual merge of the clk tree with the imx-mxs tree
Date: Fri, 29 May 2015 20:33:26 +0800
Message-ID: <55685C96.5020702@huawei.com>
References: <20150529204553.3198ba2c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:34674 "EHLO
	szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752833AbbE2Md5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2015 08:33:57 -0400
In-Reply-To: <20150529204553.3198ba2c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Huxinwei <huxinwei@huawei.com>

Hello Stephen,

Thank you very much for this fix.

BR,

Bintian

On 2015/5/29 18:45, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the clk tree got a conflict in
> drivers/clk/Makefile between commit 33156149fc4a ("ARM: imx: move clock
> drivers into drivers/clk") from the imx-mxs tree and commit
> b1691707eccd ("clk: hi6220: Clock driver support for Hisilicon hi6220
> SoC") from the clk tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>
