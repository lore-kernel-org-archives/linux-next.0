From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/2] x86/tbl/trace: Do not trace on CPU that is offline
Date: Sat, 7 Feb 2015 10:22:55 -0500
Message-ID: <20150207102255.2ed95393@grimm.local.home>
References: <20150206200653.009919583@goodmis.org>
	<20150206200800.689573476@goodmis.org>
	<20150206232754.GA17751@linux.vnet.ibm.com>
	<20150206230206.0733828d@grimm.local.home>
	<CA+icZUX+3nsostkVaOEBbOuXDaaXA2sQJaeZ+xS7LXjyieeHvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+icZUX+3nsostkVaOEBbOuXDaaXA2sQJaeZ+xS7LXjyieeHvA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Sat, 7 Feb 2015 09:13:23 +0100
Sedat Dilek <sedat.dilek@gmail.com> wrote:
I fell over this w/o having any experiences in using the tracing
> system within the Linux-kernel.
> Can you give a brief introduction?
> Or can describe how you made your tests?
> Did you use trace-cmd in your tests?
> 
>

Some of the tests use trace-cmd, others use perf, most just do echo and
cat into the tracing directory itself.

I've added these over the years and need to clean them up and put them
someplace public. Right now they are very specific to my machines.

There's also tests in tools/testing/selftests/ftrace. But the rules
for what can go into selftests limit what I can place in there. I will
be adding more tests there soon though.

-- Steve
