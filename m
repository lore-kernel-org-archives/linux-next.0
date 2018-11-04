From: Changbin Du <changbin.du@gmail.com>
Subject: Re: linux-next: Tree for Oct 31 (vboxguest)
Date: Sun, 4 Nov 2018 23:38:58 +0000
Message-ID: <20181104233857.b4ou3b7doclw2vi2@mail.google.com>
References: <20181031145907.1ee2e866@canb.auug.org.au>
 <661e44c7-396a-6d58-efa7-ed292f2677c6@infradead.org>
 <CAK8P3a3aygFrD3PyZ8P==JzeYamE-x--MWCL54xzXDE_8u_R6Q@mail.gmail.com>
 <CAK7LNATirQwke8tqk5XukhkwKra6mWEXZ3AHcywNcwGFD2-voA@mail.gmail.com>
 <20181101142946.u5luuctqav6fec6k@mail.google.com>
 <CAK7LNAQbBG=KV5Q8o5-JiNCswuse94jECoqT+T+UEY7bLCRPNw@mail.gmail.com>
 <CAK8P3a1w8p8OC-9_0mtMUxEojvyVfXvF8Ka4J7TnoyZ=gr2Fow@mail.gmail.com>
 <CAK7LNAQp2xU_ThE_q3TmoT16cwUjKx=rB9msVB12+Y9FkaQVmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK7LNAQp2xU_ThE_q3TmoT16cwUjKx=rB9msVB12+Y9FkaQVmw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Changbin Du <changbin.du@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

On Sun, Nov 04, 2018 at 11:43:44AM +0900, Masahiro Yamada wrote:
> On Sat, Nov 3, 2018 at 12:55 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On 11/2/18, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> > > On Thu, Nov 1, 2018 at 11:32 PM Changbin Du <changbin.du@gmail.com> wrote:
> > >> On Thu, Nov 01, 2018 at 12:32:48PM +0900, Masahiro Yamada wrote:
> > >
> > > How about clang?
> > >
> > > For clang, -Og might be equivalent to -O1 at this moment, but I am not
> > > sure.
> > >
> > > In my understanding, Clang does not inline functions marked with 'static
> > > inline'
> > > for -Og (or -O1) optimization level.
> > >
> > > Theoretically, 'inline' keyword is a just hint for the compiler, after all.
> >
> > I think this means that we cannot build the kernel in that configuration,
> > at least with CONFIG_OPTIMIZE_INLINING=y. Without that option,
> > every 'inline' becomes 'always_inline'.
> >
> 
> Sorry, I missed that fact.
> 
> 
> At this moment of time, it is OK given the following:
> 
>  - CONFIG_OPTIMIZE_INLINING is defined only for x86
>  - Clang cannot build x86 due to missing asm-goto
> 
> 
> However, Clang with -Og
> does not inline even such simple code like this:
> 
> 
> -----test code------
> static inline int foo(int x)
> {
>         return x;
> }
> 
> int bar(int x)
> {
>         return foo(x);
> }
> -------------------
> 
> 
> 
> $ clang -Og -c -o bar.o  bar.c
> $ objdump -d  bar.o
> bar.o:     file format elf64-x86-64
> 
> 
> Disassembly of section .text:
> 
> 0000000000000000 <bar>:
>    0: eb 0e                jmp    10 <foo>
>    2: 66 2e 0f 1f 84 00 00 nopw   %cs:0x0(%rax,%rax,1)
>    9: 00 00 00
>    c: 0f 1f 40 00          nopl   0x0(%rax)
> 
> 0000000000000010 <foo>:
>   10: 89 f8                mov    %edi,%eax
>   12: c3                    retq
> 
> 
I see. Thanks for your explanation. So I think we should disable
CONFIG_DEBUG_EXPERIENCE for clang. Do you know how to distinguish
different copmilers in Kconfig?

> 
> -- 
> Best Regards
> Masahiro Yamada

-- 
Thanks,
Changbin Du
