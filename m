From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the kvm tree
Date: Mon, 10 Apr 2017 13:52:42 +1000
Message-ID: <20170410135242.0861e014@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Hogan <james.hogan@imgtec.com>, Alexander Graf <agraf@suse.de>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvm-arm tree got conflicts in:

  Documentation/virtual/kvm/api.txt
  include/uapi/linux/kvm.h

between commits:

  a8a3c426772e ("KVM: MIPS: Add VZ & TE capabilities")
  578fd61d2d21 ("KVM: MIPS: Add 64BIT capability")

from the kvm tree and commit:

  3fe17e682616 ("KVM: arm/arm64: Add ARM user space interrupt signaling ABI")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/virtual/kvm/api.txt
index 1a184843bf9c,3b4e76e5201e..000000000000
--- a/Documentation/virtual/kvm/api.txt
+++ b/Documentation/virtual/kvm/api.txt
@@@ -4030,67 -4148,44 +4030,108 @@@ available, means that that the kernel c
  hashed page table MMU defined in Power ISA V3.00 (as implemented in
  the POWER9 processor), including in-memory segment tables.
  
 +8.5 KVM_CAP_MIPS_VZ
 +
 +Architectures: mips
 +
 +This capability, if KVM_CHECK_EXTENSION on the main kvm handle indicates that
 +it is available, means that full hardware assisted virtualization capabilities
 +of the hardware are available for use through KVM. An appropriate
 +KVM_VM_MIPS_* type must be passed to KVM_CREATE_VM to create a VM which
 +utilises it.
 +
 +If KVM_CHECK_EXTENSION on a kvm VM handle indicates that this capability is
 +available, it means that the VM is using full hardware assisted virtualization
 +capabilities of the hardware. This is useful to check after creating a VM with
 +KVM_VM_MIPS_DEFAULT.
 +
 +The value returned by KVM_CHECK_EXTENSION should be compared against known
 +values (see below). All other values are reserved. This is to allow for the
 +possibility of other hardware assisted virtualization implementations which
 +may be incompatible with the MIPS VZ ASE.
 +
 + 0: The trap & emulate implementation is in use to run guest code in user
 +    mode. Guest virtual memory segments are rearranged to fit the guest in the
 +    user mode address space.
 +
 + 1: The MIPS VZ ASE is in use, providing full hardware assisted
 +    virtualization, including standard guest virtual memory segments.
 +
 +8.6 KVM_CAP_MIPS_TE
 +
 +Architectures: mips
 +
 +This capability, if KVM_CHECK_EXTENSION on the main kvm handle indicates that
 +it is available, means that the trap & emulate implementation is available to
 +run guest code in user mode, even if KVM_CAP_MIPS_VZ indicates that hardware
 +assisted virtualisation is also available. KVM_VM_MIPS_TE (0) must be passed
 +to KVM_CREATE_VM to create a VM which utilises it.
 +
 +If KVM_CHECK_EXTENSION on a kvm VM handle indicates that this capability is
 +available, it means that the VM is using trap & emulate.
 +
 +8.7 KVM_CAP_MIPS_64BIT
 +
 +Architectures: mips
 +
 +This capability indicates the supported architecture type of the guest, i.e. the
 +supported register and address width.
 +
 +The values returned when this capability is checked by KVM_CHECK_EXTENSION on a
 +kvm VM handle correspond roughly to the CP0_Config.AT register field, and should
 +be checked specifically against known values (see below). All other values are
 +reserved.
 +
 + 0: MIPS32 or microMIPS32.
 +    Both registers and addresses are 32-bits wide.
 +    It will only be possible to run 32-bit guest code.
 +
 + 1: MIPS64 or microMIPS64 with access only to 32-bit compatibility segments.
 +    Registers are 64-bits wide, but addresses are 32-bits wide.
 +    64-bit guest code may run but cannot access MIPS64 memory segments.
 +    It will also be possible to run 32-bit guest code.
 +
 + 2: MIPS64 or microMIPS64 with access to all address segments.
 +    Both registers and addresses are 64-bits wide.
 +    It will be possible to run 64-bit or 32-bit guest code.
+ 
 -8.5 KVM_CAP_ARM_USER_IRQ
++8.8 KVM_CAP_ARM_USER_IRQ
+ 
+ Architectures: arm, arm64
+ This capability, if KVM_CHECK_EXTENSION indicates that it is available, means
+ that if userspace creates a VM without an in-kernel interrupt controller, it
+ will be notified of changes to the output level of in-kernel emulated devices,
+ which can generate virtual interrupts, presented to the VM.
+ For such VMs, on every return to userspace, the kernel
+ updates the vcpu's run->s.regs.device_irq_level field to represent the actual
+ output level of the device.
+ 
+ Whenever kvm detects a change in the device output level, kvm guarantees at
+ least one return to userspace before running the VM.  This exit could either
+ be a KVM_EXIT_INTR or any other exit event, like KVM_EXIT_MMIO. This way,
+ userspace can always sample the device output level and re-compute the state of
+ the userspace interrupt controller.  Userspace should always check the state
+ of run->s.regs.device_irq_level on every kvm exit.
+ The value in run->s.regs.device_irq_level can represent both level and edge
+ triggered interrupt signals, depending on the device.  Edge triggered interrupt
+ signals will exit to userspace with the bit in run->s.regs.device_irq_level
+ set exactly once per edge signal.
+ 
+ The field run->s.regs.device_irq_level is available independent of
+ run->kvm_valid_regs or run->kvm_dirty_regs bits.
+ 
+ If KVM_CAP_ARM_USER_IRQ is supported, the KVM_CHECK_EXTENSION ioctl returns a
+ number larger than 0 indicating the version of this capability is implemented
+ and thereby which bits in in run->s.regs.device_irq_level can signal values.
+ 
+ Currently the following bits are defined for the device_irq_level bitmap:
+ 
+   KVM_CAP_ARM_USER_IRQ >= 1:
+ 
+     KVM_ARM_DEV_EL1_VTIMER -  EL1 virtual timer
+     KVM_ARM_DEV_EL1_PTIMER -  EL1 physical timer
+     KVM_ARM_DEV_PMU        -  ARM PMU overflow interrupt signal
+ 
+ Future versions of kvm may implement additional events. These will get
+ indicated by returning a higher number from KVM_CHECK_EXTENSION and will be
+ listed above.
diff --cc include/uapi/linux/kvm.h
index 1e1a6c728a18,6d6b9b237f0b..000000000000
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@@ -887,9 -883,7 +887,10 @@@ struct kvm_ppc_resize_hpt 
  #define KVM_CAP_PPC_MMU_RADIX 134
  #define KVM_CAP_PPC_MMU_HASH_V3 135
  #define KVM_CAP_IMMEDIATE_EXIT 136
 -#define KVM_CAP_ARM_USER_IRQ 137
 +#define KVM_CAP_MIPS_VZ 137
 +#define KVM_CAP_MIPS_TE 138
 +#define KVM_CAP_MIPS_64BIT 139
++#define KVM_CAP_ARM_USER_IRQ 140
  
  #ifdef KVM_CAP_IRQ_ROUTING
  
