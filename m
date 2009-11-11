From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build failure
Date: Wed, 11 Nov 2009 19:03:21 +1030
Message-ID: <200911111903.21923.rusty@rustcorp.com.au>
References: <20091111140126.044be7d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:49884 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757038AbZKKIdS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Nov 2009 03:33:18 -0500
In-Reply-To: <20091111140126.044be7d2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, alan-jenkins@tuffmail.co.uk, x86@kernel.org

On Wed, 11 Nov 2009 01:31:26 pm Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> .tmp_exports-asm.o: In function `__ksymtab_load_gs_index':
> (__ksymtab_sorted+0x5b40): undefined reference to `load_gs_index'
> 
> I have used the version of the rr tree from next-20091110 for today.

It's inline and exported when CONFIG_PARAVIRT=y.  Which is wrong.

Here's the patch I've put in my series for tomorrow's linux-next:

Subject: x86: don't export inline function

For CONFIG_PARAVIRT, load_gs_index is an inline function (it's #defined
to native_load_gs_index otherwise).

Exporting an inline function breaks the new assembler-based alphabetical
sorted symbol list:

Today's linux-next build (x86_64 allmodconfig) failed like this:

	.tmp_exports-asm.o: In function `__ksymtab_load_gs_index':
	(__ksymtab_sorted+0x5b40): undefined reference to `load_gs_index'

Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
To: x86@kernel.org
Cc: alan-jenkins@tuffmail.co.uk

diff --git a/arch/x86/kernel/x8664_ksyms_64.c b/arch/x86/kernel/x8664_ksyms_64.c
--- a/arch/x86/kernel/x8664_ksyms_64.c
+++ b/arch/x86/kernel/x8664_ksyms_64.c
@@ -57,4 +57,6 @@ EXPORT_SYMBOL(__memcpy);
 
 EXPORT_SYMBOL(empty_zero_page);
 EXPORT_SYMBOL(init_level4_pgt);
-EXPORT_SYMBOL(load_gs_index);
+#ifndef CONFIG_PARAVIRT
+EXPORT_SYMBOL(native_load_gs_index);
+#endif
