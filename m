From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the sunxi tree
Date: Fri, 28 Jul 2017 10:56:21 +0800
Message-ID: <CAGb2v64K0LphLKda6E9DPDRXidZAoEaR+xtLBjcu5BRhRwqFPQ@mail.gmail.com>
References: <20170728092344.19e88504@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:50534 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751743AbdG1C4t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Jul 2017 22:56:49 -0400
In-Reply-To: <20170728092344.19e88504@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marcus Cooper <codekipper@gmail.com>

On Fri, Jul 28, 2017 at 7:23 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Commit
>
>   eabd9a7a9053 ("ARM: dts: sun8i: h3: Enable USB OTG on the Beelink X2")
>
> is missing a Signed-off-by from its committer.

Thanks. I was cleaning up some branches before sending out pull requests.
Apparently I missed a patch that was rebased.

I just added the missing SoB and redid the for-next branch.

ChenYu
