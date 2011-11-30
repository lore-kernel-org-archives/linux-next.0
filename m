From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: merge conflict resolution for pm-freezer
Date: Wed, 30 Nov 2011 20:51:54 +0100
Message-ID: <201111302051.54501.rjw@sisk.pl>
References: <20111128233055.GF3858@google.com> <201111292321.27660.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:36106 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751039Ab1K3TtB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Nov 2011 14:49:01 -0500
In-Reply-To: <201111292321.27660.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: sfr@canb.auug.org.au, linux-pm@vger.kernel.org, linux-next@vger.kernel.org

On Tuesday, November 29, 2011, Rafael J. Wysocki wrote:
> On Tuesday, November 29, 2011, Tejun Heo wrote:
> > Hello, Rafael, Stephen.
> > 
> > Linus just pulled cgroup fixes which conflicts with pm-freezer.  The
> > resolution is mostly trivial.  The cgroup fix changes frozen() test to
> > is_task_frozen_enough() while pm-freezer commit prepends "freezing()
> > && " to it.  They just need to be combined into "freezing() &&
> > is_task_frozen_enough()".
> > 
> > The following git branch contains merged branch.  I pulled the current
> > linus/master a34815b96 "Merge branch 'for-3.2-fixes' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup" into
> > pm-freezer and resolved the conflict described above.
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tj/misc.git pm-freezer-merge
> > 
> > Rafael, please feel free to pull or resolve in any way you see fit.
> 
> Well, could you please post a fix patch on top of my pm-freezer branch?
> That would be the most convenient way to me. :-)

No, that won't work.  I think I'll resolve the conflict when merging pm-freezer
into pm-for-linus later.

Thanks,
Rafael
