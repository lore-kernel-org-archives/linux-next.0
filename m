From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the crypto-current
 tree
Date: Fri, 9 Oct 2015 12:47:00 +1100
Message-ID: <20151009124700.46d8cf61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47474 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754012AbbJIBrE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Oct 2015 21:47:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, Dave Hansen <dave.hansen@linux.intel.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/crypto/camellia_aesni_avx_glue.c

between commit:

  92b279070dd6 ("crypto: camellia_aesni_avx - Fix CPU feature checks")

from the crypto-current tree and commit:

  d91cab78133d ("x86/fpu: Rename XSAVE macros")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/crypto/camellia_aesni_avx_glue.c
index bacaa13acac5,12e729bfe71b..000000000000
--- a/arch/x86/crypto/camellia_aesni_avx_glue.c
+++ b/arch/x86/crypto/camellia_aesni_avx_glue.c
@@@ -554,12 -554,8 +554,14 @@@ static int __init camellia_aesni_init(v
  {
  	const char *feature_name;
  
 +	if (!cpu_has_avx || !cpu_has_aes || !cpu_has_osxsave) {
 +		pr_info("AVX or AES-NI instructions are not detected.\n");
 +		return -ENODEV;
 +	}
 +
 +	if (!cpu_has_xfeatures(XSTATE_SSE | XSTATE_YMM, &feature_name)) {
+ 	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
+ 				&feature_name)) {
  		pr_info("CPU feature '%s' is not supported.\n", feature_name);
  		return -ENODEV;
  	}
