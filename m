From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 0/2] tracing/tlb/x85: Fix splat of calling RCU trace
 code on offline CPU
Date: Fri, 6 Feb 2015 16:28:03 -0500
Message-ID: <20150206162803.74a006f7@gandalf.local.home>
References: <20150206200653.009919583@goodmis.org>
	<CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
	<20150206161803.30cdd90e@gandalf.local.home>
	<CA+icZUVszLV6F6tq+yrtPycp2h5PpyG==wN1cbQsK72ePiRLBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+icZUVszLV6F6tq+yrtPycp2h5PpyG==wN1cbQsK72ePiRLBQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Fri, 6 Feb 2015 22:21:58 +0100
Sedat Dilek <sedat.dilek@gmail.com> wrote:

> Important for me is that the reference is embedded.

Actually the first patch fixes another bug, which was added to find
bugs for tlb tracepoints.

-- Steve
