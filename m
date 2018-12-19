From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: "x86: Remove Intel MPX" is wrong (Re: linux-next: manual merge of
 the kvm tree with the tip tree)
Date: Wed, 19 Dec 2018 22:40:59 +0100
Message-ID: <e4ee46ee-001c-a22b-173e-551684fa79b5@redhat.com>
References: <20181219151252.3e27a7f8@canb.auug.org.au>
 <33146e35-3127-3ded-eb51-24a2a72f10fa@redhat.com>
 <e88ea968-f593-ce3a-b152-93f9248446d8@intel.com>
 <b492238c-6916-1d9b-f9b1-12a43b9f3ffc@redhat.com>
 <c1c1d927-9e7c-3937-4ea9-a6d6dd94a4ee@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c1c1d927-9e7c-3937-4ea9-a6d6dd94a4ee@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Orr <marcorr@google.com>
List-Id: linux-next.vger.kernel.org

On 19/12/18 22:28, Dave Hansen wrote:
> 
> On 12/19/18 1:00 PM, Paolo Bonzini wrote:
>> On 19/12/18 21:54, Dave Hansen wrote:
>>> I should have called this out in the changelog, but I removed *all* the
>>> support because I assumed that guests don't need MPX because no other OS
>>> supported it that I know of.
>>
>> Well, as long as you could have code that sets the MPX bits in XCR0, KVM
>> will have to support it.  My employer happens to sell one such kernel
>> and will probably do so a little less than ten years from now. :)
> 
> Does your employer sell a system that supports live migration across
> major releases?  Or, is it always that you support migration to _newer_
> releases but not older?

Only to the immediately following major release, but a major release has
a looooong lifetime.  So guests running on RHEL6 will have to reboot
when moving to RHEL8, and will drop MPX support.  But RHEL8 is stuck
supporting MPX even if it's off by default because guests can be
migrated from RHEL7 hosts to RHEL8.

>> In fact I'm not sure we want to ever remove XSAVE support for MPX in KVM
>> as long as the processor supports it.  That is, when KVM does
>> xsave/xrstor of the guest_fpu, we probably want to include MPX in there.
>> That can be contained within KVM, Linux need not enable it in XCR0, 
> 
> I believe you need the feature bit set in XCR0 for XSAVE* to be able to
> operate on it.  So, you could do this, but you would need to save XCR0,
> set the XCR0 MPX bits, do XSAVE or XRSTOR, and restore XCR0 all with
> preemption (and interrupts?) off.

Yes, and on context switch KVM does rely on the kernel saving/restoring
MPX state to userspace (QEMU)'s FPU struct though.  However, I can move
that to the preempt notifier, either open coded or wrapped with XSETBVs.
 One more reason to do our own xsave/xrstor in non-compacted format when
loading/storing guest_fpu.

Paolo

> You could just open-code the MPX save/restore, though.  MPX is
> XSAVE-managed, but not XSAVE-enabled like some other features, IIRC.
