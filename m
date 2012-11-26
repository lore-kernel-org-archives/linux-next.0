From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the akpm tree with the signal tree
Date: Mon, 26 Nov 2012 16:49:57 +0000
Message-ID: <CAHkRjk4yn7sMM8hp6MG4uEF3UTMd2zuiosmMuLdSpgwNsw6F7A@mail.gmail.com>
References: <20121127000800.660793d8fa6a28b79a61110b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:36542 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755168Ab2KZQuT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Nov 2012 11:50:19 -0500
In-Reply-To: <20121127000800.660793d8fa6a28b79a61110b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

On 26 November 2012 13:08, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the akpm tree got a conflict in
> arch/arm64/kernel/sys_compat.c arch/arm64/include/asm/unistd.h between
> commit 8709876911bd ("arm64: sanitize copy_thread(), switch to generic
> fork/vfork/clone") from the signal tree and commit "compat: generic
> compat_sys_sched_rr_get_interval() implementation" from the akpm tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks fine to me. Thanks.

-- 
Catalin
