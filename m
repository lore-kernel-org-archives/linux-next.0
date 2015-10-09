From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the
 crypto-current tree
Date: Fri, 9 Oct 2015 13:09:34 +1100
Message-ID: <20151009130934.1affe26a@canb.auug.org.au>
References: <20151009124700.46d8cf61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151009124700.46d8cf61@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, Dave Hansen <dave.hansen@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi all,

On Fri, 9 Oct 2015 12:47:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> diff --cc arch/x86/crypto/camellia_aesni_avx_glue.c
> index bacaa13acac5,12e729bfe71b..000000000000
> --- a/arch/x86/crypto/camellia_aesni_avx_glue.c
> +++ b/arch/x86/crypto/camellia_aesni_avx_glue.c
> @@@ -554,12 -554,8 +554,14 @@@ static int __init camellia_aesni_init(v
>   {
>   	const char *feature_name;
>   
>  +	if (!cpu_has_avx || !cpu_has_aes || !cpu_has_osxsave) {
>  +		pr_info("AVX or AES-NI instructions are not detected.\n");
>  +		return -ENODEV;
>  +	}
>  +
>  +	if (!cpu_has_xfeatures(XSTATE_SSE | XSTATE_YMM, &feature_name)) {

OOPS, I clearly meant to remove that line as well (which I have now done).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
