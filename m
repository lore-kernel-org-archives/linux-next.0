From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] kmemtrace: fix printk format warnings
Date: Fri, 23 Jan 2009 13:03:37 -0800
Message-ID: <497A30A9.60200@oracle.com>
References: <20090123184826.f2c91472.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756978AbZAWVEW@vger.kernel.org>
In-Reply-To: <20090123184826.f2c91472.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix kmemtrace printk warnings:

kernel/trace/kmemtrace.c:142: warning: format '%4ld' expects type 'long int', but argument 3 has type 'size_t'
kernel/trace/kmemtrace.c:147: warning: format '%4ld' expects type 'long int', but argument 3 has type 'size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc:      Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>
---
 kernel/trace/kmemtrace.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20090123.orig/kernel/trace/kmemtrace.c
+++ linux-next-20090123/kernel/trace/kmemtrace.c
@@ -139,12 +139,12 @@ kmemtrace_print_alloc_compress(struct tr
 		return TRACE_TYPE_PARTIAL_LINE;
 
 	/* Requested */
-	ret = trace_seq_printf(s, "%4ld   ", entry->bytes_req);
+	ret = trace_seq_printf(s, "%4zd   ", entry->bytes_req);
 	if (!ret)
 		return TRACE_TYPE_PARTIAL_LINE;
 
 	/* Allocated */
-	ret = trace_seq_printf(s, "%4ld   ", entry->bytes_alloc);
+	ret = trace_seq_printf(s, "%4zd   ", entry->bytes_alloc);
 	if (!ret)
 		return TRACE_TYPE_PARTIAL_LINE;
 
