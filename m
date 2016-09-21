From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 21 Sep 2016 15:59:51 +1000
Message-ID: <20160921155951.233be061@canb.auug.org.au>
References: <20160920164414.4062bb0b@canb.auug.org.au>
        <20160920173012.1abe1d84@canb.auug.org.au>
        <87mvj2srvj.fsf@concordia.ellerman.id.au>
        <20160921091622.53067648@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56728 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752340AbcIUF7y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Sep 2016 01:59:54 -0400
In-Reply-To: <20160921091622.53067648@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "bauerman@linux.vnet.ibm.com" <bauerman@linux.vnet.ibm.com>

Hi all,

On Wed, 21 Sep 2016 09:16:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Tue, 20 Sep 2016 22:00:32 +1000 Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Ah yep looks like that's the problem, patch below should fix it?  
> 
> Yeah, I am just going to (logically) run "sed 's/CONFIG_WORD_SIZE/BITS/'"
> over the tree during the merge of the apm-current tree today.
> 
> > I think I'd actually prefer it if purgatory didn't redefine the CFLAGS
> > from scratch, so I'll see if Thiago can do that and send a new version.  
> 
> That could be better, but there are still some additions of
> CONFIG_WORD_SIZE elsewhere :-(

So here is the relevant parts of the merge resolution for merging the
akpm-current tree today.

diff --cc arch/powerpc/kernel/Makefile
index 1925341dbb9c,d12a84003283..e59ed6af0523
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@@ -104,11 -104,12 +104,12 @@@ obj-$(CONFIG_STACKTRACE)	+= stacktrace.
  obj-$(CONFIG_SWIOTLB)		+= dma-swiotlb.o
  
  pci64-$(CONFIG_PPC64)		+= pci_dn.o pci-hotplug.o isa-bridge.o
 -obj-$(CONFIG_PCI)		+= pci_$(CONFIG_WORD_SIZE).o $(pci64-y) \
 +obj-$(CONFIG_PCI)		+= pci_$(BITS).o $(pci64-y) \
  				   pci-common.o pci_of_scan.o
  obj-$(CONFIG_PCI_MSI)		+= msi.o
- obj-$(CONFIG_KEXEC)		+= machine_kexec.o crash.o \
+ obj-$(CONFIG_KEXEC_CORE)	+= machine_kexec.o crash.o \
 -				   machine_kexec_$(CONFIG_WORD_SIZE).o
 -obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf_$(CONFIG_WORD_SIZE).o
 +				   machine_kexec_$(BITS).o
++obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf_$(BITS).o
  obj-$(CONFIG_AUDIT)		+= audit.o
  obj64-$(CONFIG_AUDIT)		+= compat_audit.o
  
@@@ -123,6 -124,12 +124,12 @@@ ifneq ($(CONFIG_PPC_INDIRECT_PIO),y
  obj-y				+= iomap.o
  endif
  
+ ifneq ($(CONFIG_MODULES)$(CONFIG_KEXEC_FILE),)
 -ifeq ($(CONFIG_WORD_SIZE),64)
++ifeq ($(BITS),64)
+ obj-y				+= elf_util.o elf_util_64.o
+ endif
+ endif
+ 
  obj64-$(CONFIG_PPC_TRANSACTIONAL_MEM)	+= tm.o
  
  obj-$(CONFIG_PPC64)		+= $(obj64-y)
diff --cc arch/powerpc/purgatory/Makefile
index 000000000000,fea0308c7f01..bc3b9dc6eead
mode 000000,100644..100644
--- a/arch/powerpc/purgatory/Makefile
+++ b/arch/powerpc/purgatory/Makefile
@@@ -1,0 -1,48 +1,48 @@@
+ OBJECT_FILES_NON_STANDARD := y
+ 
+ purgatory-y := purgatory.o printf.o string.o v2wrap.o hvCall.o \
+ 		purgatory-ppc64.o console-ppc64.o crashdump_backup.o \
+ 		crtsavres.o sha256.o
+ 
+ targets += $(purgatory-y)
+ PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
+ 
+ LDFLAGS_purgatory.ro := -e purgatory_start -r --no-undefined -nostartfiles \
+ 			-nostdlib -nodefaultlibs
+ targets += purgatory.ro
+ 
+ # Default KBUILD_CFLAGS can have -pg option set when FTRACE is enabled. That
+ # in turn leaves some undefined symbols like __fentry__ in purgatory and not
+ # sure how to relocate those. Like kexec-tools, use custom flags.
+ 
+ KBUILD_CFLAGS := -Wall -Wstrict-prototypes -fno-strict-aliasing \
+ 		-fno-zero-initialized-in-bss -fno-builtin -ffreestanding \
+ 		-fno-PIC -fno-PIE -fno-stack-protector  -fno-exceptions \
 -		-msoft-float -MD -Os -m$(CONFIG_WORD_SIZE)
 -KBUILD_AFLAGS := -fno-exceptions -msoft-float -m$(CONFIG_WORD_SIZE) \
++		-msoft-float -MD -Os -m$(BITS)
++KBUILD_AFLAGS := -fno-exceptions -msoft-float -m$(BITS) \
+ 		-D__ASSEMBLY__
+ 
+ ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
+ KBUILD_CFLAGS += $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc)) \
+ 		-mlittle-endian
+ KBUILD_AFLAGS += $(call cc-option,-mabi=elfv2) -mlittle-endian
+ else
+ KBUILD_CFLAGS += $(call cc-option,-mcall-aixdesc) -mbig-endian
+ KBUILD_AFLAGS += -mbig-endian
+ endif
+ 
+ $(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
+ 		$(call if_changed,ld)
+ 
+ targets += kexec-purgatory.c
+ 
+ CMD_BIN2C = $(objtree)/scripts/basic/bin2c
+ quiet_cmd_bin2c = BIN2C   $@
+       cmd_bin2c = $(CMD_BIN2C) kexec_purgatory < $< > $@
+ 
+ $(obj)/kexec-purgatory.c: $(obj)/purgatory.ro FORCE
+ 	$(call if_changed,bin2c)
+ 	@:
+ 
+ 
+ obj-$(CONFIG_KEXEC_FILE)	+= kexec-purgatory.o

-- 
Cheers,
Stephen Rothwell
