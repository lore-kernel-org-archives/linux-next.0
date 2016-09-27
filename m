From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the percpu tree with the asm-generic tree
Date: Tue, 27 Sep 2016 21:59:32 +0200
Message-ID: <201609272159.32261.arnd@arndb.de>
References: <20160927135434.0040b41c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160927135434.0040b41c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.chunyan@linaro.org>, Nicholas Piggin <npiggin@gmail.com>
List-Id: linux-next.vger.kernel.org

On Tuesday 27 September 2016, Stephen Rothwell wrote:
> diff --cc include/asm-generic/percpu.h
> index 70fefec69e61,40e887068da2..000000000000
> --- a/include/asm-generic/percpu.h
> +++ b/include/asm-generic/percpu.h
> @@@ -108,9 -118,9 +118,9 @@@ do {                                                                       
>   #define this_cpu_generic_read(pcp)                                    \
>   ({                                                                    \
>         typeof(pcp) __ret;                                              \
>  -      preempt_disable();                                              \
>  +      preempt_disable_notrace();                                      \
> -       __ret = *this_cpu_ptr(&(pcp));                                  \
> +       __ret = raw_cpu_generic_read(pcp);                              \
>  -      preempt_enable();                                               \
>  +      preempt_enable_notrace();                                       \
>         __ret;                                                          \
>   })
>   

The merge solution seems correct, but this is one of only two trivial
patches I have queued up for asm-generic this time, so I wonder if we could
put the _notrace patch into the percpu tree that already has the
raw_cpu_generic_read change to avoid the conflict.

	Arnd
