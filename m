From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: Linux 4.0-rc1 out..
Date: Tue, 24 Feb 2015 14:40:34 -0500
Message-ID: <20150224194034.GA3042@home.goodmis.org>
References: <CA+55aFzS==STcTbwabdvw=7_xX08kkUd=g2Q4XbWJzKbpjyN1A@mail.gmail.com>
 <20150223161541.22df98cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150223161541.22df98cc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Feb 23, 2015 at 04:15:41PM +1100, Stephen Rothwell wrote:
> 
> There are also 265 commits in next-20150209 that didn't make it into
> v4.0-rc1.
> 
> Top ten first word of commit summary:
> 
>      25 rcu
>      24 arm
>      20 selftests
>      19 mm
>      11 arm-soc
>       6 documentation
>       5 tracing

Yep, that was my tracefs code. It's all ready to go mainline, but then
I did some stress testing on perf, and found that perf hard coded the
mount id into itself, and ignored traceevents if they were not in the
debugfs system (even if the path was the same!). I sent patches to fix
this but because those patches didn't make it into the release, I decide
to not push this knowing it will cause issues with perf.

Thus, tracefs needs to wait till perf is updated before I push it out.

-- Steve


>       5 staging
>       5 libceph
>       5 ceph
> 
