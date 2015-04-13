From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] mei: trace: Remove unused TRACE_SYSTEM_STRING define
Date: Mon, 13 Apr 2015 18:56:19 +0200
Message-ID: <20150413165619.GB32634@kroah.com>
References: <20150413193720.56083fbf@canb.auug.org.au>
 <20150413104328.GB6390@kroah.com>
 <20150413120727.3bb82df0@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150413120727.3bb82df0@gandalf.local.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 13, 2015 at 12:07:27PM -0400, Steven Rostedt wrote:
> TRACE_SYSTEM_STRING is defined in mei-trace.h but is unused. Worse yet,
> the ftrace tracing infrastructure is using it now and this causes
> warnings about redefined macros.
> 
> Remove the define of TRACE_SYSTEM_STRING from mei-trace.h
> 
> Link: http://lkml.kernel.org/r/20150413193720.56083fbf@canb.auug.org.au
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> ---
> diff --git a/drivers/misc/mei/mei-trace.h b/drivers/misc/mei/mei-trace.h
> index 5f4e1a17360b..c9e24d2b698a 100644
> --- a/drivers/misc/mei/mei-trace.h
> +++ b/drivers/misc/mei/mei-trace.h
> @@ -26,7 +26,6 @@
>  #undef TRACE_SYSTEM
>  
>  #define TRACE_SYSTEM mei
> -#define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
>  
>  TRACE_EVENT(mei_reg_read,
>  	TP_PROTO(const struct device *dev, const char *reg, u32 offs, u32 val),

This is already in my tree, and will show up in the next linux-next :)

thanks,

greg k-h
