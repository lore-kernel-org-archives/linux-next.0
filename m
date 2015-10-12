From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the crypto tree
Date: Mon, 12 Oct 2015 14:18:13 +0800
Message-ID: <20151012061813.GA24709@gondor.apana.org.au>
References: <20151012142421.2799de5c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from helcar.hengli.com.au ([209.40.204.226]:38270 "EHLO
	helcar.hengli.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751304AbbJLGTJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2015 02:19:09 -0400
Content-Disposition: inline
In-Reply-To: <20151012142421.2799de5c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, tim <tim.c.chen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>

On Mon, Oct 12, 2015 at 02:24:21PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/x86/Makefile
> 
> between commit:
> 
>   e38b6b7fcfd1 ("crypto: x86/sha - Add build support for Intel SHA Extensions optimized SHA1 and SHA256")
> 
> from the crypto tree and commit:
> 
>   7b956f035a9e ("x86/asm: Re-add parts of the manual CFI infrastructure")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks Stephen.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
