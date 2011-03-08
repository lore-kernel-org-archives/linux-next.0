From: Michal Marek <mmarek@suse.cz>
Subject: Re: RFC: Removing old tags, reducing the git size of -next.
Date: Tue, 08 Mar 2011 16:29:29 +0100
Message-ID: <4D764B59.1060801@suse.cz>
References: <1299039746.4208.28.camel@Joe-Laptop> <20110302165447.f47fd4b2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55428 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755120Ab1CHP3b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Mar 2011 10:29:31 -0500
In-Reply-To: <20110302165447.f47fd4b2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joe Perches <joe@perches.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, users@kernel.org

On 2.3.2011 06:54, Stephen Rothwell wrote:
> Hi Joe,
> 
> On Tue, 01 Mar 2011 20:22:26 -0800 Joe Perches <joe@perches.com> wrote:
>>
>> I personally do not find git history to be very useful
>> for the next tree.  The collected next tree history
>> also makes the repository fairly large and unwieldy to
>> use on smaller development systems.
> 
> Yeah, I have been thinking about this again recently.
> 
>> Would it be reasonable to create a separate history tree
>> for -next every once in awhile and have say a maximum of
>> a few weeks of next history in the current tree?
> 
> I could easily have a tree that is historical and contains what the
> current linux-next tree contains while also removing old stuff from the
> normal linux-next tree (I could push into both each day).  The only
> connection between the daily releases is the "history" branch which,
> frankly, does not serve any purpose and I will remove.

FWIW, I use the following setup for linux-next:

[remote "linux-next"]
        url =
git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git
        fetch = +refs/heads/master:refs/heads/linux-next
        fetch = +refs/heads/stable:refs/remotes/linux-next/stable
        tagopt = --no-tags

and fetch the next-* tags manually only when I need them.

Michal
