From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: comment on the kbuild tree
Date: Wed, 15 May 2013 14:25:38 +0200
Message-ID: <51937EC2.6050604@suse.cz>
References: <20130515092505.294f3a8865c77e8420d27491@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56378 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754535Ab3EOMZn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 May 2013 08:25:43 -0400
In-Reply-To: <20130515092505.294f3a8865c77e8420d27491@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 15.5.2013 01:25, Stephen Rothwell wrote:
> Hi Michal,
> 
> Since the kbuild tree now consists only of merge commits (relative to
> v3.10-rc1), you might as well just reset it to v3.10-rc1 and have a nice
> clean tree to start from.

I thought I would newer rebase the for-next branch to allow people to
pull from it. But I can see that it looks much cleaner in the linux-next
tree if you can do a git log stable..master and see what is really in
linux-next. So I reset it to v3.10-rc1 now.

Michal
