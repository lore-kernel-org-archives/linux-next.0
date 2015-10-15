From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Thu, 15 Oct 2015 10:40:45 +0800
Message-ID: <20151015104045.04136253@xhacker>
References: <20151015101920.7fa592f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:7525 "EHLO
	mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751875AbbJOCo7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Oct 2015 22:44:59 -0400
In-Reply-To: <20151015101920.7fa592f7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Thomas Hebb <tommyhebb@gmail.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Dear all,

On Thu, 15 Oct 2015 10:19:20 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the arm-soc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arch/arm/boot/dts/berlin2q.dtsi:62.24-25 syntax error
> FATAL ERROR: Unable to parse input tree

I just checked, this is caused by missing the following two commits

f72d787d9287 ("clk: berlin: move MAX_CLKS out of drivers/clk/berlin")

44b2e5f96d5e ("clk: berlin: add cpuclk")

Thanks,
Jisheng

> 
> I can't see what caused this error, so I have just used the arm-soc tree
> from next-20151013 for today.
> 
