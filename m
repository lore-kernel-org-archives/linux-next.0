From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: add utrace tree
Date: Fri, 22 Jan 2010 16:22:22 -0800 (PST)
Message-ID: <alpine.LFD.2.00.1001221614520.13231@localhost.localdomain>
References: <20100121013822.28781960.sfr@canb.auug.org.au>
	<20100122111747.3c224dfd.sfr@canb.auug.org.au>
	<20100121163004.8779bd69.akpm@linux-foundation.org>
	<20100121163145.7e958c3f.akpm@linux-foundation.org>
	<20100122005147.GD22003@redhat.com>
	<20100121170541.7425ff10.akpm@linux-foundation.org>
	<alpine.LFD.2.00.1001211724500.13231@localhost.localdomain>
	<20100122182827.GA13185@redhat.com>
	<20100122200129.GG22003@redhat.com>
	<alpine.LFD.2.00.1001221355250.13231@localhost.localdomain>
	<20100122221348.GA4263@redhat.com>
	<alpine.LFD.2.00.1001221604190.13231@localhost.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <utrace-devel-bounces@redhat.com>
In-Reply-To: <alpine.LFD.2.00.1001221604190.13231@localhost.localdomain>
List-Unsubscribe: <https://www.redhat.com/mailman/options/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/utrace-devel>
List-Post: <mailto:utrace-devel@redhat.com>
List-Help: <mailto:utrace-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=subscribe>
Sender: utrace-devel-bounces@redhat.com
Errors-To: utrace-devel-bounces@redhat.com
To: "Frank Ch. Eigler" <fche@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, utrace-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org



On Fri, 22 Jan 2010, Linus Torvalds wrote:
>
> No. It's not about naming. It's about the downside of having amorphous 
> interfaces that apparently don't even have rules, and are then used to 
> implement random crap.
> 
> Yes, the SNL skit about "It's a dessert topping _and_ a floor wax" was 
> funny, but it was funny exactly because it was crazy.

Put yet another way: I'd _much_ rather have two totally separate pieces 
that don't depend on each other, and do different things.

So to take a very practical example: I'd much rather have 'seccomp' and 
'ptrace' that have _nothing_ what-so-ever to do with each other, than have 
some intermediate layer that then needs to make both of those happy, and 
that both have to interact with.

There are cases where we really _want_ to have common code. We want to 
have a common VFS interface because we want to show _one_ interface to 
user space across a gazillion different filesystems. We want to have a 
common driver layer (as far as possible) because - again - we expose a 
metric shitload of drivers, and we want to have one unified interface to 
them.

But going the other way: trying to share code when the interfaces are 
fundamentally _different_ is generally not at all such a great idea. It 
ends up tying two conceptually totally separate things together, and 
suddenly people who work on feature X aneed to modify infrastructure that 
affects feature Y, and it turns ou that details A, B and C are all totally 
different for the two features and the middle layer has two conflicting 
things it needs to work with.

This is why when somebody brought up "you could do a seccomp-like thing on 
top of utrace" that my reaction was and is just totally negative. It shows 
all the wrong kinds of tying things together.

			Linus
