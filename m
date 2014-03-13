From: Michal Hocko <mhocko@suse.cz>
Subject: Re: mmotm 2014-03-12-16-04 uploaded
Date: Thu, 13 Mar 2014 18:04:23 +0100
Message-ID: <20140313170423.GI4473@dhcp22.suse.cz>
References: <20140312230510.69CD831C078@corp2gmr1-1.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20140312230510.69CD831C078@corp2gmr1-1.hot.corp.google.com>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed 12-03-14 16:05:10, Andrew Morton wrote:
[...]
> A git tree which contains the memory management portion of this tree is
> maintained at git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git
> by Michal Hocko.  It contains the patches which are between the
> "#NEXT_PATCHES_START mm" and "#NEXT_PATCHES_END" markers, from the series
> file, http://www.ozlabs.org/~akpm/mmotm/series

I am sorry but I didn't get to update the last two releases and probably
wont't make the next in this release cycle because I am quite busy with
other stuff and there are too many cross tree conflicts to have this
automated (notably slab and cgroup trees are conflicting a lot). Let's
see whether I can sort it out before traveling to LSF next week
otherwise I will start after getting back (around 12th Apr. after
vacation) with a new release cycle. Sorry about that!
-- 
Michal Hocko
SUSE Labs

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
