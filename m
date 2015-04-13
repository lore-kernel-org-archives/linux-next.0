From: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: RE: linux-next: build warnings after merge of the char-misc tree
Date: Mon, 13 Apr 2015 10:44:20 +0000
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B355A29D7@hasmsx108.ger.corp.intel.com>
References: <20150413193720.56083fbf@canb.auug.org.au>
 <20150413104328.GB6390@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:11737 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753357AbbDMKoq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Apr 2015 06:44:46 -0400
In-Reply-To: <20150413104328.GB6390@kroah.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Monday, April 13, 2015 13:43
> To: Stephen Rothwell
> Cc: Arnd Bergmann; Steven Rostedt; linux-next@vger.kernel.org; linux-
> kernel@vger.kernel.org; Winkler, Tomas
> Subject: Re: linux-next: build warnings after merge of the char-misc tree
> 
> On Mon, Apr 13, 2015 at 07:37:20PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the char-misc tree, today's linux-next build (x86_64
> > allmodconfig) produced these warnings:
> >
> > In file included from include/trace/define_trace.h:90:0,
> >                  from drivers/misc/mei/mei-trace.h:76,
> >                  from drivers/misc/mei/mei-trace.c:21:
> > include/trace/ftrace.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined
> >  #define TRACE_SYSTEM_STRING
> __app(TRACE_SYSTEM_VAR,__trace_system_name)
> >  ^
> > In file included from include/trace/define_trace.h:83:0,
> >                  from drivers/misc/mei/mei-trace.h:76,
> >                  from drivers/misc/mei/mei-trace.c:21:
> > drivers/misc/mei/./mei-trace.h:29:0: note: this is the location of the previous
> definition
> >  #define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
> >  ^
> > In file included from include/trace/ftrace.h:134:0,
> >                  from include/trace/define_trace.h:90,
> >                  from drivers/misc/mei/mei-trace.h:76,
> >                  from drivers/misc/mei/mei-trace.c:21:
> > drivers/misc/mei/./mei-trace.h:29:0: warning: "TRACE_SYSTEM_STRING"
> redefined
> >  #define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
> >  ^
> > In file included from include/trace/define_trace.h:90:0,
> >                  from drivers/misc/mei/mei-trace.h:76,
> >                  from drivers/misc/mei/mei-trace.c:21:
> > include/trace/ftrace.h:28:0: note: this is the location of the previous definition
> >  #define TRACE_SYSTEM_STRING
> __app(TRACE_SYSTEM_VAR,__trace_system_name)
> >  ^
> > In file included from include/trace/define_trace.h:90:0,
> >                  from drivers/misc/mei/mei-trace.h:76,
> >                  from drivers/misc/mei/mei-trace.c:21:
> > include/trace/ftrace.h:28:0: warning: "TRACE_SYSTEM_STRING" redefined
> >  #define TRACE_SYSTEM_STRING
> __app(TRACE_SYSTEM_VAR,__trace_system_name)
> >  ^
> > In file included from include/trace/define_trace.h:83:0,
> >                  from drivers/misc/mei/mei-trace.h:76,
> >                  from drivers/misc/mei/mei-trace.c:21:
> > drivers/misc/mei/./mei-trace.h:29:0: note: this is the location of the previous
> definition
> >  #define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
> >  ^
> > In file included from include/trace/ftrace.h:134:0,
> >                  from include/trace/define_trace.h:90,
> >                  from drivers/misc/mei/mei-trace.h:76,
> >                  from drivers/misc/mei/mei-trace.c:21:
> > drivers/misc/mei/./mei-trace.h:29:0: warning: "TRACE_SYSTEM_STRING"
> redefined
> >  #define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
> >  ^
> > In file included from include/trace/define_trace.h:90:0,
> >                  from drivers/misc/mei/mei-trace.h:76,
> >                  from drivers/misc/mei/mei-trace.c:21:
> > include/trace/ftrace.h:28:0: note: this is the location of the previous definition
> >  #define TRACE_SYSTEM_STRING
> __app(TRACE_SYSTEM_VAR,__trace_system_name)
> >  ^
> >
> > Introduced by commit a0a927d06d79 ("mei: me: add io register tracing")
> > interacting with commit acd388fd3af3 ("tracing: Give system name a
> > pointer") from the ftrace tree.
> >
> > TRACE_SYSTEM_STRING should be removed from drivers/misc/mei/mei-
> trace.h
> > as it is not being used anywhere in the mei-trace code.
> 
> That's nice for such system-wide changes to be done at the last possible
> minute in the development cycle :(
> 
> Anyway, someone from the trace subsystem wish to send me a patch for
> this?
> 
> thanks,
Will send in few
Tomas
