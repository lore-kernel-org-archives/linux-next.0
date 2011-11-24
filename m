From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the cgroup tree with the pm tree
Date: Thu, 24 Nov 2011 13:12:29 -0800
Message-ID: <CAOS58YP146w66g2hyJSn10hWjtWmSjQBo36BaJ4ZibZcJAB0nw@mail.gmail.com>
References: <20111124152018.66ee4f15447837dd01443fdb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:60990 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754020Ab1KXVMa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Nov 2011 16:12:30 -0500
In-Reply-To: <20111124152018.66ee4f15447837dd01443fdb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>, "Rafael J. Wysocki" <rjw@sisk.pl>

Hello,

On Wed, Nov 23, 2011 at 8:20 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the cgroup tree got a conflict in
> kernel/cgroup_freezer.c between commit 6907483b4e80 ("freezer: make
> freezing indicate freeze condition in effect") from the pm tree and
> commit 41dfa07cedcc ("cgroup_freezer: fix freezing groups with stopped
> tasks") from the cgroup tree.
>
> I think that the latter is a superset of the former (but I may be wrong),
> so I used that.

We'll need to do freezing() || is_task_frozen_enough() there. I'll
update pm-freezer after I push cgroup fix upstream next week.

Thank you.

-- 
tejun
