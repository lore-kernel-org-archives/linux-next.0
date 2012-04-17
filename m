From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] seccomp: use a static inline for a function stub
Date: Mon, 16 Apr 2012 20:24:31 -0700
Message-ID: <CAGXu5jKY+oi5PLZ33and4RX8oYQUVdpLPyswS9COK-B2Ezon4g@mail.gmail.com>
References: <20120417120848.e7f3eabfbf79dc609318ea1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:49848 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753552Ab2DQDYd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Apr 2012 23:24:33 -0400
Received: by bkcik5 with SMTP id ik5so4178193bkc.19
        for <linux-next@vger.kernel.org>; Mon, 16 Apr 2012 20:24:32 -0700 (PDT)
In-Reply-To: <20120417120848.e7f3eabfbf79dc609318ea1e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, Will Drewry <wad@chromium.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Eric Paris <eparis@redhat.com>

On Mon, Apr 16, 2012 at 7:08 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Fixes this error message when CONFIG_SECCOMP is not set:
>
> arch/powerpc/kernel/ptrace.c: In function 'do_syscall_trace_enter':
> arch/powerpc/kernel/ptrace.c:1713:2: error: statement with no effect [-Werror=unused-value]
>
> Signed-off-by: Stephen Rothwell <sfr@ozlabs.au.ibm.com>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
ChromeOS Security
