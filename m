From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: linux-next: add utrace tree
Date: Mon, 8 Feb 2010 01:53:49 -0800
Message-ID: <20100208015349.36a12efe@infradead.org>
References: <f73f7ab81001222220jfaf2edfwca3fa4c22b0b4d72@mail.gmail.com>
	<alpine.LFD.2.00.1001232051510.3574@localhost.localdomain>
	<m33a1tnbd9.fsf@fleche.redhat.com>
	<alpine.LFD.2.00.1001251332370.3574@localhost.localdomain>
	<m3636oh2rt.fsf@fleche.redhat.com>
	<alpine.LFD.2.00.1001261535510.17519@localhost.localdomain>
	<1264575134.4283.1983.camel@laptop>
	<alpine.LFD.2.00.1001270231520.24253@localhost.localdomain>
	<1264600792.31321.464.camel@gandalf.stny.rr.com>
	<4B607B1A.3080007@zytor.com> <20100208065425.GB1290@ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <utrace-devel-bounces@redhat.com>
In-Reply-To: <20100208065425.GB1290@ucw.cz>
List-Unsubscribe: <https://www.redhat.com/mailman/options/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/utrace-devel>
List-Post: <mailto:utrace-devel@redhat.com>
List-Help: <mailto:utrace-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/utrace-devel>,
	<mailto:utrace-devel-request@redhat.com?subject=subscribe>
Sender: utrace-devel-bounces@redhat.com
Errors-To: utrace-devel-bounces@redhat.com
To: Pavel Machek <pavel@ucw.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kyle Moffett <kyle@moffetthome.net>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Oleg Nesterov <oleg@redhat.com>, rostedt@goodmis.org, LKML <linux-kernel@vger.kernel.org>, Tromey <tromey@redhat.com>, "Frank Ch.
	Eigler" <fche@redhat.com>, linux-next@vger.kernel.org, Tom@redhat.com, utrace-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

On Mon, 8 Feb 2010 07:54:25 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> > No, it has nothing to do with ring.  It has to do with modifying
> > code that another CPU could be executing at the same time, and with
> > modifying code on the same processor through another virtual alias
> > (they are different issues.)  The same issues apply regardless of
> > the CPL of the processor.
> 
> ...but these are always 'there could be cpu bugs around' issues,
> right? Like amd k6. AFAICT x86 always supported self-modifying code
> without any extra barriers needed...

self modifying code yes, cross modifying code no.


-- 
Arjan van de Ven 	Intel Open Source Technology Centre
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
