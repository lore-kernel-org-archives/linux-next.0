From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/2] x86/tbl/trace: Do not trace on CPU that is offline
Date: Fri, 6 Feb 2015 23:02:06 -0500
Message-ID: <20150206230206.0733828d@grimm.local.home>
References: <20150206200653.009919583@goodmis.org>
	<20150206200800.689573476@goodmis.org>
	<20150206232754.GA17751@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150206232754.GA17751@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Sedat Dilek <sedat.dilek@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, 6 Feb 2015 15:27:54 -0800
"Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:

> > Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> > Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> 
> Acked-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

Both patches survived all my tests, now I just need an ack by from Dave
and/or Peter, and I'll push it off to Linus.

-- Steve
