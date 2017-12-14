From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the kvm tree
Date: Fri, 15 Dec 2017 07:26:37 +1100
Message-ID: <20171215072637.14f20d72@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54029 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752103AbdLNU0l (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Dec 2017 15:26:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wanpeng Li <wanpeng.li@hotmail.com>, Mark Kanda <mark.kanda@oracle.com>, Jim Mattson <jmattson@google.com>, Yang Zhong <yang.zhong@intel.com>, Markus Elfring <elfring@users.sourceforge.net>, Liran Alon <liran.alon@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

Hi all,

Commit

  1d905946f92a ("KVM: x86: fix escape of guest dr6 to the host")

is missing a Signed-off-bys from its author and committer.

Commits

  74c55931c713 ("KVM: VMX: Cache IA32_DEBUGCTL in memory")
  276c796cfef5 ("KVM: nVMX: Add a WARN for freeing a loaded VMCS02")
  00647b44944a ("KVM: nVMX: Eliminate vmcs02 pool")
  80fef315a74d ("KVM: Expose new cpu features to guest")
  785883350659 ("kvm_main: Use common error handling code in kvm_dev_ioctl_create_vm()")
  52797bf9a875 ("KVM: x86: Add emulation of MSR_SMI_COUNT")

are missing a Signed-off-by from their committer.

-- 
Cheers,
Stephen Rothwell
