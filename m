From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 2 Aug 2017 16:31:45 +1000
Message-ID: <20170802163137.064ba4bf@canb.auug.org.au>
References: <20170801163904.7d49881a@canb.auug.org.au>
        <20170801205054.17c8579f@canb.auug.org.au>
        <00BCCF64-C319-44F0-992B-7F78D4676B5E@cs.rutgers.edu>
        <FB1FCBDA-1F7A-40C4-9415-3E6495B0B809@cs.rutgers.edu>
        <20170802154554.2fe6515b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170802154554.2fe6515b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Zi Yan <zi.yan@cs.rutgers.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

On Wed, 2 Aug 2017 15:45:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Tue, 01 Aug 2017 09:08:01 -0400 "Zi Yan" <zi.yan@cs.rutgers.edu> wrote:
> >
> > I found two possible fixes.
> > 
> > 1. This uses C++ zero initializer, GCC is OK with it.
> > I tested with GCC 4.9.3 (has the initialization bug) and GCC 6.4.0.
> > 
> > --- a/include/linux/swapops.h~a
> > +++ a/include/linux/swapops.h
> > @@ -217,7 +217,7 @@ static inline swp_entry_t pmd_to_swp_ent
> > 
> >  static inline pmd_t swp_entry_to_pmd(swp_entry_t entry)
> >  {
> > -	return (pmd_t){ 0 };
> > +	return (pmd_t){};
> >  }  
> 
> I have done that for today ... please decide which is best (or find
> something better - maybe every platform really needs to have a __pmd()
> definition) and submit a real fix patch to Andrew.

OK, that failed for my compiler (gcc 5.2.0) like this:

In file included from mm/vmscan.c:55:0:
include/linux/swapops.h: In function 'swp_entry_to_pmd':
include/linux/swapops.h:226:16: error: empty scalar initializer
  return (pmd_t){};
                ^
include/linux/swapops.h:226:16: note: (near initialization for '(anonymous)')

So I used the other idea (on top of Andrew's current tree):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 2 Aug 2017 15:55:02 +1000
Subject: [PATCH] mm-thp-enable-thp-migration-in-generic-path-fix-fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/swapops.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 45b092aa6419..61cffa148a79 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -223,7 +223,9 @@ static inline swp_entry_t pmd_to_swp_entry(pmd_t pmd)
 
 static inline pmd_t swp_entry_to_pmd(swp_entry_t entry)
 {
-	return __pmd(0);
+	pmd_t e;
+	memset(&e, 0, sizeof(pmd_t));
+	return e;
 }
 
 static inline int is_pmd_migration_entry(pmd_t pmd)
-- 
2.13.2

-- 
Cheers,
Stephen Rothwell
