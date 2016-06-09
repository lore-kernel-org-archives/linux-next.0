From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
Date: Wed, 8 Jun 2016 19:56:38 -0700
Message-ID: <CAGXu5jLxN65Z-+Miiju3VcOK7fpWKqAQY6hn6u5KTZm_NP54kQ@mail.gmail.com>
References: <20160609122258.1c2068f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:37223 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1162012AbcFIC4l (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Jun 2016 22:56:41 -0400
Received: by mail-wm0-f44.google.com with SMTP id k204so40953056wmk.0
        for <linux-next@vger.kernel.org>; Wed, 08 Jun 2016 19:56:40 -0700 (PDT)
In-Reply-To: <20160609122258.1c2068f0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>

On Wed, Jun 8, 2016 at 7:22 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
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

Congratulations on having the gcc plugin development headers
successfully installed! ;)

> Introduced (presumably) by commits
>
>   6b90bd4ba40b ("GCC plugin infrastructure")
>   0dae776c6bf3 ("Add Cyclomatic complexity GCC plugin")
>
> I have disabled CONFIG_GCC_PLUGIN_CYC_COMPLEXITY (by making it depend
> on CONFIG_BROKEN) until it is not enabled by default.

Ah, yes, that should default to off. We'll get a fix landed ASAP.

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
