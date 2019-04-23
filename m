From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: mmotm 2019-04-19-14-53 uploaded (objtool)
Date: Tue, 23 Apr 2019 20:57:28 +0200
Message-ID: <20190423185728.GX14281@hirez.programming.kicks-ass.net>
References: <20190419215358.WMVFXV3bT%akpm@linux-foundation.org>
 <af3819b4-008f-171e-e721-a9a20f85d8d1@infradead.org>
 <20190423082448.GY11158@hirez.programming.kicks-ass.net>
 <D7626BC0-FCE9-4424-A6F5-D4AAB6727ED4@amacapital.net>
 <20190423173912.GJ12232@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190423173912.GJ12232@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@amacapital.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, akpm@linux-foundation.org, broonie@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz, mm-commits@vger.kernel.org, sfr@canb.auug.org.au, Josh Poimboeuf <jpoimboe@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 23, 2019 at 07:39:12PM +0200, Peter Zijlstra wrote:
> On Tue, Apr 23, 2019 at 09:07:01AM -0700, Andy Lutomirski wrote:
> > > diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> > > index 22ba683afdc2..c82abd6e4ca3 100644
> > > --- a/arch/x86/include/asm/uaccess.h
> > > +++ b/arch/x86/include/asm/uaccess.h
> > > @@ -427,10 +427,11 @@ do {                                    \
> > > ({                                \
> > >    __label__ __pu_label;                    \
> > >    int __pu_err = -EFAULT;                    \
> > > -    __typeof__(*(ptr)) __pu_val;                \
> > > -    __pu_val = x;                        \
> > > +    __typeof__(*(ptr)) __pu_val = (x);            \
> > > +    __typeof__(ptr) __pu_ptr = (ptr);            \
> > 
> > Hmm.  I wonder if this forces the address calculation to be done
> > before STAC, which means that gcc can’t use mov ..., %gs:(fancy
> > stuff).  It probably depends on how clever the optimizer is. Have you
> > looked at the generated code?
> 
> I have not; will do before posting the real patch.

x86_64-defconfig using gcc-7.3:

$ ./compare.sh defconfig-build defconfig-build1 vmlinux
compat_fillonedir                                         228        227   -1,+0
copy_fpstate_to_sigframe                                  446        448   +2,+0
                                             total   11374268   11374269   +1,+0


$ ./compare.sh defconfig-build defconfig-build1 vmlinux copy_fpstate_to_sigframe

...

0000 ffffffff81027448:  90                      nop                                                      \ 0000 ffffffff81027448:       8b 15 92 75 a8 01       mov    0x1a87592(%rip),%edx
0000 ffffffff81027449:  90                      nop                                                      \ 0000                         ffffffff8102744a: R_X86_64_PC32 fpu_user_xstate_size-0x4
0000 ffffffff8102744a:  90                      nop                                                      \ 0000 ffffffff8102744e:       48 01 da                add    %rbx,%rdx
0000 ffffffff8102744b:  8b 15 8f 75 a8 01       mov    0x1a8758f(%rip),%edx                              \ 0000 ffffffff81027451:       90                      nop
0000                    ffffffff8102744d: R_X86_64_PC32 fpu_user_xstate_size-0x4                         \ 0000 ffffffff81027452:       90                      nop
0000 ffffffff81027451:  c7 04 13 45 58 50 46    movl   $0x46505845,(%rbx,%rdx,1)                         \ 0000 ffffffff81027453:       90                      nop
0000 ffffffff81027458:  31 d2                   xor    %edx,%edx                                         \ 0000 ffffffff81027454:       c7 02 45 58 50 46       movl   $0x46505845,(%rdx)
0000 ffffffff8102745a:  90                      nop                                                      \ 0000 ffffffff8102745a:       31 d2                   xor    %edx,%edx
0000 ffffffff8102745b:  90                      nop                                                      \ 0000 ffffffff8102745c:       90                      nop
0000 ffffffff8102745c:  90                      nop                                                      \ 0000 ffffffff8102745d:       90                      nop
0000 ffffffff8102745d:  90                      nop                                                      \ 0000 ffffffff8102745e:       90                      nop
0000 ffffffff8102745e:  90                      nop                                                      \ 0000 ffffffff8102745f:       90                      nop
0000 ffffffff8102745f:  90                      nop                                                      \ 0000 ffffffff81027460:       90                      nop
0000 ffffffff81027460:  90                      nop                                                      \ 0000 ffffffff81027461:       90                      nop
0000 ffffffff81027461:  90                      nop                                                      \ 0000 ffffffff81027462:       90                      nop
0000 ffffffff81027462:  90                      nop                                                      \ 0000 ffffffff81027463:       90                      nop
0000 ffffffff81027463:  31 c9                   xor    %ecx,%ecx                                         \ 0000 ffffffff81027464:       90                      nop

...

So yes, it changes some code, but meh.
