From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 13:08:02 -0500
Message-ID: <20150205130802.289a8be0@gandalf.local.home>
References: <20150204193535.58f132c5@canb.auug.org.au>
	<1511573.AlfExlvQsO@vostro.rjw.lan>
	<20150204215357.GL5370@linux.vnet.ibm.com>
	<11131483.LrRNxJumiL@vostro.rjw.lan>
	<20150204235115.GP5370@linux.vnet.ibm.com>
	<20150205001019.GA12362@linux.vnet.ibm.com>
	<CA+icZUUPKNR1ua49NLVGv0i_gu9ZkVrReP_dgAWm8RPVY8Nr+w@mail.gmail.com>
	<20150205005716.GS5370@linux.vnet.ibm.com>
	<CA+icZUWvBDC0FHX-OXLpjnSBbZceam_9KRBq4tcOM1jpJk0emQ@mail.gmail.com>
	<20150205015144.GT5370@linux.vnet.ibm.com>
	<CA+icZUUHBh-voBUfYEwajL7upnj3SJC47zJN-WnRW_7tnEnQsA@mail.gmail.com>
	<54D3186F.7030500@sr71.net>
	<20150205130343.6ac0eda9@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0174.hostedemail.com ([216.40.44.174]:58877 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750825AbbBESIF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Feb 2015 13:08:05 -0500
In-Reply-To: <20150205130343.6ac0eda9@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Hansen <dave@sr71.net>
Cc: sedat.dilek@gmail.com, Paul McKenney <paulmck@linux.vnet.ibm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>

On Thu, 5 Feb 2015 13:03:43 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> (not tested)
> 
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> ---
> diff --git a/include/trace/events/tlb.h b/include/trace/events/tlb.h
> index 13391d288107..040c1cdfe6d1 100644
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
> +	TP_CONDITION(cpu_online(smp_processor_id()),
> +

I said it wasn't tested. I also forgot to hit save after I realized I
was missing a ')'.

-- Steve

Take two:

diff --git a/include/trace/events/tlb.h b/include/trace/events/tlb.h
index 13391d288107..0e7635765153 100644
--- a/include/trace/events/tlb.h
+++ b/include/trace/events/tlb.h
@@ -13,11 +13,13 @@
 	{ TLB_LOCAL_SHOOTDOWN,		"local shootdown" },		\
 	{ TLB_LOCAL_MM_SHOOTDOWN,	"local mm shootdown" }
 
-TRACE_EVENT(tlb_flush,
+TRACE_EVENT_CONDITION(tlb_flush,
 
 	TP_PROTO(int reason, unsigned long pages),
 	TP_ARGS(reason, pages),
 
+	TP_CONDITION(cpu_online(smp_processor_id())),
+
 	TP_STRUCT__entry(
 		__field(	  int, reason)
 		__field(unsigned long,  pages)
