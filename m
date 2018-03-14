From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: [linux-next][bisected c7c133f3][gcc 4.8.5] build fail with error:
 first argument to
 =?UTF-8?Q?=E2=80=98=5F=5Fbuiltin=5Fchoose=5Fexpr=E2=80=99?= not a constant
Date: Wed, 14 Mar 2018 13:59:54 +0530
Message-ID: <1521016194.31953.9.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@chromium.org>, mpe <mpe@ellerman.id.au>, sachinp <sachinp@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

Greetings,

Today's next kernel fails to build with gcc 4.8.5 on powerpc machine.


./include/linux/jiffies.h: In function ‘jiffies_delta_to_clock_t’:
./include/linux/kernel.h:855:2: error: first argument to ‘__builtin_choose_expr’ not a constant
  __builtin_choose_expr(__builtin_constant_p(x) &&  \
  ^
./include/linux/kernel.h:867:19: note: in expansion of macro ‘__max’
 #define max(x, y) __max(typeof(x), typeof(y), x, y)

Machine Type: Power8 Baremetal
gcc: 4.8.5


Builds fine when below patch is reverted
c7c133f3 kernel.h: skip single-eval logic on literals in min()/max()

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
