From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [linux-next: Tree for Jun 1] __khugepaged_exit
 rwsem_down_write_failed lockup
Date: Sat, 4 Jun 2016 16:51:14 +0900
Message-ID: <20160604075114.GA21108@swordfish>
References: <20160602014835.GA635@swordfish>
 <20160602092113.GH1995@dhcp22.suse.cz>
 <20160603071551.GA453@swordfish>
 <20160603072536.GB20676@dhcp22.suse.cz>
 <20160603084347.GA502@swordfish>
 <20160603095549.GD20676@dhcp22.suse.cz>
 <20160603100505.GE20676@dhcp22.suse.cz>
 <20160603133813.GA578@swordfish>
 <20160603134509.GI20676@dhcp22.suse.cz>
 <20160603134934.GJ20676@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35476 "EHLO
	mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750761AbcFDHvS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 4 Jun 2016 03:51:18 -0400
Content-Disposition: inline
In-Reply-To: <20160603134934.GJ20676@dhcp22.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Andrea Arcangeli <aarcange@redhat.com>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

On (06/03/16 15:49), Michal Hocko wrote:
> __khugepaged_exit is called during the final __mmput and it employs a
> complex synchronization dances to make sure it doesn't race with the
> khugepaged which might be scanning this mm at the same time. This is
> all caused by the fact that khugepaged doesn't pin mm_users. Things
> would simplify considerably if we simply check the mm at
> khugepaged_scan_mm_slot and if mm_users was already 0 then we know it
> is dead and we can unhash the mm_slot and move on to another one. This
> will also guarantee that __khugepaged_exit cannot race with khugepaged
> and so we can free up the slot if it is still hashed.
> 
> Signed-off-by: Michal Hocko <mhocko@suse.com>

with this patch and
http://ozlabs.org/~akpm/mmotm/broken-out/mm-thp-make-swapin-readahead-under-down_read-of-mmap_sem-fix-2.patch

I saw no problems during my tests (well, may be didn't test hard
enough).

	-ss
