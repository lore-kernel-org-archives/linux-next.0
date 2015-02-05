From: Dave Hansen <dave@sr71.net>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 05 Feb 2015 10:11:31 -0800
Message-ID: <54D3B253.3050000@sr71.net>
References: <20150204193535.58f132c5@canb.auug.org.au>	<1511573.AlfExlvQsO@vostro.rjw.lan>	<20150204215357.GL5370@linux.vnet.ibm.com>	<11131483.LrRNxJumiL@vostro.rjw.lan>	<20150204235115.GP5370@linux.vnet.ibm.com>	<20150205001019.GA12362@linux.vnet.ibm.com>	<CA+icZUUPKNR1ua49NLVGv0i_gu9ZkVrReP_dgAWm8RPVY8Nr+w@mail.gmail.com>	<20150205005716.GS5370@linux.vnet.ibm.com>	<CA+icZUWvBDC0FHX-OXLpjnSBbZceam_9KRBq4tcOM1jpJk0emQ@mail.gmail.com>	<20150205015144.GT5370@linux.vnet.ibm.com>	<CA+icZUUHBh-voBUfYEwajL7upnj3SJC47zJN-WnRW_7tnEnQsA@mail.gmail.com>	<54D3186F.7030500@sr71.net>	<20150205130343.6ac0eda9@gandalf.local.home> <20150205130802.289a8be0@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150205130802.289a8be0@gandalf.local.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sedat.dilek@gmail.com, Paul McKenney <paulmck@linux.vnet.ibm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>
List-Id: linux-next.vger.kernel.org

On 02/05/2015 10:08 AM, Steven Rostedt wrote:
> --- a/include/trace/events/tlb.h
> +++ b/include/trace/events/tlb.h
> @@ -13,11 +13,13 @@
>  	{ TLB_LOCAL_SHOOTDOWN,		"local shootdown" },		\
>  	{ TLB_LOCAL_MM_SHOOTDOWN,	"local mm shootdown" }
>  
> -TRACE_EVENT(tlb_flush,
> +TRACE_EVENT_CONDITION(tlb_flush,
>  
>  	TP_PROTO(int reason, unsigned long pages),
>  	TP_ARGS(reason, pages),
>  
> +	TP_CONDITION(cpu_online(smp_processor_id())),

That's a pretty reasonable fix, although it would be nice if the
debugging was easier to hit.  Did I actually need to be
onlining/offlining CPUs to hit the splat that Sedat was reporting?
