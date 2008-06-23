From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: linux-next: Tree for June 23
Date: Mon, 23 Jun 2008 12:26:55 +0200
Message-ID: <19f34abd0806230326i592ba39eu837d290e21431d14@mail.gmail.com>
References: <20080623182549.b0552851.sfr@canb.auug.org.au>
	 <19f34abd0806230323o6373015fj93a85b929545a7a8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.234]:29011 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753622AbYFWK04 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Jun 2008 06:26:56 -0400
Received: by rv-out-0506.google.com with SMTP id k40so6994620rvb.1
        for <linux-next@vger.kernel.org>; Mon, 23 Jun 2008 03:26:55 -0700 (PDT)
In-Reply-To: <19f34abd0806230323o6373015fj93a85b929545a7a8@mail.gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Rostedt <srostedt@redhat.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Jun 23, 2008 at 12:23 PM, Vegard Nossum <vegard.nossum@gmail.com> wrote:
> Testing tracer sched_switch: PASSED
> Testing tracer sysprof: PASSED
> Testing tracer ftrace: PASSED
> Testing dynamic ftrace: PASSED
> Testing tracer irqsoff: PASSED
> Testing tracer preemptoff: PASSED
> Testing tracer preemptirqsoff: <4>------------[ cut here ]------------
> WARNING: at kernel/lockdep.c:2680 check_flags+0x142/0x160()
> Pid: 2, comm: kthreadd Not tainted 2.6.26-rc6-next-20080620 #34

<-- Oops, wrong version :-(

Will try the latest one as well.


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
