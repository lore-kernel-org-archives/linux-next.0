From: Tejun Heo <tj@kernel.org>
Subject: Re: [HEADSUP] conflicts between cgroup/for-3.12 and memcg
Date: Fri, 9 Aug 2013 10:19:33 -0400
Message-ID: <20130809141933.GG20515@mtj.dyndns.org>
References: <20130809003402.GC13427@mtj.dyndns.org>
 <20130809072207.GA16531@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20130809072207.GA16531@dhcp22.suse.cz>
Sender: owner-linux-mm@kvack.org
To: Michal Hocko <mhocko@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, sfr@canb.auug.org.au, linux-next@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>, Balbir Singh <bsingharora@gmail.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, cgroups@vger.kernel.org, linux-mm@kvack.org
List-Id: linux-next.vger.kernel.org

Hello, Michal.

On Fri, Aug 09, 2013 at 09:22:07AM +0200, Michal Hocko wrote:
> I have just tried to merge cgroups/for-3.12 into my memcg tree and there
> were some conflicts indeed. They are attached for reference. The
> resolving is trivial. I've just picked up HEAD as all the conflicts are
> for added resp. removed code in mmotm.

Oops, that's me messing up the branches.  I was trying to reset
for-next but instead reset for-3.12 so that it didn't include the API
updates.  Can you please try to rebase on top of the current for-3.12
bd8815a6d802fc16a7a106e170593aa05dc17e72 ("cgroup: make
css_for_each_descendant() and friends include the origin css in the
iteration")?  At least the iterator update wouldn't be trivial, I
think.

Thanks.

-- 
tejun

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
