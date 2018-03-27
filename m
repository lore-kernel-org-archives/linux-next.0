From: Rob Herring <robh@kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Tue, 27 Mar 2018 11:53:09 -0500
Message-ID: <CAL_JsqL_VuUH0MZ72zz5QZRj_8SjgcG8f22yYD7ntB5XBEmJOA@mail.gmail.com>
References: <20180326123143.38630ea3@canb.auug.org.au> <20180326195336.GB224629@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180326195336.GB224629@bhelgaas-glaptop.roam.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <helgaas@kernel.org>, Scott Branden <sbranden@broadcom.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 26, 2018 at 2:53 PM, Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Mon, Mar 26, 2018 at 12:31:43PM +1100, Stephen Rothwell wrote:
>> Hi Bjorn,
>>
>> After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
>> failed like this:
>>
>> In file included from /home/sfr/next/next/drivers/pci/host/pcie-iproc.c:16:0:
>> /home/sfr/next/next/include/linux/irqchip/arm-gic-v3.h:560:10: fatal error: asm/arch_gicv3.h: No such file or directory
>>  #include <asm/arch_gicv3.h>
>>           ^~~~~~~~~~~~~~~~~~
>>
>> Caused by commit
>>
>>   af3c73473d10 ("PCI: Improve host drivers compile test coverage")
>>
>> I used the pci tree from next-20180323 for today.
>
> Thanks, I updated my tree to drop af3c73473d10 ("PCI: Improve host
> drivers compile test coverage") for now.
>
> I know Lorenzo is out this week, so he may not be able to do an
> update, but if you post a new version, Rob, I'll see if I can pull it
> in.

The simple fix is to just drop this hunk. Alternatively, we can add a
"depends on ARM_GIC_V3" and keep the compile coverage for arm64.

@@ -128,7 +128,7 @@ config PCIE_IPROC_PLATFORM

 config PCIE_IPROC_BCMA
        tristate "Broadcom iProc PCIe BCMA bus driver"
-       depends on ARM && (ARCH_BCM_IPROC || COMPILE_TEST)
+       depends on (ARM && ARCH_BCM_IPROC) || COMPILE_TEST
        select PCIE_IPROC
        select BCMA
        default ARCH_BCM_5301X
