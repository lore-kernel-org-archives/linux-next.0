From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warnings after merge of the char-misc tree
Date: Mon, 13 Apr 2015 15:34:13 +0200
Message-ID: <20150413133413.GB30086@kroah.com>
References: <20150413193720.56083fbf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45642 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753063AbbDMNeO (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 09:34:14 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id C1D5A2079C
	for <linux-next@vger.kernel.org>; Mon, 13 Apr 2015 09:34:13 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20150413193720.56083fbf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>

On Mon, Apr 13, 2015 at 07:37:20PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the char-misc tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
> 
> In file included from include/trace/define_trace.h:90:0,
>                  from drivers/misc/mei/mei-trace.h:76,
>                  from drivers/misc/mei/mei-trace.c:21:
> include/trace/ftrace.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined
>  #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
>  ^
> In file included from include/trace/define_trace.h:83:0,
>                  from drivers/misc/mei/mei-trace.h:76,
>                  from drivers/misc/mei/mei-trace.c:21:
> drivers/misc/mei/./mei-trace.h:29:0: note: this is the location of the previous definition
>  #define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
>  ^
> In file included from include/trace/ftrace.h:134:0,
>                  from include/trace/define_trace.h:90,
>                  from drivers/misc/mei/mei-trace.h:76,
>                  from drivers/misc/mei/mei-trace.c:21:
> drivers/misc/mei/./mei-trace.h:29:0: warning: "TRACE_SYSTEM_STRING" redefined
>  #define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
>  ^
> In file included from include/trace/define_trace.h:90:0,
>                  from drivers/misc/mei/mei-trace.h:76,
>                  from drivers/misc/mei/mei-trace.c:21:
> include/trace/ftrace.h:28:0: note: this is the location of the previous definition
>  #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
>  ^
> In file included from include/trace/define_trace.h:90:0,
>                  from drivers/misc/mei/mei-trace.h:76,
>                  from drivers/misc/mei/mei-trace.c:21:
> include/trace/ftrace.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined
>  #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
>  ^
> In file included from include/trace/define_trace.h:83:0,
>                  from drivers/misc/mei/mei-trace.h:76,
>                  from drivers/misc/mei/mei-trace.c:21:
> drivers/misc/mei/./mei-trace.h:29:0: note: this is the location of the previous definition
>  #define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
>  ^
> In file included from include/trace/ftrace.h:134:0,
>                  from include/trace/define_trace.h:90,
>                  from drivers/misc/mei/mei-trace.h:76,
>                  from drivers/misc/mei/mei-trace.c:21:
> drivers/misc/mei/./mei-trace.h:29:0: warning: "TRACE_SYSTEM_STRING" redefined
>  #define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
>  ^
> In file included from include/trace/define_trace.h:90:0,
>                  from drivers/misc/mei/mei-trace.h:76,
>                  from drivers/misc/mei/mei-trace.c:21:
> include/trace/ftrace.h:28:0: note: this is the location of the previous definition
>  #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
>  ^
> 
> Introduced by commit a0a927d06d79 ("mei: me: add io register tracing")
> interacting with commit acd388fd3af3 ("tracing: Give system name a
> pointer") from the ftrace tree.
> 
> TRACE_SYSTEM_STRING should be removed from drivers/misc/mei/mei-trace.h
> as it is not being used anywhere in the mei-trace code.

Now removed, thanks.

greg k-h
