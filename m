From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20160524 build: 1 failures 11 warnings (next-20160524)
Date: Tue, 24 May 2016 12:30:22 +0200
Message-ID: <6281343.ivWLfVfayh@wuerfel>
References: <E1b58ra-0008G2-4W@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:50247 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932173AbcEXKa3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 May 2016 06:30:29 -0400
In-Reply-To: <E1b58ra-0008G2-4W@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org
Cc: Build bot for Mark Brown <broonie@kernel.org>, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

On Tuesday, May 24, 2016 10:42:59 AM CEST Build bot for Mark Brown wrote:
> ../include/linux/page_idle.h:52:3: error: expected ')' before 'return'
> ../include/linux/page_idle.h:55:1: error: expected expression before '}' token
> ../include/linux/page_idle.h:62:3: error: expected ')' before 'return'
> ../include/linux/page_idle.h:65:1: error: expected expression before '}' token
> ../include/linux/page_idle.h:72:3: error: expected ')' before 'return'
> ../include/linux/page_idle.h:75:1: error: expected expression before '}' token
> ../include/linux/page_idle.h:82:3: error: expected ')' before 'return'
> ../include/linux/page_idle.h:85:1: error: expected expression before '}' token
> ../include/linux/page_idle.h:92:3: error: expected ')' before 'return'
> ../include/linux/page_idle.h:95:1: error: expected expression before '}' token
> ../include/linux/page_idle.h:102:3: error: expected ')' before 'return'
> ../include/linux/page_idle.h:105:1: error: expected expression before '}' token
> 

I sent this patch:


commit 0f8bc0e852f6b73bc7cf4c88f6320d7ee3a8fdd6
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue May 24 12:02:49 2016 +0200

    [SUBMITTED 20160524] mm: fix build problems from lookup_page_ext
    
    A patch for lookup_page_ext introduced several build errors and
    warnings, e.g.
    
    mm/page_owner.c: In function '__set_page_owner':
    mm/page_owner.c:71:2: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    include/linux/page_idle.h: In function 'set_page_young':
    include/linux/page_idle.h:62:3: error: expected ')' before 'return'
    
    This fixes all of them. Please fold into the original patch.
    
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Fixes: 38c4fffbad3c ("mm: check the return value of lookup_page_ext for all call sites")

diff --git a/include/linux/page_idle.h b/include/linux/page_idle.h
index 569c3a180625..fec40271339f 100644
--- a/include/linux/page_idle.h
+++ b/include/linux/page_idle.h
@@ -48,7 +48,7 @@ static inline bool page_is_young(struct page *page)
 {
 	struct page_ext *page_ext = lookup_page_ext(page);
 
-	if (unlikely(!page_ext)
+	if (unlikely(!page_ext))
 		return false;
 
 	return test_bit(PAGE_EXT_YOUNG, &page_ext->flags);
@@ -58,7 +58,7 @@ static inline void set_page_young(struct page *page)
 {
 	struct page_ext *page_ext = lookup_page_ext(page);
 
-	if (unlikely(!page_ext)
+	if (unlikely(!page_ext))
 		return;
 
 	set_bit(PAGE_EXT_YOUNG, &page_ext->flags);
@@ -68,7 +68,7 @@ static inline bool test_and_clear_page_young(struct page *page)
 {
 	struct page_ext *page_ext = lookup_page_ext(page);
 
-	if (unlikely(!page_ext)
+	if (unlikely(!page_ext))
 		return false;
 
 	return test_and_clear_bit(PAGE_EXT_YOUNG, &page_ext->flags);
@@ -78,7 +78,7 @@ static inline bool page_is_idle(struct page *page)
 {
 	struct page_ext *page_ext = lookup_page_ext(page);
 
-	if (unlikely(!page_ext)
+	if (unlikely(!page_ext))
 		return false;
 
 	return test_bit(PAGE_EXT_IDLE, &page_ext->flags);
@@ -88,7 +88,7 @@ static inline void set_page_idle(struct page *page)
 {
 	struct page_ext *page_ext = lookup_page_ext(page);
 
-	if (unlikely(!page_ext)
+	if (unlikely(!page_ext))
 		return;
 
 	set_bit(PAGE_EXT_IDLE, &page_ext->flags);
@@ -98,7 +98,7 @@ static inline void clear_page_idle(struct page *page)
 {
 	struct page_ext *page_ext = lookup_page_ext(page);
 
-	if (unlikely(!page_ext)
+	if (unlikely(!page_ext))
 		return;
 
 	clear_bit(PAGE_EXT_IDLE, &page_ext->flags);
diff --git a/mm/page_owner.c b/mm/page_owner.c
index 902e39813295..c6cda3e36212 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -65,9 +65,6 @@ void __set_page_owner(struct page *page, unsigned int order, gfp_t gfp_mask)
 {
 	struct page_ext *page_ext = lookup_page_ext(page);
 
-	if (unlikely(!page_ext))
-		return;
-
 	struct stack_trace trace = {
 		.nr_entries = 0,
 		.max_entries = ARRAY_SIZE(page_ext->trace_entries),
@@ -75,6 +72,9 @@ void __set_page_owner(struct page *page, unsigned int order, gfp_t gfp_mask)
 		.skip = 3,
 	};
 
+	if (unlikely(!page_ext))
+		return;
+
 	save_stack_trace(&trace);
 
 	page_ext->order = order;
@@ -111,12 +111,11 @@ void __copy_page_owner(struct page *oldpage, struct page *newpage)
 {
 	struct page_ext *old_ext = lookup_page_ext(oldpage);
 	struct page_ext *new_ext = lookup_page_ext(newpage);
+	int i;
 
 	if (unlikely(!old_ext || !new_ext))
 		return;
 
-	int i;
-
 	new_ext->order = old_ext->order;
 	new_ext->gfp_mask = old_ext->gfp_mask;
 	new_ext->nr_entries = old_ext->nr_entries;
@@ -204,11 +203,6 @@ err:
 void __dump_page_owner(struct page *page)
 {
 	struct page_ext *page_ext = lookup_page_ext(page);
-	if (unlikely(!page_ext)) {
-		pr_alert("There is not page extension available.\n");
-		return;
-	}
-
 	struct stack_trace trace = {
 		.nr_entries = page_ext->nr_entries,
 		.entries = &page_ext->trace_entries[0],
@@ -216,6 +210,11 @@ void __dump_page_owner(struct page *page)
 	gfp_t gfp_mask = page_ext->gfp_mask;
 	int mt = gfpflags_to_migratetype(gfp_mask);
 
+	if (unlikely(!page_ext)) {
+		pr_alert("There is not page extension available.\n");
+		return;
+	}
+
 	if (!test_bit(PAGE_EXT_OWNER, &page_ext->flags)) {
 		pr_alert("page_owner info is not active (free page?)\n");
 		return;
