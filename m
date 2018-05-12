From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: a new pending-fixes branch
Date: Sat, 12 May 2018 10:14:19 +0300
Message-ID: <87603t1h2s.fsf@purkki.adurom.net>
References: <20180512143523.250ab803@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180512143523.250ab803@canb.auug.org.au> (Stephen Rothwell's
        message of "Sat, 12 May 2018 14:35:23 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, 0-Day Mailing List <lkp@lists.01.org>, Sasha Levin <Alexander.Levin@microsoft.com>, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> As an outcome of some discussion, I have added a pending-fixes branch
> to linux-next.  This branch contains Linus' tree merged with branches
> containing only fixes pending for the current release.  The branch is a
> strict subset of linux-next each day (as so rebases like linux-next
> does).
>
> It would be good if this branch could be tested by the 0-Day service
> and any other testing that people do - in the hope of sending fewer
> "fixes causing bugs" patches to Linus.
>
> There is not intention that bug fixes for Linus' tree should
> necessarily be tested in linux-next before being forwarded, but
> (especially for slightly less urgent bugs, at least) it seems like a
> good idea.
>
> I currently have 55 branches of bug fixes included.

Is there a list of branches you use available somewhere? I would like to
check that wireless-drivers is included.

-- 
Kalle Valo
