From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Fri, 26 Jan 2018 08:07:18 +1100
Message-ID: <20180126080718.767610c0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50443 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751173AbeAYVHZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Jan 2018 16:07:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@ozlabs.org>, Brijesh Singh <brijesh.singh@amd.com>

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  Documentation/virtual/kvm/api.txt

between commit:

  3214d01f139b ("KVM: PPC: Book3S: Provide information about hardware/firmware CVE workarounds")

from Linus' tree and commit:

  5acc5c063196 ("KVM: Introduce KVM_MEMORY_ENCRYPT_OP ioctl")

from the kvm tree.

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
index fc3ae951bc07,e5f1743e0b3e..000000000000
--- a/Documentation/virtual/kvm/api.txt
+++ b/Documentation/virtual/kvm/api.txt
@@@ -3403,52 -3403,56 +3403,102 @@@ invalid, if invalid pages are written t
  or if no page table is present for the addresses (e.g. when using
  hugepages).
  
 +4.108 KVM_PPC_GET_CPU_CHAR
 +
 +Capability: KVM_CAP_PPC_GET_CPU_CHAR
 +Architectures: powerpc
 +Type: vm ioctl
 +Parameters: struct kvm_ppc_cpu_char (out)
 +Returns: 0 on successful completion
 +	 -EFAULT if struct kvm_ppc_cpu_char cannot be written
 +
 +This ioctl gives userspace information about certain characteristics
 +of the CPU relating to speculative execution of instructions and
 +possible information leakage resulting from speculative execution (see
 +CVE-2017-5715, CVE-2017-5753 and CVE-2017-5754).  The information is
 +returned in struct kvm_ppc_cpu_char, which looks like this:
 +
 +struct kvm_ppc_cpu_char {
 +	__u64	character;		/* characteristics of the CPU */
 +	__u64	behaviour;		/* recommended software behaviour */
 +	__u64	character_mask;		/* valid bits in character */
 +	__u64	behaviour_mask;		/* valid bits in behaviour */
 +};
 +
 +For extensibility, the character_mask and behaviour_mask fields
 +indicate which bits of character and behaviour have been filled in by
 +the kernel.  If the set of defined bits is extended in future then
 +userspace will be able to tell whether it is running on a kernel that
 +knows about the new bits.
 +
 +The character field describes attributes of the CPU which can help
 +with preventing inadvertent information disclosure - specifically,
 +whether there is an instruction to flash-invalidate the L1 data cache
 +(ori 30,30,0 or mtspr SPRN_TRIG2,rN), whether the L1 data cache is set
 +to a mode where entries can only be used by the thread that created
 +them, whether the bcctr[l] instruction prevents speculation, and
 +whether a speculation barrier instruction (ori 31,31,0) is provided.
 +
 +The behaviour field describes actions that software should take to
 +prevent inadvertent information disclosure, and thus describes which
 +vulnerabilities the hardware is subject to; specifically whether the
 +L1 data cache should be flushed when returning to user mode from the
 +kernel, and whether a speculation barrier should be placed between an
 +array bounds check and the array access.
 +
 +These fields use the same bit definitions as the new
 +H_GET_CPU_CHARACTERISTICS hypercall.
 +
+ 4.109 KVM_MEMORY_ENCRYPT_OP
+ 
+ Capability: basic
+ Architectures: x86
+ Type: system
+ Parameters: an opaque platform specific structure (in/out)
+ Returns: 0 on success; -1 on error
+ 
+ If the platform supports creating encrypted VMs then this ioctl can be used
+ for issuing platform-specific memory encryption commands to manage those
+ encrypted VMs.
+ 
+ Currently, this ioctl is used for issuing Secure Encrypted Virtualization
+ (SEV) commands on AMD Processors. The SEV commands are defined in
+ Documentation/virtual/kvm/amd-memory-encryption.txt.
+ 
+ 4.110 KVM_MEMORY_ENCRYPT_REG_REGION
+ 
+ Capability: basic
+ Architectures: x86
+ Type: system
+ Parameters: struct kvm_enc_region (in)
+ Returns: 0 on success; -1 on error
+ 
+ This ioctl can be used to register a guest memory region which may
+ contain encrypted data (e.g. guest RAM, SMRAM etc).
+ 
+ It is used in the SEV-enabled guest. When encryption is enabled, a guest
+ memory region may contain encrypted data. The SEV memory encryption
+ engine uses a tweak such that two identical plaintext pages, each at
+ different locations will have differing ciphertexts. So swapping or
+ moving ciphertext of those pages will not result in plaintext being
+ swapped. So relocating (or migrating) physical backing pages for the SEV
+ guest will require some additional steps.
+ 
+ Note: The current SEV key management spec does not provide commands to
+ swap or migrate (move) ciphertext pages. Hence, for now we pin the guest
+ memory region registered with the ioctl.
+ 
+ 4.111 KVM_MEMORY_ENCRYPT_UNREG_REGION
+ 
+ Capability: basic
+ Architectures: x86
+ Type: system
+ Parameters: struct kvm_enc_region (in)
+ Returns: 0 on success; -1 on error
+ 
+ This ioctl can be used to unregister the guest memory region registered
+ with KVM_MEMORY_ENCRYPT_REG_REGION ioctl above.
+ 
  5. The kvm_run structure
  ------------------------
  
