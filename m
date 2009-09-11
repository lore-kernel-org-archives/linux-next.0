From: Siarhei Liakh <sliakh.lkml@gmail.com>
Subject: Re: linux-next: rr tree build failure
Date: Thu, 10 Sep 2009 23:00:38 -0400
Message-ID: <817ecb6f0909102000n4b3308cayd242cb329fcedde3@mail.gmail.com>
References: <20090909134752.f5b8c2e7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f174.google.com ([209.85.211.174]:38230 "EHLO
	mail-yw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753275AbZIKDAh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Sep 2009 23:00:37 -0400
In-Reply-To: <20090909134752.f5b8c2e7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Xuxian Jiang <jiang@cs.ncsu.edu>, Arjan van de Ven <arjan@linux.intel.com>

On Tue, Sep 8, 2009 at 11:47 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rusty,
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> kernel/module.c: In function 'set_section_ro_nx':
> kernel/module.c:1549: error: implicit declaration of function 'set_memory_ro'
> kernel/module.c:1560: error: implicit declaration of function 'set_memory_nx'
> kernel/module.c: In function 'unset_section_ro_nx':
> kernel/module.c:1575: error: implicit declaration of function 'set_memory_rw'
>
> Caused by commit 25306e21864c2a220d6fa2e0632425028aa9626c
> ("module:ro-nx-protection") which uses these interfaces that are only
> defined on x86 ...
>
> I have used the version of the rr tree from next-20090908 for today.

I have posted a replacement patch for that commit: "[PATCH v6] RO/NX
protection for loadable kernel modules"
Please let me know if you would rather see a short "patch patch"
rather than complete patch replacement. The fix, essentially, is to
encapsulate entire bodies of unset_section_ro_nx() and
set_section_ro_nx() inside #ifdef CONFIG_X86 ... #endif. This way
set_memory_* will be called only on x86.

Thanks.
