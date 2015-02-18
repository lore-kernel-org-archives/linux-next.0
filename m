From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 18 (x86)
Date: Wed, 18 Feb 2015 14:45:23 -0800
Message-ID: <54E51603.8040601@infradead.org>
References: <20150218142237.2cc68be5@canb.auug.org.au> <54E4DE1C.1020503@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48806 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751931AbbBRWp3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Feb 2015 17:45:29 -0500
In-Reply-To: <54E4DE1C.1020503@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, X86 ML <x86@kernel.org>, lguest@lists.ozlabs.org, Rusty Russell <rusty@rustcorp.com.au>

On 02/18/15 10:46, Randy Dunlap wrote:
> On 02/17/15 19:22, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any material destined for v3.21 to your linux-next
>> included trees until after v3.20-rc1 has been released.
>>
>> Changes since 20150217:
>>
> 
> 
> on i386, when CONFIG_PCI is not enabled:
> 
> arch/x86/built-in.o: In function `early_put_chars':
> boot.c:(.init.text+0x70): undefined reference to `write_pci_config_byte'
> boot.c:(.init.text+0x90): undefined reference to `write_pci_config'
> boot.c:(.init.text+0xb2): undefined reference to `write_pci_config'
> boot.c:(.init.text+0xc7): undefined reference to `write_pci_config'
> boot.c:(.init.text+0xe0): undefined reference to `early_pci_allowed'
> boot.c:(.init.text+0x10a): undefined reference to `read_pci_config'
> boot.c:(.init.text+0x126): undefined reference to `read_pci_config'
> boot.c:(.init.text+0x150): undefined reference to `read_pci_config_byte'
> boot.c:(.init.text+0x17a): undefined reference to `read_pci_config_byte'
> boot.c:(.init.text+0x19c): undefined reference to `read_pci_config_byte'
> boot.c:(.init.text+0x1ba): undefined reference to `read_pci_config_byte'
> boot.c:(.init.text+0x1d8): undefined reference to `read_pci_config'
> boot.c:(.init.text+0x1f6): undefined reference to `read_pci_config'
> boot.c:(.init.text+0x23d): undefined reference to `read_pci_config_byte'
> arch/x86/built-in.o: In function `lguest_init':
> (.init.text+0x5f5): undefined reference to `pcibios_enable_irq'
> arch/x86/built-in.o: In function `lguest_init':
> (.init.text+0x5ff): undefined reference to `pcibios_disable_irq'
> 
> 
> Full randconfig file is attached.
> 

This is all lguest-related.  Looks like LGUEST_GUEST should also
depend on PCI (in arch/x86/lguest/Kconfig).


-- 
~Randy
