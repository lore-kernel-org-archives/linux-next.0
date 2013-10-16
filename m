From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the tip tree
Date: Wed, 16 Oct 2013 22:14:10 +0200
Message-ID: <20131016201410.GA26785@twins.programming.kicks-ass.net>
References: <1381949500-501-1-git-send-email-treding@nvidia.com>
 <1381949500-501-2-git-send-email-treding@nvidia.com>
 <20131016200645.GD10651@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131016200645.GD10651@twins.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Shaohua Li <shli@kernel.org>, NeilBrown <neilb@suse.de>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Oct 16, 2013 at 10:06:45PM +0200, Peter Zijlstra wrote:
> On Wed, Oct 16, 2013 at 08:51:39PM +0200, Thierry Reding wrote:
> > Today's linux-next merge of the tip tree got a conflict in
> > 
> > 	include/linux/wait.h
> > 
> > caused by commits 1ab2460 (wait: add wait_event_cmd()) and fb869b6
> > (sched/wait: Clean up wait.h details a bit).
> 
> Gargh, where did that come from?!

Also, wth does that live?


# git show 1ab2460
fatal: ambiguous argument '1ab2460': unknown revision or path not in the working tree.
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'
# git remote show next
* remote next
  Fetch URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

And I made sure to update the remote.
