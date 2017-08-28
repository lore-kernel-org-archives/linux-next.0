From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 28 Aug 2017 18:18:49 +1000
Message-ID: <20170828181849.323ab81b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

kernel/fork.c: In function 'mm_init':
kernel/fork.c:821:2: error: implicit declaration of function 'hmm_mm_init' [-Werror=implicit-function-declaration]
  hmm_mm_init(mm);
  ^
kernel/fork.c: In function '__mmdrop':
kernel/fork.c:900:2: error: implicit declaration of function 'hmm_mm_destroy' [-Werror=implicit-function-declaration]
  hmm_mm_destroy(mm);
  ^

Caused by commit

  af097d7ae64e ("mm/hmm: struct hmm is only use by HMM mirror functionality v2")

I added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 28 Aug 2017 18:14:09 +1000
Subject: [PATCH] mm/hmm: struct hmm is only use by HMM mirror functionality v2 fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/hmm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 9583d9a15f9c..0758072f6585 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -514,5 +514,8 @@ static inline void hmm_mm_init(struct mm_struct *mm) {}
 #endif /* IS_ENABLED(CONFIG_HMM_MIRROR) */
 
 
+#else /* IS_ENABLED(CONFIG_HMM) */
+static inline void hmm_mm_destroy(struct mm_struct *mm) {}
+static inline void hmm_mm_init(struct mm_struct *mm) {}
 #endif /* IS_ENABLED(CONFIG_HMM) */
 #endif /* LINUX_HMM_H */
-- 
2.13.2

-- 
Cheers,
Stephen Rothwell
