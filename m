From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] compiler, READ_ONCE: Fix build failure with some older
 GCC
Date: Thu, 15 Oct 2015 13:30:58 +0200
Message-ID: <20151015113058.GA19412@gmail.com>
References: <20151015201834.350258bf@canb.auug.org.au>
 <1444904391-18058-1-git-send-email-aryabinin@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444904391-18058-1-git-send-email-aryabinin@virtuozzo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@amacapital.net>, Andrey Konovalov <andreyknvl@google.com>, Kostya Serebryany <kcc@google.com>, Alexander Potapenko <glider@google.com>, kasan-dev <kasan-dev@googlegroups.com>, Borislav Petkov <bp@alien8.de>, Denys Vlasenko <dvlasenk@redhat.com>, Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, Sasha Levin <sasha.levin@oracle.com>, Wolfram Gloger <wmglo@dent.med.uni-muenchen.de>
List-Id: linux-next.vger.kernel.org


* Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:

> Some old versions of GCC doesn't handle __alias (or maybe a combination
> of 'static __always_inline __alias') right.
> 
> GCC creates outline and unused copy of __read_once_size_check()
> function in the object file which references memcpy and causes
> the build failure:
> 	arch/x86/entry/vdso/vclock_gettime.o: In function `__read_once_size_check':
> 	vclock_gettime.c:(.text+0x5f): undefined reference to `memcpy'
> 	arch/x86/entry/vdso/vgetcpu.o: In function `__read_once_size_check':
> 	vgetcpu.c:(.text+0x2f): undefined reference to `memcpy'
> 
> We could avoid using alias to work around this problem.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
> ---
>  include/linux/compiler.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index aa2ae4c..3436a4c 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -231,8 +231,11 @@ void __read_once_size_nocheck(const volatile void *p, void *res, int size)
>  	__READ_ONCE_SIZE;
>  }
>  #else
> -static __always_inline __alias(__read_once_size_check)
> -void __read_once_size_nocheck(const volatile void *p, void *res, int size);
> +static __always_inline
> +void __read_once_size_nocheck(const volatile void *p, void *res, int size)
> +{
> +	__READ_ONCE_SIZE;
> +}
>  #endif

Yeah, so could you please re-send the original two patches, with all the changes 
(typo fixes, renaming, this build fix, etc.) propagated that were found in testing 
and that were suggested in the review thread?

I'll remove the broken commits from linux-next meanwhile.

Thanks,

	Ingo
