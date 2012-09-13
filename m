From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RE-RESEND][PATCH] audit: replace defines with C stubs
Date: Thu, 13 Sep 2012 21:43:16 +0200
Message-ID: <CAMuHMdXxXW5pPHF+6r+qcobjtTNaXP1cmkrrtdDeWcLfGop4gA@mail.gmail.com>
References: <20120807004041.GA27896@www.outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:56916 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753386Ab2IMTnT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Sep 2012 15:43:19 -0400
In-Reply-To: <20120807004041.GA27896@www.outflux.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, Jonas Bonn <jonas@southpole.se>
Cc: linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Eric Paris <eparis@redhat.com>, linux@lists.openrisc.net, Linux-Next <linux-next@vger.kernel.org>

On Tue, Aug 7, 2012 at 2:40 AM, Kees Cook <keescook@chromium.org> wrote:
> This replaces the #defines used when CONFIG_AUDIT or CONFIG_AUDIT_SYSCALLS
> are disabled so we get type checking during those builds.
>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>

JFYI, the change

-#define audit_syscall_entry(ta,a,b,c,d,e) do { ; } while (0)
+static inline void audit_syscall_entry(int arch, int major, unsigned long a0,
+                                      unsigned long a1, unsigned long a2,
+                                      unsigned long a3)
+{ }

uncovers a bug on OpenRISC.

Before,

        audit_syscall_entry(audit_arch(), regs->gpr[11],
                            regs->gpr[3], regs->gpr[4],
                            regs->gpr[5], regs->gpr[6]);

just expanded to nothing if CONFIG_AUDITSYSCALL was not set.
Now, it fails to compile with:

arch/openrisc/kernel/ptrace.c:190:2: error: implicit declaration of
function 'audit_arch'
http://kisskb.ellerman.id.au/kisskb/buildresult/7191698/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
