From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: build warnings after merge of the ftrace tree
Date: Tue, 5 Jul 2016 15:29:09 -0400
Message-ID: <20160705152909.726348af@gandalf.local.home>
References: <20160704154207.159b102a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160704154207.159b102a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, 4 Jul 2016 15:42:07 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Steven,
> 
> After merging the ftrace tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:

I'm currently running the patch I posted previously and if all goes
well will have that patch added to my ftrace-next repo tonight.
Fengguang Wu's bot caught this, but I was working on something else.
Over the weekend I was wondering why I haven't pushed my repo yet (I
forgot about this), and pushed my branch.

So this doesn't happen again, I added:

 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set

to one of the configs I use for testing, as my tests didn't die when
a mismatch was added and caught.

-- Steve

Link: http://lkml.kernel.org/r/20160704102139.19cbc0d9@gandalf.local.home
