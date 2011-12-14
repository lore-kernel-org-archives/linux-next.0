From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: manual merge of the akpm tree with the cgroup tree
Date: Wed, 14 Dec 2011 19:11:34 +0100
Message-ID: <20111214181131.GG10791@somewhere.redhat.com>
References: <20111214175101.daac0549e5ed9d766c3a9bb5@canb.auug.org.au>
 <20111214161628.GC10791@somewhere.redhat.com>
 <20111214100851.2ead3872.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:59658 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755460Ab1LNSLk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Dec 2011 13:11:40 -0500
Content-Disposition: inline
In-Reply-To: <20111214100851.2ead3872.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

On Wed, Dec 14, 2011 at 10:08:51AM -0800, Andrew Morton wrote:
> On Wed, 14 Dec 2011 17:16:31 +0100 Frederic Weisbecker <fweisbec@gmail.com> wrote:
> 
> > > 
> > > cgroups: new cancel_attach_task() subsystem callback
> > > cgroups: ability to stop res charge propagation on bounded ancestor
> > > cgroups: add res counter common ancestor searching
> > > res_counter: allow charge failure pointer to be null
> > > cgroups: pull up res counter charge failure interpretation to caller
> > > cgroups: allow subsystems to cancel a fork
> > > cgroups: add a task counter subsystem
> > > cgroups: ERR_PTR needs err.h
> > > cgroup: Fix task counter common ancestor logic
> > > cgroup-fix-task-counter-common-ancestor-logic-checkpatch-fixes
> > > 
> > > I am wondering if that patch set should be included in the cgroup tree?
> > 
> > That would be probably the easier solution.
> > Andrew, do you mind if I rebase these patches and target them to Tejun's
> > tree instead?
> 
> Sure, that works,  I'll drop them.

Cool.

> > We can keep them on a standalone branch there based on Tejuns until
> > we reach an agreement on their upstreamability.
> 
> I wondered what had been happening with that discussion.  I guess we
> need to restart it.
> 

Dan J Walsh and Daniel Berrange who work on lxc and for whom I'm primarily
working on this feature have added their point of view. You might want to
have a look.

I can post something that synthetize everybody's words.
