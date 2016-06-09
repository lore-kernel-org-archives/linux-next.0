From: Emese Revfy <re.emese@gmail.com>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
Date: Thu, 9 Jun 2016 19:42:25 +0200
Message-ID: <20160609194225.be69ec2213a5cae71cba795b@gmail.com>
References: <20160609122258.1c2068f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34372 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751033AbcFIRfi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Jun 2016 13:35:38 -0400
In-Reply-To: <20160609122258.1c2068f0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>

On Thu, 9 Jun 2016 12:22:58 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Michal,
> 
> After merging the kbuild tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
> 
> Cyclomatic Complexity 1 scripts/mod/devicetable-offsets.c:main
> Cyclomatic Complexity 1 kernel/bounds.c:foo
> Cyclomatic Complexity 1 arch/x86/kernel/asm-offsets_64.c:main
> Cyclomatic Complexity 1 arch/x86/kernel/asm-offsets.c:common
> Cyclomatic Complexity 5 arch/x86/ia32/audit.c:ia32_classify_syscall
> 
> and so on (many, many of these - about 635,000 :-()
> 
> Introduced (presumably) by commits
> 
>   6b90bd4ba40b ("GCC plugin infrastructure")
>   0dae776c6bf3 ("Add Cyclomatic complexity GCC plugin")
> 
> I have disabled CONFIG_GCC_PLUGIN_CYC_COMPLEXITY (by making it depend
> on CONFIG_BROKEN) until it is not enabled by default.

These aren't warnings. This plugin is a static analyzer. It prints out
the cyclomatic complexity of all functions in the kernel.

I think it would be useful to enable it sometimes and report new functions
with a high enough complexity value. 

-- 
Emese
