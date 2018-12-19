From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: "x86: Remove Intel MPX" is wrong (Re: linux-next: manual merge of
 the kvm tree with the tip tree)
Date: Wed, 19 Dec 2018 12:54:28 -0800
Message-ID: <e88ea968-f593-ce3a-b152-93f9248446d8@intel.com>
References: <20181219151252.3e27a7f8@canb.auug.org.au>
 <33146e35-3127-3ded-eb51-24a2a72f10fa@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <33146e35-3127-3ded-eb51-24a2a72f10fa@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Orr <marcorr@google.com>
List-Id: linux-next.vger.kernel.org

On 12/19/18 12:32 PM, Paolo Bonzini wrote:
> On 19/12/18 05:12, Stephen Rothwell wrote:
>> I fixed it up (the former removed some code updated by the latter, so I
>> did that) and can carry the fix as necessary. This is now fixed as far as
>> linux-next is concerned, but any non trivial conflicts should be mentioned
>> to your upstream maintainer when your tree is submitted for merging.
>> You may also want to consider cooperating with the maintainer of the
>> conflicting tree to minimise any particularly complex conflicts.
> 
> Ouch, this resolution is wrong.  KVM will lack support for MPX in guests
> now, and that is bad because it breaks live migration.

I should have called this out in the changelog, but I removed *all* the
support because I assumed that guests don't need MPX because no other OS
supported it that I know of.

> A simple fix would be to leave the XSAVE state enabled in the kernel
> unconditionally even if all the other gunk is removed; alternatively
> I can also try to save/restore it only for the guest FPU.

We could do this in two phases: remove the APIs now, and then remove the
XSAVE enabling later (4.22 or whenever).

But, on the other hand, if we want to remove XSAVE support for MPX,
we'll have to break live migration at _some_ point, so why not just do
it now?

> If this patch can be bumped to 4.22, I would prefer that because it
> would save me and Linus some merge window headaches.  Considering that
> the patch lacked my Cc or Ack, perhaps it's the right thing to do.

That's fine with me as well.
