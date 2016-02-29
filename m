From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] [v2] x86, pkeys: fix siginfo ABI breakage from new
 field
Date: Tue, 1 Mar 2016 09:13:31 +1100
Message-ID: <20160301091331.0ce9f1da@canb.auug.org.au>
References: <20160229194931.7600FB60@viggo.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160229194931.7600FB60@viggo.jf.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave@sr71.net>
Cc: linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, akpm@linux-foundation.org, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, deller@gmx.de
List-Id: linux-next.vger.kernel.org

Hi Dave,

On Mon, 29 Feb 2016 11:49:31 -0800 Dave Hansen <dave@sr71.net> wrote:
>
> This responds to the feedback from Ingo that we should be using
> explicitly-sized types.

Beat me to it by seconds :-)

> From: Dave Hansen <dave.hansen@linux.intel.com>
> 
> Stephen Rothwell reported:
> 
> 	http://lkml.kernel.org/r/20160226164406.065a1ffc@canb.auug.org.au
> 
> that the Memory Protection Keys patches from the tip tree broke
> a build-time check on an ARM build because they changed the ABI
> of siginfo.
> 
> A u64 was used for the protection key field in siginfo.  When the
> containing union was aligned, this u64 unioned nicely with the
> two 'void *'s in _addr_bnd.  But, on 32-bit, if the union was
> unaligned, the u64 might grow the size of the union, breaking the
> ABI for subsequent fields.
> 
> To fix this, we replace the u64 with an 'unsigned long'.  The long
> is guaranteed to union well with the pointers from _addr_bnd.  It
> is also plenty large enough to store the 16-bit pkey we have today
> on x86.  This also has the advantage that it allows existing 64-bit
> userspace to keep working without modification.

s/(unsigned )?long/__u32/g
and the last sentence no longer makes sense.

> I also shouldn't have been using a u64 in a userspace API to begin
> with.
> 
> Fixes: cd0ea35ff551 ("signals, pkeys: Notify userspace about protection key faults")
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@elte.hu>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: linux-next@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Helge Deller <deller@gmx.de>

Acked-by: Stehen Rothwell <sfr@canb.auug.org.au>

-- 
Cheers,
Stephen Rothwell
