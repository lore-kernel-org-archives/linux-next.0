From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: unable to fetch the cpufreq-move tree
Date: Tue, 7 Jun 2011 21:32:41 -0400
Message-ID: <20110608013241.GA15828@redhat.com>
References: <20110608112424.1147e26e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:65242 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932740Ab1FHBct (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Jun 2011 21:32:49 -0400
Content-Disposition: inline
In-Reply-To: <20110608112424.1147e26e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, Jun 08, 2011 at 11:24:24AM +1000, Stephen Rothwell wrote:
 > Hi Dave,
 > 
 > Fetching the cpufreq-move tree today gave this error:
 > 
 > fatal: Couldn't find remote ref refs/heads/move-drivers
 > 
 > I will use the version of the tree from next-20110608 for today (which
 > was empty, anyway).

Now that we've done the x86 move and some of the ARM drivers, I think
I'll just continue to add future moves to the 'next' branch.
Sorry for forgetting to give you a heads-up.

	Dave
