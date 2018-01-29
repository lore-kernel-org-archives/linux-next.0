From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Mon, 29 Jan 2018 15:41:46 +1100
Message-ID: <874ln52s51.fsf@concordia.ellerman.id.au>
References: <20180125164937.32fef5a8@canb.auug.org.au> <CAL_JsqKfKHL8fUxEwhrfytLfWgMLLtbBm2J6vf0Ab1t4i28nRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKfKHL8fUxEwhrfytLfWgMLLtbBm2J6vf0Ab1t4i28nRA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Rob Herring <robh@kernel.org> writes:

> On Wed, Jan 24, 2018 at 11:49 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Bjorn,
>>
>> After merging the pci tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>>
>> arch/powerpc/kernel/pci-common.c: In function 'pcibios_setup
>> _device':
>> arch/powerpc/kernel/pci-common.c:406:15: error: 'virq' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>   pci_dev->irq = virq;
>>   ~~~~~~~~~~~~~^~~~~~
>> arch/powerpc/kernel/pci-common.c:365:15: note: 'virq' was declared here
>>   unsigned int virq;
>>                ^~~~
>
> I guess I need to update my PPC compiler from 4.8.0. It doesn't warn
> or error on this. Neither did 0-day.

https://toolchains.free-electrons.com/

Has 5.4.0 and 7.2.0 for both big and little endian.

cheers
