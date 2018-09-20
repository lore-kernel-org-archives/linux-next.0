From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build failure after merge of the input-current tree
Date: Thu, 20 Sep 2018 10:02:24 +0200
Message-ID: <2643253.QO5Q8yoTPK@aspire.rjw.lan>
References: <20180919082500.74401754@canb.auug.org.au> <CAKdAkRR8NH8FxfRVsB2DCiyh7QVZLisqZgd1ZgHCnGpUO6KP-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKdAkRR8NH8FxfRVsB2DCiyh7QVZLisqZgd1ZgHCnGpUO6KP-g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Daniel Drake <drake@endlessm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wednesday, September 19, 2018 12:32:03 AM CEST Dmitry Torokhov wrote:
> On Tue, Sep 18, 2018 at 3:25 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi Dmitry,
> >
> > After merging the input-current tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > ERROR: "mem_sleep_current" [drivers/input/serio/i8042.ko] undefined!
> >
> > Caused by commit
> >
> >   1685830e59d4 ("Input: i8042 - enable keyboard wakeups by default when s2idle is used")
> >
> > I have used the version of input-current from next-20180918 for today.
> 
> Ugh, sorry, I dropped that patch from my tree for now.
> 
> Daniel, Rafael, I guess we can't make pm_suspend_via_s2idle() static
> inline, but instead move it into kernel/power/suspend.c and make it
> EXPORT_SYMBOL().

Either that, or mem_sleep_current would need to be exported.  Sorry for
missing that.

Daniel, I prefer the wrapper to be a regular function in suspend.c.

Thanks,
Rafael
