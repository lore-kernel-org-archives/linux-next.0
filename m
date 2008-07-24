From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: kernel/trace/ftrace.c new warning in next-20080723
Date: Thu, 24 Jul 2008 10:52:11 +1000
Message-ID: <200807241052.12177.rusty@rustcorp.com.au>
References: <1216852786.30386.30.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:46478 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751345AbYGXDpD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Jul 2008 23:45:03 -0400
In-Reply-To: <1216852786.30386.30.camel@brick>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thursday 24 July 2008 08:39:45 Harvey Harrison wrote:
> > kernel/trace/ftrace.c: In function =E2=80=98ftrace_run_update_code=E2=
=80=99:
> > kernel/trace/ftrace.c:590: warning: =E2=80=98stop_machine_run=E2=80=
=99 is deprecated
> > (declared at include/linux/stop_machine.h:59) kernel/trace/ftrace.c=
: In
> > function =E2=80=98ftrace_update_code=E2=80=99:
> > kernel/trace/ftrace.c:790: warning: =E2=80=98stop_machine_run=E2=80=
=99 is deprecated
> > (declared at include/linux/stop_machine.h:59) kernel/trace/ftrace.c=
: In
> > function =E2=80=98ftrace_dynamic_init=E2=80=99:
> > kernel/trace/ftrace.c:1567: warning: =E2=80=98stop_machine_run=E2=80=
=99 is deprecated
> > (declared at include/linux/stop_machine.h:59)
>
> FYI,
>
> Harvey

Yep, this is known, expected and harmless.  I'm waiting for Linus to pu=
ll my=20
lguest and virtio patches before I send the stop_machine changes.

Cheers,
Rusty.
