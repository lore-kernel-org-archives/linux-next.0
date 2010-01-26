From: Renzo Davoli <renzo@cs.unibo.it>
Subject: Re: linux-next: add utrace tree
Date: Tue, 26 Jan 2010 01:02:37 +0100
Message-ID: <20100126000237.GA15936@cs.unibo.it>
References: <f73f7ab81001222220jfaf2edfwca3fa4c22b0b4d72@mail.gmail.com>
	<20100123112333.GA15455@elte.hu> <20100123114729.GA7828@redhat.com>
	<20100123194820.GM21263@thunk.org>
	<f73f7ab81001241742t1f827ddetd958e1949787020f@mail.gmail.com>
	<alpine.LFD.2.00.1001250845180.3574@localhost.localdomain>
	<20100125170254.GB22862@redhat.com>
	<alpine.LFD.2.00.1001250930320.3574@localhost.localdomain>
	<1264451453.3028.59.camel@springer.wildebeest.org>
	<alpine.LFD.2.00.1001251236160.3574@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <utrace-devel-bounces@redhat.com>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1001251236160.3574@localhost.localdomain>
List-Unsubscribe: <https://www.redhat.com/mailman/options/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/utrace-devel>
List-Post: <mailto:utrace-devel@redhat.com>
List-Help: <mailto:utrace-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=subscribe>
Sender: utrace-devel-bounces@redhat.com
Errors-To: utrace-devel-bounces@redhat.com
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kyle Moffett <kyle@moffetthome.net>, tytso@mit.edu, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Mark Wielaard <mjw@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, "Frank Ch. Eigler" <fche@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Let me add my two euro-cents to this discussion.

Mark Wielaard <mjw@redhat.com>:
> Unfortunately ptrace does all that magic already (badly). People don't
> just use it for (s)tracing syscalls, but also for tracing signals, for
>  single step debugging and poking at memory, register state, for process
> jailing and virtualization (uml) through syscall emulation.
> So when they are talking about these fancy things that is because that
> is what ptrace gives them currently. And they hate it, because the
> ptrace interface is such a pain to work with. And all these things don't
> really work together. You cannot trace, emulate, debug, jail at the same
> time.
I support Mark's words. I don't use ptrace for debugging/tracing and I
have experienced severe limitations of ptrace interface.
(I have tried to post some extensions for ptrace to overcome some 
constraints.... see my posts on ptrace_vm or ptrace_multi on LKML).

Oleg Nesterov, writing to Andrew Morton said:
> First of all, utrace makes other things possible.  gdbstub,
> nondestructive core dump, uprobes, kmview, hopefully more.  I didn't
> look at these projects closely, perhaps other people can tell more.  As
> for their merge status, until utrace itself is merged it is very hard to
> develop them out of tree.

In the list above there is also kmview, which is a creature of mines.
umview and kmview are partial virtual machines, processes running
in a [uk]mview machine can have their own view for the file system, 
networking support, user-id, system-name, etc.
A [uk]mview machine virtualizes just what the user need: the filesystem
or just a subtree/some subtrees or networking or define one/some
virtual devices, etc. The "view" provided by a [uk]mview machine can be
a composition of real resources (provided by the Linux kernel) and
virtual resources.

Each system call request gets hijacked to a module of [uk]mview when
it refers to a virtual resource. The request is forwarded to the kernel
otherwise.

umview is based on ptrace, kmview uses a kernel module based on utrace.
(umview is included in debian lenny (to sid), tutorial and manuals in 
wiki.virtualsquare.org)

IMHO utrace is better than ptrace (or an optimized version of it):
1 - "Frank Ch. Eigler" wrote: 
> At least one reason is that ptrace is single-usage-only, so for
> example you cannot concurrently debug & strace the same program.
  - exactly. utrace allows multiple tracing engines, this means that kmview 
  machines can be nested (in a natural way, no extra code is needed for
  this feature). In the same way strace/gdb can run on virtualized processes, too.
2 - kmview kernel module implements several optimizations
  to minimize the number of requests forwarded to the kmview process
  (the virtual machine monitor). kmview is just a module using the
  utrace interface, prior attempts of optimized umview required kernel patches.
  Like kmview any other service requiring process tracing can include 
  specific optimizations in its own kernel module.
  On the other hand, all these services could use the standardized utrace
  interface for their optimizations, instead asking for messy patches 
  to change code all around the kernel source.
3 - ptrace takes SIGSTOP/SIGCONT for its own management. Strace/gdb and
  umview cannot be transparent for programs using these signals.

Oleg Nesterov talking about Ptrace said:
> Of course they can't use other interfaces, we don't have them. And
> without the new abstraction layer we will never have, I think.
I agree.

THe following list includes the execution times I got in a recent test 
(make vde-2, see http://www.cs.unibo.it/~renzo/view-os-lk2009.pdf)
plain kernel 22.7s, 
kmview (no modules) 23.9s (+5.5%), 
full kmview (modules loaded, all syscall virtualized) 38.5s (+70%)
optimized umview 51.0 (+124%), 
umview on vanilla kernel 75.7s (+233%).

utrace can be used to speedup virtualization (at least in my case
it worked in this way). 
Performance can be useful for debugging but it is a main issue for
virtualization.
Kmview module provides optimizations to select the system call requests 
depending on the syscall number, the pathnames or the file descriptors. 
http://wiki.virtualsquare.org/index.php/KMview_module_interface_specifications
Trying to add all the optimizations needed by different projects to ptrace is a
never-ending nightmare: the LKML will continue to receive patch proposals
for ptrace... 
The solution is that everybody can code his/her optimized kernel/user 
interface for tracing in his/her kernel module, i.e. utrace.

renzo
