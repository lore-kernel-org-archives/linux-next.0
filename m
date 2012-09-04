From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm-current tree
Date: Tue, 4 Sep 2012 13:11:02 +0000
Message-ID: <201209041311.02222.arnd@arndb.de>
References: <20120904160626.f1dcb67ebbb145053c49da8c@canb.auug.org.au> <20120904090132.GG24085@n2100.arm.linux.org.uk> <5045F7A0.1090400@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:58924 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756784Ab2IDNLM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Sep 2012 09:11:12 -0400
In-Reply-To: <5045F7A0.1090400@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 04 September 2012, Rob Herring wrote:
> Right. The PCI i/o reserved area has a dummy physical address of 0 and 
> needs to be skipped by ioremap searches. So we don't set 
> VM_ARM_STATIC_MAPPING to prevent matches by ioremap. The vm_struct settings
> don't really matter when we do the real mapping of the i/o space.
> 
> Here's my merge:

Ok, thanks for the clarification. I've merged Russell's fixes branch
into the cleanup/io-pci branch now to resolve the conflict.

	Arnd

>From 863e99a8c1ea2b0391491904297f57a0f6a1fdd6 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 4 Sep 2012 15:01:37 +0200
Subject: [PATCH] Merge commit 'a849088aa1' from rmk/fixes into cleanup/io-pci

As Stephen Rothwell reports, a849088aa155 ("ARM: Fix ioremap() of
address zero") from the arm-current tree and commit c2794437091a ("ARM:
Add fixed PCI i/o mapping") from the arm-soc tree conflict in
a nontrivial way in arch/arm/mm/mmu.c.

Rob Herring explains:
The PCI i/o reserved area has a dummy physical address of 0 and
needs to be skipped by ioremap searches. So we don't set
VM_ARM_STATIC_MAPPING to prevent matches by ioremap. The vm_struct
settings don't really matter when we do the real mapping of the
i/o space.

Since commit a849088aa155 is at the start of the fixes branch
in the arm tree, we can merge it into the branch that contains
the other ioremap changes.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>

diff --cc arch/arm/Kconfig
index 58bb75e,6d6e18f..01790958
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig

diff --cc arch/arm/mm/mmu.c
index 714a7fd,eab94bc..a7a9e41
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@@ -792,19 -785,6 +786,19 @@@ void __init iotable_init(struct map_des
  	}
  }
  
 +void __init vm_reserve_area_early(unsigned long addr, unsigned long size,
 +				  void *caller)
 +{
 +	struct vm_struct *vm;
 +
 +	vm = early_alloc_aligned(sizeof(*vm), __alignof__(*vm));
 +	vm->addr = (void *)addr;
 +	vm->size = size;
- 	vm->flags = VM_IOREMAP | VM_ARM_STATIC_MAPPING;
++	vm->flags = VM_IOREMAP | VM_ARM_EMPTY_MAPPING;
 +	vm->caller = caller;
 +	vm_area_add_early(vm);
 +}
 +
  #ifndef CONFIG_ARM_LPAE
  
  /*
