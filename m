From: "NeilBrown" <neilb@suse.de>
Subject: Re: linux-next: md tree not fetchable
Date: Wed, 6 Aug 2008 13:44:56 +1000 (EST)
Message-ID: <d6381929b46c13d0da2e7bccee566ac4.squirrel@neil.brown.name>
References: <20080806131745.f5d377e6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:46200 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752612AbYHFDpE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Aug 2008 23:45:04 -0400
In-Reply-To: <20080806131745.f5d377e6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, August 6, 2008 1:17 pm, Stephen Rothwell wrote:
> Hi Neil,
>
> I could not fetch the md and md-current trees (git://neil.brown.name/md)
> today.  I got this error:
>
> fatal: The remote end hung up unexpectedly

That's what you get for running "apt-get upgrade" and not testing things
:-)

Fixed now.

>
> I will use what I had from yesterday.

Ok.

BTW, there is only the one tree that you need to pull: "for-next".
I think the other one (md-current??) was for-linus.  That will
always be included in for-next so does not need to be pulled separately.

Thanks,
NeilBrown
