From: Steve Sakoman <steve@sakoman.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Thu, 4 Oct 2018 07:13:37 -1000
Message-ID: <CAOSpxdaoiZxGiHm85LW-Wz+aF_tMDpcqJKgso+NL3OsoL-DDCg@mail.gmail.com>
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

On Thu, Oct 4, 2018 at 7:00 AM Greg Kroah-Hartman <greg@kroah.com> wrote:

> We should just get rid of the "unused" fields entirely.  They aren't
> needed here as this is not a structure that anyone really cares about.
> We can move things around a bit if the padding is an issue.
>
> I've reverted this patch first for now.  I suggest a patch to the uart
> core to drop the unused fields and fix up the samsung driver and then
> your patch can go on top of that.  Can you work on this?

Yes I can. Stay tuned . . .

Steve
