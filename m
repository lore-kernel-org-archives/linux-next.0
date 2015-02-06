From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 0/2] tracing/tlb/x85: Fix splat of calling RCU trace
 code on offline CPU
Date: Fri, 6 Feb 2015 17:35:48 -0500
Message-ID: <20150206173548.48f53ed7@gandalf.local.home>
References: <20150206200653.009919583@goodmis.org>
	<CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
	<20150206213856.GN5418@linux.vnet.ibm.com>
	<CA+icZUWBJ5-0pyreVdTduaOPg8StccZhcu6=vdD_Zny8CCMZDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0118.hostedemail.com ([216.40.44.118]:36295 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751334AbbBFWfw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 17:35:52 -0500
In-Reply-To: <CA+icZUWBJ5-0pyreVdTduaOPg8StccZhcu6=vdD_Zny8CCMZDw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Fri, 6 Feb 2015 23:13:02 +0100
Sedat Dilek <sedat.dilek@gmail.com> wrote:


> OK, so both patches go through Steve's tree.

The second patch will require acks from those that maintain the files I
touch.

-- Steve
