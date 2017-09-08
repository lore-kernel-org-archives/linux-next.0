From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 8 Sep 2017 12:49:59 +1000
Message-ID: <20170908124940.032ada7e@canb.auug.org.au>
References: <20170801163904.7d49881a@canb.auug.org.au>
        <20170801205054.17c8579f@canb.auug.org.au>
        <00BCCF64-C319-44F0-992B-7F78D4676B5E@cs.rutgers.edu>
        <FB1FCBDA-1F7A-40C4-9415-3E6495B0B809@cs.rutgers.edu>
        <20170802154554.2fe6515b@canb.auug.org.au>
        <20170802163137.064ba4bf@canb.auug.org.au>
        <20170907152355.16f4490a@canb.auug.org.au>
        <20170907004612.4ac130b0e89daaa0e51b2f40@linux-foundation.org>
        <592A524A-150C-4209-BAA8-9CCDA25A2FA2@cs.rutgers.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <592A524A-150C-4209-BAA8-9CCDA25A2FA2@cs.rutgers.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Zi Yan <zi.yan@cs.rutgers.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

On Thu, 07 Sep 2017 06:59:09 -0400 "Zi Yan" <zi.yan@cs.rutgers.edu> wrote:
>
> I think __pmd(0) can be used now. I fixed __pmd() in sparc32 at commit
> 9157259d16a8ee8116a98d32f29b797689327e8d, which is in 4.13 now.
> I should have told you this earlier, sorry about that.
> 
> Just wonder if any other reason prevents us using __pmd().

OK, so today I have applied this instead (which is the same as dropping
mm-thp-enable-thp-migration-in-generic-path-fix-fix-fix):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 8 Sep 2017 12:40:39 +1000
Subject: [PATCH] mm-thp-enable-thp-migration-in-generic-path-fix-fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/swapops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index b88441d284e2..291c4b534658 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -291,7 +291,7 @@ static inline swp_entry_t pmd_to_swp_entry(pmd_t pmd)
 
 static inline pmd_t swp_entry_to_pmd(swp_entry_t entry)
 {
-	return (pmd_t){};
+	return __pmd(0);
 }
 
 static inline int is_pmd_migration_entry(pmd_t pmd)
-- 
2.13.2

-- 
Cheers,
Stephen Rothwell
