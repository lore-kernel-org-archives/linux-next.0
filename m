From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: kernel/trace/ftrace.c new warning in next-20080723
Date: Wed, 23 Jul 2008 15:39:45 -0700
Message-ID: <1216852786.30386.30.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.28]:45354 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752768AbYGWWjp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Jul 2008 18:39:45 -0400
Received: by yw-out-2324.google.com with SMTP id 9so1165733ywe.1
        for <linux-next@vger.kernel.org>; Wed, 23 Jul 2008 15:39:45 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: "rusty@rustcorp.com.au" <rusty@rustcorp.com.au>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

> kernel/trace/ftrace.c: In function =E2=80=98ftrace_run_update_code=E2=
=80=99:
> kernel/trace/ftrace.c:590: warning: =E2=80=98stop_machine_run=E2=80=99=
 is deprecated (declared at include/linux/stop_machine.h:59)
> kernel/trace/ftrace.c: In function =E2=80=98ftrace_update_code=E2=80=99=
:
> kernel/trace/ftrace.c:790: warning: =E2=80=98stop_machine_run=E2=80=99=
 is deprecated (declared at include/linux/stop_machine.h:59)
> kernel/trace/ftrace.c: In function =E2=80=98ftrace_dynamic_init=E2=80=
=99:
> kernel/trace/ftrace.c:1567: warning: =E2=80=98stop_machine_run=E2=80=99=
 is deprecated (declared at include/linux/stop_machine.h:59)

=46YI,

Harvey
