From: Christian Brauner <christian@brauner.io>
Subject: Re: linux-next: build failure after merge of the pidfd tree
Date: Thu, 28 Mar 2019 03:28:25 +0100
Message-ID: <8EB36115-C5EB-4469-94F8-1D3DF1653ADB@brauner.io>
References: <20190328130449.1b6334b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328130449.1b6334b6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On March 28, 2019 3:04:49 AM GMT+01:00, Stephen Rothwell <sfr@canb=2Eauug=
=2Eorg=2Eau> wrote:
>Hi Christian,
>
>After merging the pidfd tree, today's linux-next build (arm
>multi_v7_defconfig) failed like this:
>
>kernel/pid=2Ec: In function '__do_sys_pidfd_open':
>kernel/pid=2Ec:652:7: error: 'fd' redeclared as different kind of symbol
>  long fd =3D -EINVAL;
>       ^~
>In file included from kernel/pid=2Ec:40:
>kernel/pid=2Ec:649:46: note: previous definition of 'fd' was here
> SYSCALL_DEFINE4(pidfd_open, pid_t, pid, int, fd, int, pidfd,
>                                         ~~~~~^~
>include/linux/syscalls=2Eh:117:27: note: in definition of macro
>'__SC_DECL'
> #define __SC_DECL(t, a) t a
>                           ^
>include/linux/syscalls=2Eh:112:35: note: in expansion of macro '__MAP3'
> #define __MAP4(m,t,a,=2E=2E=2E) m(t,a), __MAP3(m,__VA_ARGS__)
>                                   ^~~~~~
>include/linux/syscalls=2Eh:115:22: note: in expansion of macro '__MAP4'
> #define __MAP(n,=2E=2E=2E) __MAP##n(__VA_ARGS__)
>                      ^~~~~
>include/linux/syscalls=2Eh:253:36: note: in expansion of macro '__MAP'
>  static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
>                                    ^~~~~
>include/linux/syscalls=2Eh:226:2: note: in expansion of macro
>'__SYSCALL_DEFINEx'
>  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>  ^~~~~~~~~~~~~~~~~
>include/linux/syscalls=2Eh:218:36: note: in expansion of macro
>'SYSCALL_DEFINEx'
>#define SYSCALL_DEFINE4(name, =2E=2E=2E) SYSCALL_DEFINEx(4, _##name,
>__VA_ARGS__)
>                                    ^~~~~~~~~~~~~~~
>kernel/pid=2Ec:649:1: note: in expansion of macro 'SYSCALL_DEFINE4'
> SYSCALL_DEFINE4(pidfd_open, pid_t, pid, int, fd, int, pidfd,
> ^~~~~~~~~~~~~~~
>kernel/pid=2Ec:663:7: error: 'procfd' undeclared (first use in this
>function); did you mean 'pidfd'?
>   if (procfd !=3D -1 || pidfd !=3D -1)
>       ^~~~~~
>       pidfd
>kernel/pid=2Ec:663:7: note: each undeclared identifier is reported only
>once for each function it appears in
>
>Caused by commit
>
>  9170fba40db0 ("pid: add pidfd_open()")
>
>I have used the version of the pifd tree from next-20190327 for today=2E
>
>Please do *not* use linux-next as a development tree (I have seen
>several
>different version of this code over the past few days :-()=2E  The rules
>for linux-next included code include:
>"
>     * posted to the relevant mailing list,
>     * reviewed by you (or another maintainer of your subsystem tree),
>     * successfully unit tested, and=20
>     * destined for the current or next Linux merge window=2E
>
>Basically, this should be just what you would send to Linus (or ask him
>to fetch)=2E"

Yeah, that should not have ended up there=2E
This was caused by a faulty regex in my push script that pushes to differe=
nt servers=2E
One of them always builds a kernel and runs the tests that come with all p=
atches on the for-next and work branches=2E=20

Sorry about that=2E Should be fixed now=2E
Christian
