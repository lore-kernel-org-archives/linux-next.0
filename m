From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 5 (kernel/events/core.c)
Date: Mon, 5 Sep 2016 09:39:49 -0700
Message-ID: <e568fff8-c23f-877e-5a74-ab4b355126e0@infradead.org>
References: <20160905192502.24dd8d80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:60010 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754197AbcIEQj5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Sep 2016 12:39:57 -0400
In-Reply-To: <20160905192502.24dd8d80@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, acme@kernel.org

On 09/05/16 02:25, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160825:
> 


on i386 or x86_64:
when CONFIG_EVENT_TRACING is not enabled:

../kernel/events/core.c: In function 'perf_event_alloc':
../kernel/events/core.c:9106:27: error: 'bpf_overflow_handler' undeclared (first use in this function)
   if (overflow_handler == bpf_overflow_handler) {
                           ^


-- 
~Randy
