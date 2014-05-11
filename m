From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Subject: [PATCH linux-next] perf: remove unused variable
Date: Sun, 11 May 2014 23:43:49 +0200
Message-ID: <1399844629-32173-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp6-g21.free.fr ([212.27.42.6]:54985 "EHLO smtp6-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751663AbaEKVnz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 11 May 2014 17:43:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>

This fixes the following compilation warning:

  kernel/events/core.c: In function =E2=80=98perf_event_exit_task_conte=
xt=E2=80=99:
  kernel/events/core.c:7434:35: warning: unused variable =E2=80=98tmp=E2=
=80=99 [-Wunused-variable]

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
---

Hi,

This can be seen with e.g. linux next-20140509 and arm allmodconfig.

Best regards,

V.

 kernel/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 7ab734f..ed50b09 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7431,7 +7431,7 @@ __perf_event_exit_task(struct perf_event *child_e=
vent,
=20
 static void perf_event_exit_task_context(struct task_struct *child, in=
t ctxn)
 {
-	struct perf_event *child_event, *tmp;
+	struct perf_event *child_event;
 	struct perf_event_context *child_ctx;
 	unsigned long flags;
=20
--=20
2.0.0.rc0
