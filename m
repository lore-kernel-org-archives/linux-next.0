From: "Frank Ch. Eigler" <fche@redhat.com>
Subject: Re: linux-next: add utrace tree
Date: Thu, 21 Jan 2010 20:25:16 -0500
Message-ID: <20100122012516.GE22003@redhat.com>
References: <20100120054950.GB27108@elte.hu> <20100120061551.GB6588@in.ibm.com>
	<20100120062834.GB12165@elte.hu> <20100120072925.GA11395@elte.hu>
	<20100121013822.28781960.sfr@canb.auug.org.au>
	<20100122111747.3c224dfd.sfr@canb.auug.org.au>
	<20100121163004.8779bd69.akpm@linux-foundation.org>
	<20100121163145.7e958c3f.akpm@linux-foundation.org>
	<20100122005147.GD22003@redhat.com>
	<20100121170541.7425ff10.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <utrace-devel-bounces@redhat.com>
Content-Disposition: inline
In-Reply-To: <20100121170541.7425ff10.akpm@linux-foundation.org>
List-Unsubscribe: <https://www.redhat.com/mailman/options/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/utrace-devel>
List-Post: <mailto:utrace-devel@redhat.com>
List-Help: <mailto:utrace-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=subscribe>
Sender: utrace-devel-bounces@redhat.com
Errors-To: utrace-devel-bounces@redhat.com
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Linus <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>
List-Id: linux-next.vger.kernel.org

Hi -

On Thu, Jan 21, 2010 at 05:05:41PM -0800, Andrew Morton wrote:

> [...]  ptrace is a nasty, complex part of the kernel which has a
> long history of problems, but it's all been pretty quiet in there
> for the the past few years.  This leads one to expect that a
> rip-out-n-rewrite is a high-risk prospect.  So, quite reasonably,
> one looks for a good reason for taking such risk. [...]

To the extent the discussion is colored by risk avoidance, then the
answer to that would consist of code reviews, and of course a look at
the actual historical reliability of this code.  While some might
enjoy reminding us about the brief kerneloops incident in 2008, let's
keep in mind that versions of this code has been deployed in fedora
and rhel for several *years*, with millions of users.  It's not some
rickety experiment.

To the extent the discussion is colored by the new features enabled
from this refactoring, well, there is Oleg's list which may or may not
have mentioned enabling systemtap's user-space probing.  More details
can be furnished on demand.  Several of the use examples were
constructed in good faith upon request from the kernel community
asking for more and more.  But what's enough?  Who knows, really?


- FChE
