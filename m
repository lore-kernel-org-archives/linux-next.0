From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build problems (Was: [PATCH v3 1/2] Provide
 READ_ONCE_NOCHECK())
Date: Thu, 15 Oct 2015 20:18:34 +1100
Message-ID: <20151015201834.350258bf@canb.auug.org.au>
References: <1444739750-29241-1-git-send-email-aryabinin@virtuozzo.com>
	<1444750088-24444-1-git-send-email-aryabinin@virtuozzo.com>
	<1444750088-24444-2-git-send-email-aryabinin@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444750088-24444-2-git-send-email-aryabinin@virtuozzo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@amacapital.net>, Andrey Konovalov <andreyknvl@google.com>, Kostya Serebryany <kcc@google.com>, Alexander Potapenko <glider@google.com>, kasan-dev <kasan-dev@googlegroups.com>, Borislav Petkov <bp@alien8.de>, Denys Vlasenko <dvlasenk@redhat.com>, Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, Sasha Levin <sasha.levin@oracle.com>, Wolfram Gloger <wmglo@dent.med.uni-muenchen.de>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Andrey,

On Tue, 13 Oct 2015 18:28:07 +0300 Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:
>
> Some code may perform racy by design memory reads. This could be harmless,
> yet such code may produce KASAN warnings.
> 
> To hide such accesses from KASAN this patch introduces READ_ONCE_NOCHECK()
> macro. KASAN will not check the memory accessed by READ_ONCE_NOCHECK().
> 
> This patch creates __read_once_size_nocheck() a clone of
> __read_once_size_check() (renamed __read_once_size()).
> The only difference between them is 'no_sanitized_address' attribute
> appended to '*_nocheck' function. This attribute tells the compiler that
> instrumentation of memory accesses should not be applied to that function.
> We declare it as static '__maybe_unsed' because GCC is not capable to
> inline such function: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67368
> 
> With KASAN=n READ_ONCE_NOCHECK() is just a clone of READ_ONCE().
> 
> Signed-off-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
> ---
>  include/linux/compiler-gcc.h | 13 ++++++++++
>  include/linux/compiler.h     | 60 ++++++++++++++++++++++++++++++++++----------
>  2 files changed, 60 insertions(+), 13 deletions(-)

I am pretty sure that this patch is causing quite a bit of compile
breakage in linux-next today.  During the day I compile with gcc 4.9.0
and did not see any problems with c86_64 allmodconfig, or i386
defconfig etc, but overnight we compile with older compilers (gcc 4.6.3
in particular) and are getting quite a few errors:

>From an i386 allnoconfig build:

arch/x86/entry/vdso/vdso32.so.dbg: undefined symbols found
/home/kisskb/slave/src/arch/x86/entry/vdso/Makefile:154: recipe for target 'arch/x86/entry/vdso/vdso32.so.dbg' failed

>From an x86_64 allnoconfig build:

arch/x86/entry/vdso/vclock_gettime.o: In function `__read_once_size_check':
vclock_gettime.c:(.text+0x5f): undefined reference to `memcpy'
arch/x86/entry/vdso/vgetcpu.o: In function `__read_once_size_check':
vgetcpu.c:(.text+0x2f): undefined reference to `memcpy'

and several others ...
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
