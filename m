From: Changbin Du <changbin.du@gmail.com>
Subject: Re: linux-next: Tree for Oct 31 (vboxguest)
Date: Fri, 2 Nov 2018 23:59:14 +0000
Message-ID: <20181102235214.uow7crqa5qxnuzxr@mail.google.com>
References: <20181031145907.1ee2e866@canb.auug.org.au>
 <661e44c7-396a-6d58-efa7-ed292f2677c6@infradead.org>
 <CAK8P3a3aygFrD3PyZ8P==JzeYamE-x--MWCL54xzXDE_8u_R6Q@mail.gmail.com>
 <CAK7LNATirQwke8tqk5XukhkwKra6mWEXZ3AHcywNcwGFD2-voA@mail.gmail.com>
 <20181101142946.u5luuctqav6fec6k@mail.google.com>
 <CAK7LNAQbBG=KV5Q8o5-JiNCswuse94jECoqT+T+UEY7bLCRPNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK7LNAQbBG=KV5Q8o5-JiNCswuse94jECoqT+T+UEY7bLCRPNw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Changbin Du <changbin.du@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

Hi Yamada,
>On Fri, Nov 02, 2018 at 05:25:00PM +0900, Masahiro Yamada wrote:
>[...]
> > > >
> > > > diff --git a/drivers/virt/vboxguest/vboxguest_core.c
> > > > b/drivers/virt/vboxguest/vboxguest_core.c
> > > > index 3093655c7b92..1475ed5ffcde 100644
> > > > --- a/drivers/virt/vboxguest/vboxguest_core.c
> > > > +++ b/drivers/virt/vboxguest/vboxguest_core.c
> > > > @@ -1312,7 +1312,7 @@ static int vbg_ioctl_hgcm_call(struct vbg_dev *gdev,
> > > >                 return -EINVAL;
> > > >         }
> > > >
> > > > -       if (f32bit)
> > > > +       if (IS_ENABLED(CONFIG_COMPAT) && f32bit)
> > > >                 ret = vbg_hgcm_call32(gdev, client_id,
> > > >                                       call->function, call->timeout_ms,
> > > >                                       VBG_IOCTL_HGCM_CALL_PARMS32(call),
> > >
> > > Right, but adding the CONFIG_COMPAT guard to both the caller and the callee
> > > looks a bit redundant...
> > >
> > >
> > > I think most cases causing this kind of problem
> > > rely on the assumption that 'static' functions are inlined.
> > >
> > > We can force the compiler to do so
> > > by replacing 'static' with 'static __always_inline'
> > >
> > Declaring it as normal 'inline' is enough. The inline functions are
> > still inlined by gcc. Thanks.
> 
> 
> How about clang?
> 
> For clang, -Og might be equivalent to -O1 at this moment, but I am not sure.
> 
> In my understanding, Clang does not inline functions marked with 'static inline'
> for -Og (or -O1) optimization level.
> 
> Theoretically, 'inline' keyword is a just hint for the compiler, after all.
> 
I only verified it with GCC. But on my machine, clang does not work since it
lacks 'asm-goto' feature. Is clang linux completed?

changbin@acer:~/Desktop/work/linux$ make HOSTCC=clang CC=clang
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --syncconfig Kconfig
Compiler lacks asm-goto support.
arch/x86/Makefile:308: recipe for target 'checkbin' failed
make: *** [checkbin] Error 1
changbin@acer:~/Desktop/work/linux$ clang -v
clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin
Found candidate GCC installation: /usr/bin/../lib/gcc/i686-linux-gnu/8
Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/7
Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/7.3.0
Found candidate GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/8
Found candidate GCC installation: /usr/lib/gcc/i686-linux-gnu/8
Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/7
Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/7.3.0
Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/8
Selected GCC installation: /usr/bin/../lib/gcc/x86_64-linux-gnu/7.3.0
Candidate multilib: .;@m64
Selected multilib: .;@m64

> 
> -- 
> Best Regards
> Masahiro Yamada

-- 
Thanks,
Changbin Du
