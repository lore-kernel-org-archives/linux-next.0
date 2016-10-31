From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: bad commit in the sunxi tree
Date: Mon, 31 Oct 2016 13:59:53 +1100
Message-ID: <8737jd2pg6.fsf@concordia.ellerman.id.au>
References: <20161025092255.3f4f59e2@canb.auug.org.au> <20161025094409.hhf5rg3gbzaryjom@lukather> <20161027104225.4f0f2774@canb.auug.org.au> <20161027204137.ef6kxlzyvftcdomn@lukather>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40373 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751012AbcJaC76 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 30 Oct 2016 22:59:58 -0400
In-Reply-To: <20161027204137.ef6kxlzyvftcdomn@lukather>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Maxime Ripard <maxime.ripard@free-electrons.com> writes:
> On Thu, Oct 27, 2016 at 10:42:25AM +1100, Stephen Rothwell wrote:
>> On Tue, 25 Oct 2016 11:44:09 +0200 Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>> > On Tue, Oct 25, 2016 at 09:22:55AM +1100, Stephen Rothwell wrote:
>> > > In today's sunxi tree
>> > > (git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git#sunxi/for-next)
>> > > I noticed that commit
>> > > 
>> > >   3861b711f8b5 ("ARM: sun5i: chip: add a node for the w1 gpio controller")
>> > > 
>> > > has no Signed-off-by from its committer.  
>> > 
>> > Thanks, this has been fixed.
>> > 
>> > Just out of curiosity, what command do you run to catch this?
>> 
>> None :-)  I look at the differences in each tree as I fetch it and
>> just happen to notice some of these sometimes.  I should have a git
>> hook to check that there is a Signed-off-by for the author and
>> committer, but I would have to invest some time to figure out how :-)
>
> Ok, that's actually the real question I had in mind, if you had a hook
> I could use in order to avoid that kind of things in the future :)

I don't run a hook, but I have a separate script which does checks like
that. I've pulled out the Signed-off-by check into a script below, which
might work for you, or at least give you something to start from.

cheers


#!/bin/bash

function check_sob_by_committer
{
	local commit=$1

	git rev-parse --verify ${commit}^2 > /dev/null 2>&1
	if [[ $? -eq 0 ]]; then
		# It has at least 2 parents, ie. it's a merge
		# We don't sign off merges, so we're done
		return
	fi

	committer=$(git log -1 --format='%cn <%ce>' $commit)

	git log -1 --format=%b $commit | grep "Signed-off-by: $committer" > /dev/null
	if [[ $? -ne 0 ]]; then
		echo "  Not SOB committer '$committer'"
		return 1
	fi

	return 0
}

check_sob_by_committer $1
exit $?
