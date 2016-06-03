From: Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Fri, 3 Jun 2016 17:10:01 +0200
Message-ID: <20160603151001.GG29930@redhat.com>
References: <20160601131122.7dbb0a65@canb.auug.org.au>
 <20160602014835.GA635@swordfish>
 <20160602092113.GH1995@dhcp22.suse.cz>
 <20160602120857.GA704@swordfish>
 <20160602122109.GM1995@dhcp22.suse.cz>
 <20160603135154.GD29930@redhat.com>
 <20160603144600.GK20676@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:61898 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751143AbcFCPKE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 3 Jun 2016 11:10:04 -0400
Content-Disposition: inline
In-Reply-To: <20160603144600.GK20676@dhcp22.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hugh Dickins <hughd@google.com>

Hello Michal,

CC'ed Hugh,

On Fri, Jun 03, 2016 at 04:46:00PM +0200, Michal Hocko wrote:
> What do you think about the external dependencies mentioned above. Do
> you think this is a sufficient argument wrt. occasional higher
> latencies?

It's a tradeoff and both latencies would be short and uncommon so it's
hard to tell.

There's also mmput_async for paths that may care about mmput
latencies. Exit itself cannot use it, it's mostly for people taking
the mm_users pin that may not want to wait for mmput to run. It also
shouldn't happen that often, it's a slow path.

The whole model inherited from KSM is to deliberately depend only on
the mmap_sem + test_exit + mm_count, and never on mm_users, which to
me in principle doesn't sound bad. I consider KSM version a
"finegrined" implementation but I never thought it would be a problem
to wait a bit in exit() in case the slow path hits. I thought it was
more of a problem if exit() runs, the parent then start a new task but
the memory wasn't freed yet.

So I would suggest Hugh to share his view on the down_write/up_write
that may temporarily block mmput (until the next test_exit bailout
point) vs higher latency in reaching exit_mmap for a real exit(2) that
would happen with the proposed change.

Thanks!
Andrea
