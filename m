From: Tom Tromey <tromey@redhat.com>
Subject: Re: linux-next: add utrace tree
Date: Tue, 26 Jan 2010 16:27:06 -0700
Message-ID: <m31vhch2gl.fsf@fleche.redhat.com>
References: <20100121013822.28781960.sfr@canb.auug.org.au>
	<20100122005147.GD22003@redhat.com>
	<20100121170541.7425ff10.akpm@linux-foundation.org>
	<alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
	<20100122182827.GA13185@redhat.com>
	<20100122200129.GG22003@redhat.com>
	<alpine.LFD.2.00.1001221355250.13231@localhost.localdomain>
	<20100122221348.GA4263@redhat.com>
	<alpine.LFD.2.00.1001221604190.13231@localhost.localdomain>
	<alpine.LFD.2.00.1001221614520.13231@localhost.localdomain>
	<f73f7ab81001222220jfaf2edfwca3fa4c22b0b4d72@mail.gmail.com>
	<alpine.LFD.2.00.1001232051510.3574@localhost.localdomain>
	<m33a1tnbd9.fsf@fleche.redhat.com> <877hr4g49l.fsf@basil.nowhere.org>
Reply-To: Tom Tromey <tromey@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <utrace-devel-bounces@redhat.com>
In-Reply-To: <877hr4g49l.fsf@basil.nowhere.org> (Andi Kleen's message of "Tue,
	26 Jan 2010 18:33:26 +0100")
List-Unsubscribe: <https://www.redhat.com/mailman/options/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/utrace-devel>
List-Post: <mailto:utrace-devel@redhat.com>
List-Help: <mailto:utrace-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=subscribe>
Sender: utrace-devel-bounces@redhat.com
Errors-To: utrace-devel-bounces@redhat.com
To: Andi Kleen <andi@firstfloor.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kyle Moffett <kyle@moffetthome.net>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, "Frank Ch. Eigler" <fche@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Tom> * Use an fd, not SIGCHLD+wait, to report inferior state changes to gdb.
Tom> Internally we're already using a self-pipe to integrate this into
Tom> gdb's main loop.  Relatedly, don't mess with the inferior's parentage.

Andi> How would having a kernel based solution be better over your
Andi> user space simulation?

Signals and wait are a pain because if we want to use some random
library in gdb, there might be conflicts.  This is true even if we use
signalfd.  An fd-for-debugging does not have this problem.  This matters
more now that we're letting people script gdb in python.

Tom
