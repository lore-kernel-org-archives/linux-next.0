From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: Tree for July 10 (cpufreq oops)
Date: Fri, 10 Jul 2009 15:07:28 -0400
Message-ID: <20090710190728.GA6240@redhat.com>
References: <20090710151846.c7ebec37.sfr@canb.auug.org.au> <200907102054.37956.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:50140 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752440AbZGJTHl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Jul 2009 15:07:41 -0400
Content-Disposition: inline
In-Reply-To: <200907102054.37956.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 10, 2009 at 08:54:37PM +0200, Bartlomiej Zolnierkiewicz wrote:
 > On Friday 10 July 2009 07:18:46 Stephen Rothwell wrote:
 > > Hi all,
 > > 
 > > Changes since 20090709:
 >  
 > [ this particular problem goes back to next-20090709 ]
 > 
 > From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
 > Subject: [PATCH] cpufreq: fix OOPS in __cpufreq_governor()
 > 
 > commit 0d923c15b774bed3491400bae6db50481ac8b9e4 ("[CPUFREQ] Factor out
 > policy setting from cpufreq_add_dev") accidentally reordered new_policy
 > setup and policy->governor reset.
 > 
 > Fix it, also update comment to match the function name while at it.

Thanks Bart, good eyes.

I'll fold this into the original patch and regenerate the tree.

	Dave 
