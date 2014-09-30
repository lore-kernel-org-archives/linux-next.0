From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Tue, 30 Sep 2014 09:45:49 +0800
Message-ID: <542A0B4D.5060209@hisilicon.com>
References: <20140926115539.6873630b@canb.auug.org.au> <20140930101200.1239cd52@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:31410 "EHLO
	szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754977AbaI3BqI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Sep 2014 21:46:08 -0400
In-Reply-To: <20140930101200.1239cd52@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zhangfei Gao <zhangfei.gao@linaro.org>, Jiancheng Xue <xuejiancheng@huawei.com>



On 2014/9/30 8:12, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 26 Sep 2014 11:55:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the arm-soc tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> Error: arch/arm/boot/dts/hisi-x5hd2.dtsi:374.22-23 syntax error
>> FATAL ERROR: Unable to parse input tree 
> OK, now I get:
> 
> Error: /scratch/sfr/next/arch/arm/boot/dts/hisi-x5hd2.dtsi:417.21-22 syntax error
> FATAL ERROR: Unable to parse input tree
> Are you guys really testing this stuff? :-(

Hi Stephen, Olof, Arnd,

Sorry for my fault and bring so much trouble to all of you.
I sent this pull request before the clock patch set being accepted.
And I did forget to compile the dtb. 
But I will make sure it will *not* happen next time.
Arnd has already helped to revert the series of this patch set in arm-soc.git:next/dt.

Hi Arnd, Olof,

Could you please help to revert this series of patch set in arm-soc.git:for-next?
Thanks!

Best Regards,
Wei
 
>> There are a series of new commits to this file today and I have no idea
>> which one caused the problem.
>>
>> I reverted:
>>
>> 610bd8722ef4	"ARM: dts: hix5hd2: add wdg node"
> 
> Reverted in the arm-soc tree.
> 
>> 6868feb6dd97	"ARM: dts: hix5hd2: add gpio node"
> 
> Error is now:
> 
> Error: /scratch/sfr/next/arch/arm/boot/dts/hisi-x5hd2.dtsi:183.21-22 syntax error
> 
>> 420a2d55f046	"ARM: dts: hix5hd2: add sata node"
> 
> Error: /scratch/sfr/next/arch/arm/boot/dts/hisi-x5hd2.dtsi:183.21-22 syntax error
> 
> 
>> f16c7fb2f3ff	"ARM: dts: hix5hd2: add usb node"
> 
> Error: /scratch/sfr/next/arch/arm/boot/dts/hisi-x5hd2.dtsi:183.21-22 syntax error
> 
>> b196e1ca400d	"ARM: dts: hix5hd2: add mmc node"
> 
> Error: /scratch/sfr/next/arch/arm/boot/dts/hisi-x5hd2.dtsi:174.21-22 syntax error
> 
>> de8b6054780e	"ARM: dts: hix5hd2: add gmac node"
> 
> no more errors.
> 
