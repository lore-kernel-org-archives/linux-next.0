From: Kevin Hilman <khilman@kernel.org>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Fri, 12 Jun 2015 11:19:59 -0700
Message-ID: <7hlhfobxgw.fsf@deeprootsystems.com>
References: <1434069014.28544.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:33045 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751854AbbFLSUE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Jun 2015 14:20:04 -0400
Received: by igbpi8 with SMTP id pi8so17628396igb.0
        for <linux-next@vger.kernel.org>; Fri, 12 Jun 2015 11:20:03 -0700 (PDT)
In-Reply-To: <1434069014.28544.1.camel@ellerman.id.au> (Michael Ellerman's
	message of "Fri, 12 Jun 2015 10:30:14 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dinguyen@opensource.altera.com, rmk+kernel@arm.linux.org.uk

Michael Ellerman <mpe@ellerman.id.au> writes:

> Hi all,
>
> After merging the arm-soc tree, today's linux-next build (arm_multi_v7_defconfig)
> failed like this:
>
>   scripts/Makefile.build:258: recipe for target 'arch/arm/mach-socfpga/platsmp.o' failed
>   arch/arm/mach-socfpga/platsmp.c:66:23: error: 'socfpga_secondary_startup' undeclared (first use in this function)
>      writel(virt_to_phys(socfpga_secondary_startup),
>                        ^
>
> Caused by the interaction of commits 45be0cdb5323 "ARM: socfpga: add
> CPU_METHOD_OF_DECLARE for Arria 10" and 02b4e2756e01 "ARM: v7 setup function
> should invalidate L1 cache".

I found this as well, unfortunately after it was already pulled for -next.

> I applied the following fix for today.

Yes, that's the right fix, and arm-soc now has the equivalent fix as
well.

Thanks,

Kevin
