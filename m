From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] ftrace: objcopy version test for local symbols
Date: Mon, 25 Aug 2008 21:01:03 +0200
Message-ID: <20080825190103.GA24029@elte.hu>
References: <20080825130117.33fe34bc.sfr@canb.auug.org.au> <20080825060934.GB14993@elte.hu> <alpine.DEB.1.10.0808251434000.23923@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756641AbYHYTBi@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.1.10.0808251434000.23923@gandalf.stny.rr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


* Steven Rostedt <rostedt@goodmis.org> wrote:

> From: Steven Rostedt <srostedt@redhat.com>
> Subject: ftrace: objcopy version test for local symbols
> 
> The --globalize-symbols option came out in objcopy version 2.17.
> If the kernel is being compiled on a system with a lower version of
> objcopy, then we can not use the globalize / localize trick to
> link to symbols pointing to local functions.
> 
> This patch tests the version of objcopy and will only use the trick
> if the version is greater than or equal to 2.17. Otherwise, if an
> object has only local functions within a section, it will give a
> nice warning and recommend the user to upgrade their objcopy.
> 
> Leaving the symbols unrecorded is not that big of a deal, since the
> mcount record method changes the actual mcount code to be a simple
> "ret" without recording registers or anything.
> 
> Signed-off-by: Steven Rostedt <srostedt@redhat.com>

applied to tip/tracing/ftrace, also have integrated it into 
auto-ftrace-next. (without much testing - i hope it goes well)

	Ingo
