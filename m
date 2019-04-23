From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: mmotm 2019-04-19-14-53 uploaded (objtool)
Date: Tue, 23 Apr 2019 19:39:12 +0200
Message-ID: <20190423173912.GJ12232@hirez.programming.kicks-ass.net>
References: <20190419215358.WMVFXV3bT%akpm@linux-foundation.org>
 <af3819b4-008f-171e-e721-a9a20f85d8d1@infradead.org>
 <20190423082448.GY11158@hirez.programming.kicks-ass.net>
 <D7626BC0-FCE9-4424-A6F5-D4AAB6727ED4@amacapital.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <D7626BC0-FCE9-4424-A6F5-D4AAB6727ED4@amacapital.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@amacapital.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, akpm@linux-foundation.org, broonie@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz, mm-commits@vger.kernel.org, sfr@canb.auug.org.au, Josh Poimboeuf <jpoimboe@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 23, 2019 at 09:07:01AM -0700, Andy Lutomirski wrote:
> > diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> > index 22ba683afdc2..c82abd6e4ca3 100644
> > --- a/arch/x86/include/asm/uaccess.h
> > +++ b/arch/x86/include/asm/uaccess.h
> > @@ -427,10 +427,11 @@ do {                                    \
> > ({                                \
> >    __label__ __pu_label;                    \
> >    int __pu_err = -EFAULT;                    \
> > -    __typeof__(*(ptr)) __pu_val;                \
> > -    __pu_val = x;                        \
> > +    __typeof__(*(ptr)) __pu_val = (x);            \
> > +    __typeof__(ptr) __pu_ptr = (ptr);            \
> 
> Hmm.  I wonder if this forces the address calculation to be done
> before STAC, which means that gcc can’t use mov ..., %gs:(fancy
> stuff).  It probably depends on how clever the optimizer is. Have you
> looked at the generated code?

I have not; will do before posting the real patch.
