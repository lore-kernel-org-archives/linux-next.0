From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 6 (*msi.c but ! PCI_MSI)
Date: Wed, 6 Sep 2017 08:53:04 -0700
Message-ID: <ab28c8c3-94b9-5448-ca91-307c686a1903@infradead.org>
References: <20170906155720.581b9204@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170906155720.581b9204@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 09/05/17 22:57, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any v4.15 related material to your linux-next
> included branches until after v4.14-rc1 has been released.
> 
> Changes since 20170905:
> 

on i386:

CONFIG_PCI is not enabled, so CONFIG_PCI_MSI is not enabled.


../kernel/irq/msi.c: In function 'msi_domain_alloc_irqs':
../kernel/irq/msi.c:352:19: error: storage size of 'arg' isn't known
  msi_alloc_info_t arg;
                   ^

../drivers/base/platform-msi.c:37:19: error: field 'arg' has incomplete type
  msi_alloc_info_t arg;
                   ^



-- 
~Randy
