From: James Hogan <james.hogan@imgtec.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Mon, 4 Feb 2013 13:56:32 +0000
Message-ID: <CAAG0J99hxOOGh74wQ2R47o0noRxQhNS8T_DNnbX2FX-rJ2wMzQ@mail.gmail.com>
References: <20130204183926.f5d5ab14b0ae4d22cb253202@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:44460 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754220Ab3BDN4e (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Feb 2013 08:56:34 -0500
Received: by mail-bk0-f47.google.com with SMTP id jc3so2744952bkc.34
        for <linux-next@vger.kernel.org>; Mon, 04 Feb 2013 05:56:32 -0800 (PST)
In-Reply-To: <20130204183926.f5d5ab14b0ae4d22cb253202@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Alexander Viro <viro@zeniv.linux.org.uk>

Hi Stephen,

On 4 February 2013 07:39, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Merging signal/for-next (9005965 x86: convert to ksignal)
> CONFLICT (content): Merge conflict in arch/x86/Kconfig

I think this conflict has been resolved incorrectly.

Al's commit 1820f96 "burying unused conditionals" removed
GENERIC_SIGALTSTACK from config X86, but the merge
(c5395e2affed5c42200cb6e21e3380995ef22ae3) left GENERIC_SIGALTSTACK
in:

diff --cc arch/x86/Kconfig
index 32d4ff1,49fb44e..6979498
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@@ -114,9 -113,9 +114,12 @@@ config X8
  	select MODULES_USE_ELF_REL if X86_32
  	select MODULES_USE_ELF_RELA if X86_64
  	select CLONE_BACKWARDS if X86_32
 +	select ARCH_USE_BUILTIN_BSWAP
 +	select GENERIC_SIGALTSTACK
 +	select ARCH_USE_BUILTIN_BSWAP
+ 	select OLD_SIGSUSPEND3 if X86_32 || IA32_EMULATION
+ 	select OLD_SIGACTION if X86_32
+ 	select COMPAT_OLD_SIGACTION if IA32_EMULATION

  config INSTRUCTION_DECODER
  	def_bool y

Cheers
James
