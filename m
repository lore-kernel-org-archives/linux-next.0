From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [linux-next][bisected c7c133f3][gcc 4.8.5] build fail with
 error: first argument to
 =?UTF-8?Q?=E2=80=98=5F=5Fbuiltin=5Fchoose=5Fexpr=E2=80=99?= not a constant
Date: Wed, 14 Mar 2018 15:29:06 +0530
Message-ID: <1521021546.31953.12.camel@abdul.in.ibm.com>
References: <1521016194.31953.9.camel@abdul.in.ibm.com>
         <20180314193957.5f835d33@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180314193957.5f835d33@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, mpe <mpe@ellerman.id.au>, sachinp <sachinp@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Wed, 2018-03-14 at 19:39 +1100, Stephen Rothwell wrote:
> Hi Abdul,
> 
> On Wed, 14 Mar 2018 13:59:54 +0530 Abdul Haleem <abdhalee@linux.vnet.ibm.com> wrote:
> >
> > Today's next kernel fails to build with gcc 4.8.5 on powerpc machine.
> 
> Thanks for the report.  Just for the future, please include  the
> next-XXXXXXXX tag when making reports about linux-next.

Sure, I will. next-20180313 is the bad tag
> 
> > ./include/linux/jiffies.h: In function ‘jiffies_delta_to_clock_t’:
> > ./include/linux/kernel.h:855:2: error: first argument to ‘__builtin_choose_expr’ not a constant
> >   __builtin_choose_expr(__builtin_constant_p(x) &&  \
> >   ^
> > ./include/linux/kernel.h:867:19: note: in expansion of macro ‘__max’
> >  #define max(x, y) __max(typeof(x), typeof(y), x, y)
> > 
> > Machine Type: Power8 Baremetal
> > gcc: 4.8.5
> > 
> > 
> > Builds fine when below patch is reverted
> > c7c133f3 kernel.h: skip single-eval logic on literals in min()/max()
> 
> Those patches have been removed from today's linux-next (next-20180314).

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
