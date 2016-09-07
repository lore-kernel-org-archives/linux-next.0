From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Sep 7 (kernel/trace/trace_hwlat.c)
Date: Thu, 8 Sep 2016 07:42:01 +1000
Message-ID: <20160908074201.1ae6c9cc@canb.auug.org.au>
References: <20160907175258.1f17a8ba@canb.auug.org.au>
        <d6c3b7eb-ba95-1ffa-0453-464e1e24262a@infradead.org>
        <20160907124422.70216727@gandalf.local.home>
        <2c4a12e1-7970-f272-8883-db7c6ae36825@infradead.org>
        <20160907144838.22484ad3@gandalf.local.home>
        <20160907153810.54f2a9ef@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40897 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750878AbcIGVmE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Sep 2016 17:42:04 -0400
In-Reply-To: <20160907153810.54f2a9ef@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Steven,

On Wed, 7 Sep 2016 15:38:10 -0400 Steven Rostedt <rostedt@goodmis.org> wrote:
>
> commit 64cfdb9788bf3fb2bf6c30701fc3644f25e76df2
> Author: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
> Date:   Wed Sep 7 12:45:09 2016 -0400
> 
>     tracing: Have max_latency be defined for HWLAT_TRACER as well
>     
>     The hwlat tracer uses tr->max_latency, and if it's the only tracer enabled
>     that uses it, the build will fail. Add max_latency and its file when the
>     hwlat tracer is enabled.
>     
>     Link: http://lkml.kernel.org/r/20160907175258.1f17a8ba@canb.auug.org.au

That is not the reporting email ... Randy's was a reply to that one
with message id "<d6c3b7eb-ba95-1ffa-0453-464e1e24262a@infradead.org>".

-- 
Cheers,
Stephen Rothwell
