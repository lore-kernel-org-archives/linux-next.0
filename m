From: Michal Marek <mmarek@suse.cz>
Subject: Re: RFC: Removing old tags, reducing the git size of -next.
Date: Wed, 09 Mar 2011 10:41:32 +0100
Message-ID: <4D774B4C.7030409@suse.cz>
References: <1299039746.4208.28.camel@Joe-Laptop>	<20110302165447.f47fd4b2.sfr@canb.auug.org.au>	<4D764B59.1060801@suse.cz> <20110309032332.da40748b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56486 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756705Ab1CIJle (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Mar 2011 04:41:34 -0500
In-Reply-To: <20110309032332.da40748b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joe Perches <joe@perches.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, users@kernel.org

On 8.3.2011 17:23, Stephen Rothwell wrote:
> Hi Michal,
> 
> On Tue, 08 Mar 2011 16:29:29 +0100 Michal Marek <mmarek@suse.cz> wrote:
>>
>> FWIW, I use the following setup for linux-next:
>>
>> [remote "linux-next"]
>>         url =
>> git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git
> 
> This should now be
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (its the same repository, just a more generic name).
> 
>>         fetch = +refs/heads/master:refs/heads/linux-next
>>         fetch = +refs/heads/stable:refs/remotes/linux-next/stable
>>         tagopt = --no-tags
>>
>> and fetch the next-* tags manually only when I need them.
> 
> That should all continue to work.

I probably quoted the wrong part of your email. I wanted to show that
the full history of linux-next is not forced on anyone; git can be
configured to only fetch the latest state and leave the previously
fetched states to the garbage collector.

Michal
