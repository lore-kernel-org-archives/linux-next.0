From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: linux-next: build failure after merge of the blackfin tree
Date: Tue, 9 Mar 2010 09:26:29 -0500
Message-ID: <8bd0f97a1003090626r207042e2lb7d4954e8d38ee3f@mail.gmail.com>
References: <20100301120321.8851ba86.sfr@canb.auug.org.au>
	<8bd0f97a1003020115m4016c5f6v643e90a6c6415e74@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f189.google.com ([209.85.211.189]:49401 "EHLO
	mail-yw0-f189.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752346Ab0CIO0u convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Mar 2010 09:26:50 -0500
In-Reply-To: <8bd0f97a1003020115m4016c5f6v643e90a6c6415e74@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>

On Tue, Mar 2, 2010 at 04:15, Mike Frysinger wrote:
> On Sun, Feb 28, 2010 at 20:03, Stephen Rothwell wrote:
>> After merging the blackfin tree, today's linux-next build (x86_64 al=
lmodconfig)
>> failed like this:
>>
>> kernel/trace/trace_syscalls.c:402: error: redefinition of 'arch_sysc=
all_addr'
>> kernel/trace/trace_syscalls.c:397: note: previous definition of 'arc=
h_syscall_addr' was here
>>
>> Caused by commit d156d1881ea54ec609d92388601661c2679439bb ("ftrace: =
unify
>> arch_syscall_addr() implementations") from the blackfin tree interac=
ting
>> with commit e7b8e675d9c71b868b66f62f725a948047514719 ("tracing: Unif=
y
>> arch_syscall_addr() implementations") from Linus' tree.
>>
>> These are slightly different versions of the same patch. but merging=
 with the blackfin tree managed to add a second copy of the above funct=
ion. =C2=A0I have applied the following patch for today.
>
> i'm traveling atm and wont be able to clean up my tree for a few more
> days. =C2=A0i'd suggest you just drop the Blackfin tree as well as yo=
ur
> local patch. =C2=A0i'll drop a line once things are sane again on my =
side.

my tree is sane again, so if you could pick it up again, that'd be
great.  thanks!
-mike
