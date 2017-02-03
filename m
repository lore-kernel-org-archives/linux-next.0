From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [tip:sched/core] sched/core: Add debugging code to catch missing
 update_rq_clock() calls
Date: Fri, 3 Feb 2017 16:34:09 +0530
Message-ID: <90137B89-B8B7-42AD-8A17-59D13ACB4E7B@linux.vnet.ibm.com>
References: <20160921133813.31976-8-matt@codeblueprint.co.uk>
 <tip-cb42c9a3ebbbb23448c3f9a25417fae6309b1a92@git.kernel.org>
 <87tw8gutp6.fsf@concordia.ellerman.id.au>
 <20170130213435.GM31613@codeblueprint.co.uk>
 <33118425-8548-475A-8DED-9A2424C0BCCC@linux.vnet.ibm.com>
 <1485863317.4498.2.camel@gmx.de>
 <CAOxpaSW_GnndoxLBPtyTrqPJ9XOWvgXOQNDf8D+6OohWeObn5Q@mail.gmail.com>
 <20170202155506.GX6515@twins.programming.kicks-ass.net>
 <3BAB5673-2BF8-46E0-8018-6A0F3DEEC9F7@linux.vnet.ibm.com>
 <20170203085301.GA6515@twins.programming.kicks-ass.net>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20170203085301.GA6515@twins.programming.kicks-ass.net>
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
To: Peter Zijlstra <peterz@infradead.org>
Cc: Matt Fleming <matt@codeblueprint.co.uk>, Ross Zwisler <zwisler@gmail.com>, Mike Galbraith <efault@gmx.de>, LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

<html><head></head><body dir="auto" style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class="ApplePlainTextBody"><div class="ApplePlainTextBody"><br><blockquote type="cite"><blockquote type="cite">[ &nbsp;173.493453] INFO: rcu_sched detected stalls on CPUs/tasks:<br>[ &nbsp;173.493473] <span class="Apple-tab-span" style="white-space:pre">	</span>8-...: (2 GPs behind) idle=006/140000000000000/0 softirq=0/0 fqs=2996 <br>[ &nbsp;173.493476] <span class="Apple-tab-span" style="white-space:pre">	</span>(detected by 0, t=6002 jiffies, g=885, c=884, q=6350)<br></blockquote><br>Right, I actually saw that too, but I don't think that would be related<br>to my patch. I'll see if I can dig into this though, ought to get fixed<br>regardless.<br><br></blockq
 uote><br>Thanks. If required I can help test the fix.<br><br><blockquote type="cite">Thanks for testing!<br></blockquote><br></div></body></html>
