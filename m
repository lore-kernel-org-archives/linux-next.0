From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/2] tracing: Add condition check to RCU lockdep checks
Date: Fri, 6 Feb 2015 15:11:14 -0500
Message-ID: <20150206151114.609fda87@gandalf.local.home>
References: <20150206200653.009919583@goodmis.org>
	<20150206200800.552335453@goodmis.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150206200800.552335453@goodmis.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Sedat Dilek <sedat.dilek@gmail.com>
List-Id: linux-next.vger.kernel.org


> diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
> index e08e21e5f601..68a346b8328a 100644
> --- a/include/linux/tracepoint.h
> +++ b/include/linux/tracepoint.h
> @@ -173,7 +173,7 @@ extern void syscall_unregfunc(void);
>  				TP_PROTO(data_proto),			\
>  				TP_ARGS(data_args),			\
>  				TP_CONDITION(cond),,);			\
> -		if (IS_ENABLED(CONFIG_LOCKDEP)) {			\
> +		if (IS_ENABLED(CONFIG_LOCKDEP) && cond) {			\

Bah,

cond needs to be in parenthesis. Will post a v2 of this patch.

-- Steve

>  			rcu_read_lock_sched_notrace();			\
>  			rcu_dereference_sched(__tracepoint_##name.funcs);\
>  			rcu_read_unlock_sched_notrace();		\
