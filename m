From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] [v3] x86, pkeys: fix siginfo ABI breakage from new field
Date: Tue, 1 Mar 2016 10:39:06 +0100
Message-ID: <20160301093906.GA10360@gmail.com>
References: <20160229221733.DC2C56B7@viggo.jf.intel.com>
 <20160301074052.GA7201@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160301074052.GA7201@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave@sr71.net>
Cc: linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, sfr@canb.auug.org.au, akpm@linux-foundation.org, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, deller@gmx.de
List-Id: linux-next.vger.kernel.org


> > A u64 was used for the protection key field in siginfo.  When the
> > containing union was aligned, this u64 unioned nicely with the
> > two 'void *'s in _addr_bnd.  But, on 32-bit, if the union was
> > unaligned, the u64 might grow the size of the union, breaking the
> > ABI for subsequent fields.

Btw., I think this explanation is incorrect, the layout of _addr_bnd is 
irrelevant.

What happened on some 32-bit platforms is the following: if u64 has a natural 
alignment of 8 bytes (this is rare, most 32-bit platforms align it to 4 bytes), 
then the leadup to the _sifields union matters:

typedef struct siginfo {
        int si_signo;
        int si_errno;
        int si_code;

        union {
	...
        } _sifields;
} __ARCH_SI_ATTRIBUTES siginfo_t;

Note how the first 3 fields give us 12 bytes, so _sifields is not 8 naturally 
bytes aligned.

Before the _pkey field addition the largest element of _sifields (on 32-bit 
platforms) was 32 bits. With the u64 added, the minimum alignment requirement 
increased to 8 bytes on those (rare) 32-bit platforms. Thus GCC padded the space 
after si_code with 4 extra bytes, and shifted all _sifields offsets by 4 bytes - 
breaking the ABI of all of those remaining fields.

On 64-bit platforms this problem was hidden due to _sifields already having 
numerous fields with natural 8 bytes alignment (pointers).

If you agree with this analysis then mind updating the changelog accordingly?

Thanks,

	Ingo
