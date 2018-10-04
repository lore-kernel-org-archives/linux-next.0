From: Greg Kroah-Hartman <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Thu, 4 Oct 2018 10:00:32 -0700
Message-ID: <20181004170032.GA7344@kroah.com>
References: <20181004151501.280d8282@canb.auug.org.au>
 <CAOSpxdYzm6fTd88gP_OdrTuqbf-kJr3t+3ObPU9vMCHqYJSgHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOSpxdYzm6fTd88gP_OdrTuqbf-kJr3t+3ObPU9vMCHqYJSgHg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Sakoman <steve@sakoman.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Steinmetz <ast@domdv.de>, Eric C Gallimore <egallimore@ucsd.edu>
List-Id: linux-next.vger.kernel.org

On Thu, Oct 04, 2018 at 06:34:31AM -1000, Steve Sakoman wrote:
> Interesting indeed. Who would have thought someone would be using the
> "unused" padding variable!

Ugh :(

> How would folks prefer we fix this, in the referenced patch or by
> eliminating the use of "unused" in samsung.c?

We should just get rid of the "unused" fields entirely.  They aren't
needed here as this is not a structure that anyone really cares about.
We can move things around a bit if the padding is an issue.

I've reverted this patch first for now.  I suggest a patch to the uart
core to drop the unused fields and fix up the samsung driver and then
your patch can go on top of that.  Can you work on this?

thanks,

greg k-h
