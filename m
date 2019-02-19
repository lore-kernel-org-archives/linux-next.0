From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: linux-next: build failure after merge of the kvm tree
Date: Tue, 19 Feb 2019 07:36:05 -0800
Message-ID: <20190219153605.GC29888@linux.intel.com>
References: <20190218144200.2dc3283f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190218144200.2dc3283f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 18, 2019 at 02:42:00PM +1100, Stephen Rothwell wrote:
> Hi all,

...

> Caused by commits
> 
>   1561fcbc8e16 ("KVM: x86: Explicitly #define the VCPU_REGS_* indices")
>   a46e726511f4 ("KVM: VMX: Move vCPU-run code to a proper assembly routine")
> 
> It looks like a file was not git added :-(

Yep, 1561fcbc8e16 should have introduced arch/x86/include/asm/kvm_vcpu_regs.h.

I assume there's nothing to do but wait for Paolo or Radim to fixup the
KVM tree?


Original patch:

  https://patchwork.kernel.org/patch/10781575/
