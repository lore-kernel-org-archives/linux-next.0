From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: build failure after merge of the kvm tree
Date: Tue, 19 Feb 2019 19:17:23 +0100
Message-ID: <44033bb2-68a2-957e-a307-066c44d10856@redhat.com>
References: <20190218144200.2dc3283f@canb.auug.org.au>
 <20190219153605.GC29888@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219153605.GC29888@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 19/02/19 16:36, Sean Christopherson wrote:
> On Mon, Feb 18, 2019 at 02:42:00PM +1100, Stephen Rothwell wrote:
>> Hi all,
> 
> ...
> 
>> Caused by commits
>>
>>   1561fcbc8e16 ("KVM: x86: Explicitly #define the VCPU_REGS_* indices")
>>   a46e726511f4 ("KVM: VMX: Move vCPU-run code to a proper assembly routine")
>>
>> It looks like a file was not git added :-(
> 
> Yep, 1561fcbc8e16 should have introduced arch/x86/include/asm/kvm_vcpu_regs.h.
> 
> I assume there's nothing to do but wait for Paolo or Radim to fixup the
> KVM tree?

Yes, I'll do it shortly.

Paolo

> 
> Original patch:
> 
>   https://patchwork.kernel.org/patch/10781575/
> 
