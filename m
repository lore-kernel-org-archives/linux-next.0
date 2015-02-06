From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 0/2] tracing/tlb/x85: Fix splat of calling RCU trace
 code on offline CPU
Date: Fri, 6 Feb 2015 16:33:24 -0500
Message-ID: <20150206163324.472a97fb@gandalf.local.home>
References: <20150206200653.009919583@goodmis.org>
	<CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
	<20150206161803.30cdd90e@gandalf.local.home>
	<CA+icZUVszLV6F6tq+yrtPycp2h5PpyG==wN1cbQsK72ePiRLBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0139.hostedemail.com ([216.40.44.139]:32861 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753347AbbBFVd2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 16:33:28 -0500
In-Reply-To: <CA+icZUVszLV6F6tq+yrtPycp2h5PpyG==wN1cbQsK72ePiRLBQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Fri, 6 Feb 2015 22:21:58 +0100
Sedat Dilek <sedat.dilek@gmail.com> wrote:
 
> Important for me is that the reference is embedded.

Note, my patch will have this:

Link: http://lkml.kernel.org/r/CA+icZUUGiGDoL5NU8RuxKzFjoLjEKRtUWx=JB8B9a0EQv-eGzQ@mail.gmail.com

-- Steve
