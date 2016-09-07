From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Tree for Sep 7 (kernel/trace/trace_hwlat.c)
Date: Wed, 7 Sep 2016 14:48:38 -0400
Message-ID: <20160907144838.22484ad3@gandalf.local.home>
References: <20160907175258.1f17a8ba@canb.auug.org.au>
        <d6c3b7eb-ba95-1ffa-0453-464e1e24262a@infradead.org>
        <20160907124422.70216727@gandalf.local.home>
        <2c4a12e1-7970-f272-8883-db7c6ae36825@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0075.hostedemail.com ([216.40.44.75]:47490 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752479AbcIGSsm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Sep 2016 14:48:42 -0400
In-Reply-To: <2c4a12e1-7970-f272-8883-db7c6ae36825@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 7 Sep 2016 11:34:24 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

 
> Hm, now I get:
> 
> ../kernel/trace/trace.c: In function 'tracing_set_tracer':
> ../kernel/trace/trace.c:4850:3: error: implicit declaration of function 'free_snapshot' [-Werror=implicit-function-declaration]
>    free_snapshot(tr);
>    ^
> ../kernel/trace/trace.c:4856:3: error: implicit declaration of function 'alloc_snapshot' [-Werror=implicit-function-declaration]
>    ret = alloc_snapshot(tr);

Grumble.

OK, thanks for testing. The hwlat tracer actually only uses part of the
max trace infrastructure. I need to make a less trivial patch for this
fix.

Will send another one soon.

-- Steve
