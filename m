From: Greg Kroah-Hartman <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Thu, 4 Oct 2018 11:22:32 -0700
Message-ID: <20181004182232.GB25473@kroah.com>
References: <20181004151501.280d8282@canb.auug.org.au>
 <CAOSpxdYzm6fTd88gP_OdrTuqbf-kJr3t+3ObPU9vMCHqYJSgHg@mail.gmail.com>
 <20181004170032.GA7344@kroah.com>
 <CAOSpxda1RjgBDN5mKwj8SQ5iVx-SYRMtD32-7_AO5kEwK0-acg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOSpxda1RjgBDN5mKwj8SQ5iVx-SYRMtD32-7_AO5kEwK0-acg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Sakoman <steve@sakoman.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Steinmetz <ast@domdv.de>, Eric C Gallimore <egallimore@ucsd.edu>
List-Id: linux-next.vger.kernel.org


A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Thu, Oct 04, 2018 at 08:13:39AM -1000, Steve Sakoman wrote:
> Hi Greg,
> 
> I sent the patch you requested to fix use of the "unused" struct
> member in samsung.c. If that looks OK to you I'll redo my
> "serial:serial_core: Allow use of CTS for PPS line discipline" patch.

I think it needs a bit of a rework, see my review comments on that
patch.

thanks,

greg k-h
