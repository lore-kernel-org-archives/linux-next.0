From: Dave Hansen <dave@sr71.net>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 05 Feb 2015 10:35:33 -0800
Message-ID: <54D3B7F5.9070209@sr71.net>
References: <20150205001019.GA12362@linux.vnet.ibm.com> <CA+icZUUPKNR1ua49NLVGv0i_gu9ZkVrReP_dgAWm8RPVY8Nr+w@mail.gmail.com> <20150205005716.GS5370@linux.vnet.ibm.com> <CA+icZUWvBDC0FHX-OXLpjnSBbZceam_9KRBq4tcOM1jpJk0emQ@mail.gmail.com> <20150205015144.GT5370@linux.vnet.ibm.com> <CA+icZUUHBh-voBUfYEwajL7upnj3SJC47zJN-WnRW_7tnEnQsA@mail.gmail.com> <54D3186F.7030500@sr71.net> <20150205130343.6ac0eda9@gandalf.local.home> <20150205130802.289a8be0@gandalf.local.home> <54D3B253.3050000@sr71.net> <20150205183412.GI5370@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.sr71.net ([198.145.64.142]:36290 "EHLO blackbird.sr71.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751994AbbBESfk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2015 13:35:40 -0500
In-Reply-To: <20150205183412.GI5370@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Steven Rostedt <rostedt@goodmis.org>, sedat.dilek@gmail.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>

On 02/05/2015 10:34 AM, Paul E. McKenney wrote:
>> >                               Did I actually need to be
>> > onlining/offlining CPUs to hit the splat that Sedat was reporting?
> Yep, you do need to offline at least one CPU to hit that splat.

Heh, do we need a debugging mode that will randomly offline/online CPUs? :)
