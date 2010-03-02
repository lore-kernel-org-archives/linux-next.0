From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: linux-next: build failure after merge of the blackfin tree
Date: Tue, 2 Mar 2010 04:15:19 -0500
Message-ID: <8bd0f97a1003020115m4016c5f6v643e90a6c6415e74@mail.gmail.com>
References: <20100301120321.8851ba86.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:33328 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311Ab0CBJPl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Mar 2010 04:15:41 -0500
In-Reply-To: <20100301120321.8851ba86.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>

On Sun, Feb 28, 2010 at 20:03, Stephen Rothwell wrote:
> After merging the blackfin tree, today's linux-next build (x86_64 all=
modconfig)
> failed like this:
>
> kernel/trace/trace_syscalls.c:402: error: redefinition of 'arch_sysca=
ll_addr'
> kernel/trace/trace_syscalls.c:397: note: previous definition of 'arch=
_syscall_addr' was here
>
> Caused by commit d156d1881ea54ec609d92388601661c2679439bb ("ftrace: u=
nify
> arch_syscall_addr() implementations") from the blackfin tree interact=
ing
> with commit e7b8e675d9c71b868b66f62f725a948047514719 ("tracing: Unify
> arch_syscall_addr() implementations") from Linus' tree.
>
> These are slightly different versions of the same patch. but merging =
with the blackfin tree managed to add a second copy of the above functi=
on. =C2=A0I have applied the following patch for today.

i'm traveling atm and wont be able to clean up my tree for a few more
days.  i'd suggest you just drop the Blackfin tree as well as your
local patch.  i'll drop a line once things are sane again on my side.
-mike
