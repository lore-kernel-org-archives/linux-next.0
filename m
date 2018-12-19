From: Paolo Bonzini <pbonzini@redhat.com>
Subject: "x86: Remove Intel MPX" is wrong (Re: linux-next: manual merge of the
 kvm tree with the tip tree)
Date: Wed, 19 Dec 2018 21:32:38 +0100
Message-ID: <33146e35-3127-3ded-eb51-24a2a72f10fa@redhat.com>
References: <20181219151252.3e27a7f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219151252.3e27a7f8@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@intel.com>, Marc Orr <marcorr@google.com>
List-Id: linux-next.vger.kernel.org

On 19/12/18 05:12, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm tree got a conflict in:
> 
>   arch/x86/kvm/x86.c
> 
> between commit:
> 
>   eb012ef3b4e3 ("x86: Remove Intel MPX")
> 
> from the tip tree and commit:
> 
>   b666a4b69739 ("kvm: x86: Dynamically allocate guest_fpu")
> 
> from the kvm tree.
> 
> I fixed it up (the former removed some code updated by the latter, so I
> did that) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

Ouch, this resolution is wrong.  KVM will lack support for MPX in guests
now, and that is bad because it breaks live migration.  A simple fix
would be to leave the XSAVE state enabled in the kernel unconditionally
even if all the other gunk is removed; alternatively I can also try to
save/restore it only for the guest FPU.

If this patch can be bumped to 4.22, I would prefer that because it
would save me and Linus some merge window headaches.  Considering that
the patch lacked my Cc or Ack, perhaps it's the right thing to do.

Paolo
