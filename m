From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Subject: Re: linux-next: build failure after merge of the keystone tree
Date: Sun, 22 Oct 2017 20:23:19 -0700
Message-ID: <3ed1f18a-204c-961a-9d81-b36e00d4aaf5@oracle.com>
References: <20171010071924.ddxkylkwq44qh47q@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:45895 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbdJWDXz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 22 Oct 2017 23:23:55 -0400
In-Reply-To: <20171010071924.ddxkylkwq44qh47q@sirena.co.uk>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Franklin S Cooper Jr <fcooper@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, linux-arm-kernel@lists.infradead.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 10/10/17 12:19 AM, Mark Brown wrote:
> Hi Santosh,
> 
> After merging the keystone tree, today's linux-next build
> (multi_v7_defconfig) failed like this:
> 
>    DTC     arch/arm/boot/dts/keystone-k2g-evm.dtb
> Error: /home/broonie/tmpfs/next/arch/arm/boot/dts/keystone-k2g-evm.dts:150.1-15 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:316: recipe for target 'arch/arm/boot/dts/keystone-k2g-evm.dtb' failed
> make[2]: *** [arch/arm/boot/dts/keystone-k2g-evm.dtb] Error 1
> 
> Caused by commit
> 
>     a6f244505915f ("ARM: dts: keystone-k2g-evm: Add I2C EEPROM DT entry")
> 
> I've used the keystone tree from yesterday.
> 
I fixed this next day but forgot to reply to you Mark.

Regards,
Santosh
