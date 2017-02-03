From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [tip:sched/core] sched/core: Add debugging code to catch missing
 update_rq_clock() calls
Date: Fri, 3 Feb 2017 09:53:01 +0100
Message-ID: <20170203085301.GA6515@twins.programming.kicks-ass.net>
References: <20160921133813.31976-8-matt@codeblueprint.co.uk>
 <tip-cb42c9a3ebbbb23448c3f9a25417fae6309b1a92@git.kernel.org>
 <87tw8gutp6.fsf@concordia.ellerman.id.au>
 <20170130213435.GM31613@codeblueprint.co.uk>
 <33118425-8548-475A-8DED-9A2424C0BCCC@linux.vnet.ibm.com>
 <1485863317.4498.2.camel@gmx.de>
 <CAOxpaSW_GnndoxLBPtyTrqPJ9XOWvgXOQNDf8D+6OohWeObn5Q@mail.gmail.com>
 <20170202155506.GX6515@twins.programming.kicks-ass.net>
 <3BAB5673-2BF8-46E0-8018-6A0F3DEEC9F7@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <3BAB5673-2BF8-46E0-8018-6A0F3DEEC9F7@linux.vnet.ibm.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc: Matt Fleming <matt@codeblueprint.co.uk>, Mike Galbraith <efault@gmx.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Ross Zwisler <zwisler@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 03, 2017 at 10:03:14AM +0530, Sachin Sant wrote:
> 
> > On 02-Feb-2017, at 9:25 PM, Peter Zijlstra <peterz@infradead.org> wrote:
> > 
> > On Tue, Jan 31, 2017 at 10:22:47AM -0700, Ross Zwisler wrote:
> >> On Tue, Jan 31, 2017 at 4:48 AM, Mike Galbraith <efault@gmx.de> wrote:
> >>> On Tue, 2017-01-31 at 16:30 +0530, Sachin Sant wrote:
> > 
> > 
> > Could some of you test this? It seems to cure things in my (very)
> > limited testing.
> > 
> 
> I ran few cycles of cpu hot(un)plug tests. In most cases it works except one
> where I ran into rcu stall:
> 
> [  173.493453] INFO: rcu_sched detected stalls on CPUs/tasks:
> [  173.493473] 	8-...: (2 GPs behind) idle=006/140000000000000/0 softirq=0/0 fqs=2996 
> [  173.493476] 	(detected by 0, t=6002 jiffies, g=885, c=884, q=6350)

Right, I actually saw that too, but I don't think that would be related
to my patch. I'll see if I can dig into this though, ought to get fixed
regardless.

Thanks for testing!
