From: Dave Jones <davej@redhat.com>
Subject: Re: linux-next: x86/cpufreq merge conflict
Date: Mon, 19 May 2008 18:26:04 -0400
Message-ID: <20080519222604.GC20207@redhat.com>
References: <20080519143927.e8b43d39.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:59694 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755727AbYESW0U (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 18:26:20 -0400
Content-Disposition: inline
In-Reply-To: <20080519143927.e8b43d39.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

On Mon, May 19, 2008 at 02:39:27PM +1000, Stephen Rothwell wrote:
 > Hi Dave, Ingo,
 > 
 > Today's linux-next cpufreq merge got a conflict in
 > drivers/cpufreq/cpufreq.c between commit
 > fdbf6c63c1bd250d45a59a6392fa18ccb360837b ("x86: Use performance variant
 > for_each_cpu_mask_nr") from the x86 tree and commit
 > ae47c109341198f814767d2f06a1c1e4c7910fb9 ("[CPUFREQ] change cpu freq
 > arrays to per_cpu variables") from the cpufreq tree.  The conflict is
 > just contextual with the former changing for_each_cpu_mask to
 > for_each_cpu_mask_nr in a couple of places right next to the latter
 > changing "cpufreq_cpu_data[j]" to "per_cpu(cpufreq_cpu_data, j)".

ok, so how do we deal with this? Either Ingo or myself will have
to fix it up depending on whoever merges into .27 first I guess,
but in the interim, you'll have to carry that diff ?
Or should one of us drop a diff, and merge both through the other tree?

 > I did the obvious fixups but maybe worth a look.

btw, I've just slightly changed my workflow for the cpufreq.git tree.
>From now on, pull from the 'next' branch.   master will be untouched,
and 'fixes' will be stuff that will go to linus v. soon in the current cycle.

	Dave

-- 
http://www.codemonkey.org.uk
