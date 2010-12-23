From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kconfig: fix warning
Date: Thu, 23 Dec 2010 03:25:16 -0500
Message-ID: <1293092716-15765-1-git-send-email-lacombar@gmail.com>
References: <20101223110048.09ff9f40.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:41974 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752004Ab0LWIZY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Dec 2010 03:25:24 -0500
Received: by yxt3 with SMTP id 3so2534777yxt.19
        for <linux-next@vger.kernel.org>; Thu, 23 Dec 2010 00:25:24 -0800 (PST)
In-Reply-To: <20101223110048.09ff9f40.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, linux-next@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>

Hi,

This should do it, sorry for that, I believe the original patch was not fully
ready for integration.

 - Arnaud

---

From: Arnaud Lacombe <lacombar@gmail.com>

In file included from scripts/kconfig/zconf.tab.c:2502:
scripts/kconfig/expr.c:1033: warning: no previous prototype for 'expr_simplify_unmet_dep'

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/expr.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 218991b..79ab6e7 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -206,6 +206,7 @@ struct expr *expr_extract_eq_and(struct expr **ep1, struct expr **ep2);
 struct expr *expr_extract_eq_or(struct expr **ep1, struct expr **ep2);
 void expr_extract_eq(enum expr_type type, struct expr **ep, struct expr **ep1, struct expr **ep2);
 struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symbol *sym);
+struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2);
 
 void expr_fprint(struct expr *e, FILE *out);
 struct gstr; /* forward */
-- 
1.7.3.3
