From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: "x86: Remove Intel MPX" is wrong (Re: linux-next: manual merge of
 the kvm tree with the tip tree)
Date: Wed, 19 Dec 2018 22:00:58 +0100
Message-ID: <b492238c-6916-1d9b-f9b1-12a43b9f3ffc@redhat.com>
References: <20181219151252.3e27a7f8@canb.auug.org.au>
 <33146e35-3127-3ded-eb51-24a2a72f10fa@redhat.com>
 <e88ea968-f593-ce3a-b152-93f9248446d8@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e88ea968-f593-ce3a-b152-93f9248446d8@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Orr <marcorr@google.com>
List-Id: linux-next.vger.kernel.org

On 19/12/18 21:54, Dave Hansen wrote:
> I should have called this out in the changelog, but I removed *all* the
> support because I assumed that guests don't need MPX because no other OS
> supported it that I know of.

Well, as long as you could have code that sets the MPX bits in XCR0, KVM
will have to support it.  My employer happens to sell one such kernel
and will probably do so a little less than ten years from now. :)

>> A simple fix would be to leave the XSAVE state enabled in the kernel
>> unconditionally even if all the other gunk is removed; alternatively
>> I can also try to save/restore it only for the guest FPU.
> 
> We could do this in two phases: remove the APIs now, and then remove the
> XSAVE enabling later (4.22 or whenever).
> 
> But, on the other hand, if we want to remove XSAVE support for MPX,
> we'll have to break live migration at _some_ point, so why not just do
> it now?

In fact I'm not sure we want to ever remove XSAVE support for MPX in KVM
as long as the processor supports it.  That is, when KVM does
xsave/xrstor of the guest_fpu, we probably want to include MPX in there.
 That can be contained within KVM, Linux need not enable it in XCR0, but
there is one ugly thing: the xsavec offsets would be different between
guest_fpu and other FPUs.  Since KVM is not using supervisor states,
perhaps it's better if that part of the KVM code is completely detached
from the kernel FPU code and uses xsaveopt/xrstoropt instead.

So perhaps the plan should be:

1) remove MPX APIs now

2) then stop using kernel xsave code for KVM's guest_fpu

3) then stop enabling MPX XSAVE in core kernel.

Paolo

>> If this patch can be bumped to 4.22, I would prefer that because it
>> would save me and Linus some merge window headaches.  Considering that
>> the patch lacked my Cc or Ack, perhaps it's the right thing to do.
> 
> That's fine with me as well.
