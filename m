From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of most trees
Date: Fri, 23 Jun 2017 16:43:23 +1000
Message-ID: <20170623164323.2ff81b19@canb.auug.org.au>
References: <20170622184116.0ebaabd9@roar.ozlabs.ibm.com>
        <20170622.101306.2121302610489503804.davem@davemloft.net>
        <20170623003339.11cbc062@roar.ozlabs.ibm.com>
        <20170622.105648.1780325804771154563.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170622.105648.1780325804771154563.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: npiggin@gmail.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, amodra@gmail.com
List-Id: linux-next.vger.kernel.org

Hi all,

On Thu, 22 Jun 2017 10:56:48 -0400 (EDT) David Miller <davem@davemloft.net> wrote:
>
> Feel free to merge it into your series:
> 
> ====================
> sparc64: Use indirect calls in hamming weight stubs.
> 
> Otherwise, depending upon link order, the branch relocation
> limits could be exceeded.
> 
> Signed-off-by: David S. Miller <davem@davemloft.net>
> 
> diff --git a/arch/sparc/lib/hweight.S b/arch/sparc/lib/hweight.S
> index f9985f1..d21cf20 100644
> --- a/arch/sparc/lib/hweight.S
> +++ b/arch/sparc/lib/hweight.S
> @@ -4,9 +4,9 @@
>  	.text
>  	.align	32
>  ENTRY(__arch_hweight8)
> -	ba,pt	%xcc, __sw_hweight8
> +	sethi	%hi(__sw_hweight8), %g1
> +	jmpl	%g1 + %lo(__sw_hweight8), %g0
>  	 nop
> -	nop
>  ENDPROC(__arch_hweight8)
>  EXPORT_SYMBOL(__arch_hweight8)
>  	.section	.popc_3insn_patch, "ax"
> @@ -17,9 +17,9 @@ EXPORT_SYMBOL(__arch_hweight8)
>  	.previous
>  
>  ENTRY(__arch_hweight16)
> -	ba,pt	%xcc, __sw_hweight16
> +	sethi	%hi(__sw_hweight16), %g1
> +	jmpl	%g1 + %lo(__sw_hweight16), %g0
>  	 nop
> -	nop
>  ENDPROC(__arch_hweight16)
>  EXPORT_SYMBOL(__arch_hweight16)
>  	.section	.popc_3insn_patch, "ax"
> @@ -30,9 +30,9 @@ EXPORT_SYMBOL(__arch_hweight16)
>  	.previous
>  
>  ENTRY(__arch_hweight32)
> -	ba,pt	%xcc, __sw_hweight32
> +	sethi	%hi(__sw_hweight32), %g1
> +	jmpl	%g1 + %lo(__sw_hweight32), %g0
>  	 nop
> -	nop
>  ENDPROC(__arch_hweight32)
>  EXPORT_SYMBOL(__arch_hweight32)
>  	.section	.popc_3insn_patch, "ax"
> @@ -43,9 +43,9 @@ EXPORT_SYMBOL(__arch_hweight32)
>  	.previous
>  
>  ENTRY(__arch_hweight64)
> -	ba,pt	%xcc, __sw_hweight64
> +	sethi	%hi(__sw_hweight16), %g1
> +	jmpl	%g1 + %lo(__sw_hweight16), %g0
>  	 nop
> -	nop
>  ENDPROC(__arch_hweight64)
>  EXPORT_SYMBOL(__arch_hweight64)
>  	.section	.popc_3insn_patch, "ax"

I added that to linux-next today and it fixed the build problem.

-- 
Cheers,
Stephen Rothwell
