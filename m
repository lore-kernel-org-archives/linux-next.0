From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: linux-next: build warning after merge of the thermal tree
Date: Wed, 24 Aug 2016 15:56:13 +0800
Message-ID: <1472025373.2682.42.camel@intel.com>
References: <20160824133833.3e92892a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:16050 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751576AbcHXH5G (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Aug 2016 03:57:06 -0400
In-Reply-To: <20160824133833.3e92892a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>, Leo Yan <leo.yan@linaro.org>

On 三, 2016-08-24 at 13:38 +1000, Stephen Rothwell wrote:
> Hi Zhang,
> 
> After merging the thermal tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
> 
> warning: (HISI_THERMAL) selects STUB_CLK_HI6220 which has unmet
> direct dependencies (COMMON_CLK && COMMON_CLK_HI6220 && MAILBOX)
> 
> Introduced by commit
> 
>   5f63581ce68e ("thermal: hisilicon: Add dependency on the clock
> driver to allow frequency scaling")
> 
> BTW: That commit message does not match the change (which adds a
> "select" not a "depends on".
> 
Right, thanks for reporting the issue. Patch dropped from thermal -next
tree.

thanks,
rui
