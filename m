From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the kbuild tree
Date: Thu, 9 Jun 2016 12:22:58 +1000
Message-ID: <20160609122258.1c2068f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Emese Revfy <re.emese@gmail.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

Hi Michal,

After merging the kbuild tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

Cyclomatic Complexity 1 scripts/mod/devicetable-offsets.c:main
Cyclomatic Complexity 1 kernel/bounds.c:foo
Cyclomatic Complexity 1 arch/x86/kernel/asm-offsets_64.c:main
Cyclomatic Complexity 1 arch/x86/kernel/asm-offsets.c:common
Cyclomatic Complexity 5 arch/x86/ia32/audit.c:ia32_classify_syscall

and so on (many, many of these - about 635,000 :-()

Introduced (presumably) by commits

  6b90bd4ba40b ("GCC plugin infrastructure")
  0dae776c6bf3 ("Add Cyclomatic complexity GCC plugin")

I have disabled CONFIG_GCC_PLUGIN_CYC_COMPLEXITY (by making it depend
on CONFIG_BROKEN) until it is not enabled by default.

-- 
Cheers,
Stephen Rothwell
