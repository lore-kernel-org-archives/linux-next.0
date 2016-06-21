From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: build warnings after merge of the pci tree
Date: Mon, 20 Jun 2016 20:27:03 -0500
Message-ID: <CAErSpo4inaqMVUpkN0Ps_ZAu=VDdwCR37Uqm+0AijWPPQJGDkw@mail.gmail.com>
References: <20160620115213.07231836@canb.auug.org.au> <20160620191136.GA17036@localhost>
 <20160621110838.4d4f1171@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160621110838.4d4f1171@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-next list <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 20, 2016 at 8:08 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Bjorn,
>
> On Mon, 20 Jun 2016 14:11:36 -0500 Bjorn Helgaas <helgaas@kernel.org> wrote:
>>
>> On Mon, Jun 20, 2016 at 11:52:13AM +1000, Stephen Rothwell wrote:
>> > Hi Bjorn,
>> >
>> > After merging the pci tree, today's linux-next build (arm
>> > multi_v7_defconfig) produced these warnings:
>> >
>> > drivers/pci/host/pci-host-common.c: In function 'gen_pci_init':
>> > drivers/pci/host/pci-host-common.c:88:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
>> >    return err;
>> >           ^
>> > drivers/pci/host/pci-host-common.c:93:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
>> >    return PTR_ERR(cfg);
>> >           ^
>> > drivers/pci/host/pci-host-common.c:108:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
>> >   return err;
>> >          ^
>> >
>> > Introduced by commit
>> >
>> >   3f8dcfc3fbba ("PCI: generic: Free resource list close to where it's allocated")
>>
>> Fixed, thanks a lot, Stephen!
>
> Thanks.  Unfortunately, I still get this warning:
>
> drivers/pci/host/pci-host-common.c: In function 'gen_pci_init':
> drivers/pci/host/pci-host-common.c:93:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
>    return PTR_ERR(cfg);
>           ^

Crap, sorry, PTR_ERR/ERR_PTR confusion.  I *think* I fixed it now.

Bjorn
