From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Mon, 24 Feb 2014 07:51:42 -0800
Message-ID: <5631f550-8a43-4831-8a62-a47451dbbb1b@email.android.com>
References: <20140224151732.7461213fabef4fc1bbca8213@canb.auug.org.au> <20140224154841.GG12219@tassilo.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140224154841.GG12219@tassilo.jf.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Kleen <ak@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

static asmlinkage can make sense if a pointer to the function is taken somewhere in the same translation unit.

On February 24, 2014 7:48:41 AM PST, Andi Kleen <ak@linux.intel.com> wrote:
>> I guess that there may be more places where "asmlinkage" is used with
>> "static" - I assume that they are all incorrect?
>
>Likely they are bogus yes.
>
>One issue is still the changed ABI on i386, so one has to double check
>before removing if they have arguments.
>
>-Andi

-- 
Sent from my mobile phone.  Please pardon brevity and lack of formatting.
