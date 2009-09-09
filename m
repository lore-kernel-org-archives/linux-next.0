From: Siarhei Liakh <sliakh.lkml@gmail.com>
Subject: Re: linux-next: rr tree build failure
Date: Wed, 9 Sep 2009 10:32:38 -0400
Message-ID: <817ecb6f0909090732j6b1e097dobcb59af8147e30cf@mail.gmail.com>
References: <20090909134752.f5b8c2e7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f173.google.com ([209.85.211.173]:38024 "EHLO
	mail-yw0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753051AbZIIOcf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2009 10:32:35 -0400
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

Looks like I have made some bad assumptions. I will re-write the
original patch to be x86-only.

Sorry for breaking the build.
