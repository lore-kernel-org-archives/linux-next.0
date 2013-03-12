From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build failure after merge of the final tree
 (drm-intel tree related)
Date: Mon, 11 Mar 2013 22:46:56 -0700
Message-ID: <CAGXu5jJm2QM-s6DV3e5guQc5i-qEK52uRR6xc=ViqrvCibHEUw@mail.gmail.com>
References: <20130312152226.c5965a68f57444c8652eb46a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:46804 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754315Ab3CLFq5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Mar 2013 01:46:57 -0400
Received: by mail-ob0-f171.google.com with SMTP id x4so4137845obh.30
        for <linux-next@vger.kernel.org>; Mon, 11 Mar 2013 22:46:56 -0700 (PDT)
In-Reply-To: <20130312152226.c5965a68f57444c8652eb46a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Mar 11, 2013 at 9:22 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (i386 defconfig)
> failed like this:
>
> drivers/built-in.o: In function `i915_min_freq_set':
> i915_debugfs.c:(.text+0xb1adc): undefined reference to `__udivdi3'
> drivers/built-in.o: In function `i915_max_freq_set':
> i915_debugfs.c:(.text+0xb1bac): undefined reference to `__udivdi3'
>
> Caused by commit 2389cc500686 ("drm/i915: use simple attribute in debugfs
> routines") from the drm-intel tree.
>
> I have reverted that commit for today.

Ah-ha, thanks. I've sent a follow-up patch to fix this.

-Kees

-- 
Kees Cook
Chrome OS Security
