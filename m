From: "Frank Ch. Eigler" <fche@redhat.com>
Subject: Re: linux-next: add utrace tree
Date: Fri, 22 Jan 2010 16:44:24 -0500
Message-ID: <20100122214424.GH22003@redhat.com>
References: <20100121013822.28781960.sfr@canb.auug.org.au>
	<20100122111747.3c224dfd.sfr@canb.auug.org.au>
	<20100121163004.8779bd69.akpm@linux-foundation.org>
	<20100121163145.7e958c3f.akpm@linux-foundation.org>
	<20100122005147.GD22003@redhat.com>
	<20100121170541.7425ff10.akpm@linux-foundation.org>
	<alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
	<20100122182827.GA13185@redhat.com>
	<20100122200129.GG22003@redhat.com>
	<1264191376.4283.1590.camel@laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <utrace-devel-bounces@redhat.com>
Content-Disposition: inline
In-Reply-To: <1264191376.4283.1590.camel@laptop>
List-Unsubscribe: <https://www.redhat.com/mailman/options/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/utrace-devel>
List-Post: <mailto:utrace-devel@redhat.com>
List-Help: <mailto:utrace-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=subscribe>
Sender: utrace-devel-bounces@redhat.com
Errors-To: utrace-devel-bounces@redhat.com
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

Hi -

On Fri, Jan 22, 2010 at 09:16:16PM +0100, Peter Zijlstra wrote:
> [...]
> > So then there's uprobes, which is another potential utrace "killer
> > app"

> That's bollocks, uprobes is an utter and total mis-match for utrace.
> Probing userspace is primarily about DSOs which is files and vma's,
> not tasks. [...]

Your experience with user-space probing apparently differs from ours.
In fact there exists plenty of interest and utility in probing given
processes only, if for no other reason then to avoid disrupting others
running on the machine.

Nearly always, it is better to build a multiprocess probing widget
from multiply-applied single-process ones, rather than to build
single-process probing from grossly-filtered systemwide/VMA ones.
(If the lower level infrastructure provides both options, groovy.)

- FChE
