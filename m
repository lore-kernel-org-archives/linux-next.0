From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH] tracing: fix a build error on alpha and m68k
Date: Fri, 31 Oct 2008 00:49:10 +0300
Message-ID: <20081030214910.GA14679@x200.localdomain>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au> <20081023121145.GB27984@x200.localdomain> <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com> <c62985530810230615s3252a54ao6488e763d72dc939@mail.gmail.com> <49008D12.5090204@gmail.com> <Pine.LNX.4.64.0810231635440.18978@anakin> <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com> <Pine.LNX.4.64.0810231727430.18978@anakin> <4900B414.7090002@gmail.com> <20081023163433.GA3160@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759356AbYJ3V4O@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081023163433.GA3160@x200.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

On Thu, Oct 23, 2008 at 08:34:33PM +0400, Alexey Dobriyan wrote:
> On Thu, Oct 23, 2008 at 07:27:48PM +0200, Frederic Weisbecker wrote:
> > When tracing is enabled, some arch have included <linux/irqflags.h>
> > on their <asm/system.h> but others like alpha or m68k don't.
> > 
> > Build error on alpha:
> > 
> > kernel/trace/trace.c: In function 'tracing_generic_entry_update':
> > kernel/trace/trace.c:658: error: implicit declaration of function 'irqs_disabled_flags'

FYI, this error still exists in mainline (7f82f000ed030d1108b4de47d9e2d556092980c6).
