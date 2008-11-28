From: =?utf-8?q?T=C3=B6r=C3=B6k=20Edwin?= <edwintorok@gmail.com>
Subject: [PATCH] fix build: add missing #ifdef CONFIG_STACKTRACE
Date: Fri, 28 Nov 2008 11:17:56 +0200
Message-ID: <1227863876-22747-1-git-send-email-edwintorok@gmail.com>
References: <c62985530811280114s50abe288q255a185b6d64c81b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:20626 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752762AbYK1JSC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Nov 2008 04:18:02 -0500
Received: by ey-out-2122.google.com with SMTP id 6so568050eyi.37
        for <linux-next@vger.kernel.org>; Fri, 28 Nov 2008 01:18:00 -0800 (PST)
In-Reply-To: <c62985530811280114s50abe288q255a185b6d64c81b@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: adobriyan@gmail.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, mingo@elte.hu, linux-kernel@vger.kernel.org, =?utf-8?q?T=C3=B6r=C3=B6k=20Edwin?= <edwintorok@gmail.com>


Signed-off-by: T=C3=B6r=C3=B6k Edwin <edwintorok@gmail.com>
---
 kernel/trace/trace.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 5811e0a..91887a2 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -983,6 +983,7 @@ static void ftrace_trace_userstack(struct trace_arr=
ay *tr,
 		   struct trace_array_cpu *data,
 		   unsigned long flags, int pc)
 {
+#ifdef CONFIG_STACKTRACE
 	struct ring_buffer_event *event;
 	struct userstack_entry *entry;
 	struct stack_trace trace;
@@ -1008,6 +1009,7 @@ static void ftrace_trace_userstack(struct trace_a=
rray *tr,
=20
 	save_stack_trace_user(&trace);
 	ring_buffer_unlock_commit(tr->buffer, event, irq_flags);
+#endif
 }
=20
 void __trace_userstack(struct trace_array *tr,
--=20
1.5.6.5
