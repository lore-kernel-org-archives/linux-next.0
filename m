From: Steve Sakoman <steve@sakoman.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Thu, 4 Oct 2018 08:13:39 -1000
Message-ID: <CAOSpxda1RjgBDN5mKwj8SQ5iVx-SYRMtD32-7_AO5kEwK0-acg@mail.gmail.com>
References: <20181004151501.280d8282@canb.auug.org.au> <CAOSpxdYzm6fTd88gP_OdrTuqbf-kJr3t+3ObPU9vMCHqYJSgHg@mail.gmail.com>
 <20181004170032.GA7344@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004170032.GA7344@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Steinmetz <ast@domdv.de>, Eric C Gallimore <egallimore@ucsd.edu>
List-Id: linux-next.vger.kernel.org

Hi Greg,

I sent the patch you requested to fix use of the "unused" struct
member in samsung.c. If that looks OK to you I'll redo my
"serial:serial_core: Allow use of CTS for PPS line discipline" patch.

Thanks,

Steve
On Thu, Oct 4, 2018 at 7:00 AM Greg Kroah-Hartman <greg@kroah.com> wrote:
>
> On Thu, Oct 04, 2018 at 06:34:31AM -1000, Steve Sakoman wrote:
> > Interesting indeed. Who would have thought someone would be using the
> > "unused" padding variable!
>
> Ugh :(
>
> > How would folks prefer we fix this, in the referenced patch or by
> > eliminating the use of "unused" in samsung.c?
>
> We should just get rid of the "unused" fields entirely.  They aren't
> needed here as this is not a structure that anyone really cares about.
> We can move things around a bit if the padding is an issue.
>
> I've reverted this patch first for now.  I suggest a patch to the uart
> core to drop the unused fields and fix up the samsung driver and then
> your patch can go on top of that.  Can you work on this?
>
> thanks,
>
> greg k-h
