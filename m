From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] mm, debug: mm-introduce-vm_bug_on_mm-fix-fix.patch
Date: Tue, 23 Sep 2014 16:12:04 -0400
Message-ID: <20140923201204.GB4252@redhat.com>
References: <5420b8b0.9HdYLyyuTikszzH8%akpm@linux-foundation.org>
 <1411464279-20158-1-git-send-email-mhocko@suse.cz>
 <20140923112848.GA10046@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20140923112848.GA10046@dhcp22.suse.cz>
Sender: owner-linux-mm@kvack.org
To: Michal Hocko <mhocko@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, Sasha Levin <sasha.levin@oracle.com>
List-Id: linux-next.vger.kernel.org

On Tue, Sep 23, 2014 at 01:28:48PM +0200, Michal Hocko wrote:
 > And there is another one hitting during randconfig. The patch makes my
 > eyes bleed but I don't know about other way without breaking out the
 > thing into separate parts sounds worse because we can mix with other
 > messages then.

how about something along the lines of..

 bufptr = buffer = kmalloc()

 #if defined(CONFIG_NUMA_BALANCING) || defined(CONFIG_COMPACTION)
	bufptr += sprintf(bufptr, "tlb_flush_pending %d\n",
			mm->tlb_flush_pending);
 #endif

 #ifdef CONFIG_MMU
	bufptr += sprintf(bufptr, "...
 #endif

 ...

 printk(KERN_EMERG "%s", buffer);

 free(buffer);


Still ugly, but looks less like a trainwreck, and keeps the variables
with the associated text.

It does introduce an allocation though, which may be problematic
in this situation. Depending how big this gets, perhaps make it static
instead?

	Dave

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
