From: Michal Hocko <mhocko@kernel.org>
Subject: Re: mmotm 2017-08-25-15-50 uploaded
Date: Mon, 28 Aug 2017 09:59:31 +0200
Message-ID: <20170828075931.GC17097@dhcp22.suse.cz>
References: <59a0a9d1.jzOblYrHfdIDuDZw%akpm@linux-foundation.org>
 <3c9df006-0cc5-3a32-b715-1fbb43cb9ea8@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <3c9df006-0cc5-3a32-b715-1fbb43cb9ea8@infradead.org>
Sender: owner-linux-mm@kvack.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, broonie@kernel.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>
List-Id: linux-next.vger.kernel.org

On Fri 25-08-17 16:50:26, Randy Dunlap wrote:
> On 08/25/17 15:50, akpm@linux-foundation.org wrote:
> > The mm-of-the-moment snapshot 2017-08-25-15-50 has been uploaded to
> > 
> >    http://www.ozlabs.org/~akpm/mmotm/
> > 
> > mmotm-readme.txt says
> > 
> > README for mm-of-the-moment:
> > 
> > http://www.ozlabs.org/~akpm/mmotm/
> > 
> > This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> > more than once a week.
> 
> lots of this one (on x86_64, i386, or UML):
> 
> ../kernel/fork.c:818:2: error: implicit declaration of function 'hmm_mm_init' [-Werror=implicit-function-declaration]
> ../kernel/fork.c:897:2: error: implicit declaration of function 'hmm_mm_destroy' [-Werror=implicit-function-declaration]
> 
> from mm-hmm-heterogeneous-memory-management-hmm-for-short-v5.patch
> 
> Cc: Jérôme Glisse <jglisse@redhat.com>

This one should address it
---
>From 31d551dbcb1b7987a4cd07767c1e2805849b7a26 Mon Sep 17 00:00:00 2001
From: Michal Hocko <mhocko@suse.com>
Date: Mon, 28 Aug 2017 09:41:39 +0200
Subject: [PATCH] 
 mm-hmm-struct-hmm-is-only-use-by-hmm-mirror-functionality-v2-fix

Compiler is complaining for allnoconfig

kernel/fork.c: In function 'mm_init':
kernel/fork.c:814:2: error: implicit declaration of function 'hmm_mm_init' [-Werror=implicit-function-declaration]
  hmm_mm_init(mm);
  ^
kernel/fork.c: In function '__mmdrop':
kernel/fork.c:893:2: error: implicit declaration of function 'hmm_mm_destroy' [-Werror=implicit-function-declaration]
  hmm_mm_destroy(mm);

Make sure that hmm_mm_init/hmm_mm_destroy empty stups are defined when
CONFIG_HMM is disabled.

Signed-off-by: Michal Hocko <mhocko@suse.com>
---
 include/linux/hmm.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 9583d9a15f9c..aeb94e682dda 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -508,11 +508,10 @@ static inline void hmm_mm_init(struct mm_struct *mm)
 {
 	mm->hmm = NULL;
 }
-#else /* IS_ENABLED(CONFIG_HMM_MIRROR) */
+#endif
+
+#else /* IS_ENABLED(CONFIG_HMM) */
 static inline void hmm_mm_destroy(struct mm_struct *mm) {}
 static inline void hmm_mm_init(struct mm_struct *mm) {}
-#endif /* IS_ENABLED(CONFIG_HMM_MIRROR) */
-
-
 #endif /* IS_ENABLED(CONFIG_HMM) */
 #endif /* LINUX_HMM_H */
-- 
2.13.2

-- 
Michal Hocko
SUSE Labs

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
