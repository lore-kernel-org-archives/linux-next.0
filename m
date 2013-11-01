From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next fixes
Date: Fri, 01 Nov 2013 08:09:57 -0700
Message-ID: <5273C445.7060900@infradead.org>
References: <20131101093638.GE27864@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:53499 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751162Ab3KAPKA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Nov 2013 11:10:00 -0400
In-Reply-To: <20131101093638.GE27864@ulmo.nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>

On 11/01/13 02:36, Thierry Reding wrote:
> Hi Stephen,
> 
> There have been some discussions lately revolving around the topic of
> linux-next fixes. That is, commits that people come up with over the
> course of a day to fix issues found in the latest linux-next trees.
> 
> It's a fact that many people rely on linux-next for everyday work, so
> whenever things break in linux-next a lot of people end up chasing the
> same bugs and posting the same patches (or not posting them for that
> matter).
> 
> A lot of developer time is wasted that way, so I originally proposed
> that we could set up a separate linux-next-fixes tree where we collect
> patches of interest. I volunteer to do that, since, well, I'm doing it
> anyway as part of my daily routine. Timezone-wise it also fits pretty
> well, since I usually start my day sometime around when you publish
> linux-next.
> 
> If we can establish a canonical location where such fixes are
> accumulated, people could fetch those at the same time they fetch the
> linux-next tree and automatically get fixes.

Stephen has had a location for linux-next fixes for quite some time now --
in the linux-next tree itself.

Apparently Olof objected to this and you agreed with him.
and I object to not having the fixes in the linux-next tree.
Maybe Stephen can work it out.  :)

> One idea was to carry those fixes within the linux-next tree, within
> separate tags (next-YYYYMMDD-fixes). If you don't feel comfortable with
> that I suppose we could also set up a separate repository. It that case
> I think it would still make sense to run it as part of the "Linux Next
> Group" on kernel.org.
> 
> What do you think? If it's something you'd be okay with I can contact
> the administrators to have me added to the linux-next group.


-- 
~Randy
