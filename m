From: Patrick Venture <venture@google.com>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Fri, 26 Apr 2019 11:00:49 -0700
Message-ID: <CAO=notxMAQinwQrrbGwYAUD3JGq8zo42U314Km_QKQrnrkRoQA@mail.gmail.com>
References: <20190426155653.2cdebc5d@canb.auug.org.au> <20190426062548.GB5920@kroah.com>
 <CAO=notwQFWRVDtoH+NGWpm647pJHVFvVoPm3EKdKmdrRUmDZqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAO=notwQFWRVDtoH+NGWpm647pJHVFvVoPm3EKdKmdrRUmDZqw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 26, 2019 at 7:30 AM Patrick Venture <venture@google.com> wrote:
>
> On Thu, Apr 25, 2019 at 11:25 PM Greg KH <greg@kroah.com> wrote:
> >
> > On Fri, Apr 26, 2019 at 03:56:53PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > After merging the char-misc tree, today's linux-next build (x86_64
> > > allmodconfig) produced this warning:
> > >
> > > drivers/misc/aspeed-p2a-ctrl.c: In function 'aspeed_p2a_mmap':
> > > drivers/misc/aspeed-p2a-ctrl.c:110:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
> > >   pgprot_t prot = vma->vm_page_prot;
> > >   ^~~~~~~~
> > >
> > > Introduced by commit
> > >
> > >   01c60dcea9f7 ("drivers/misc: Add Aspeed P2A control driver")
> >
> > Patrick, I thought you fixed all of these already?  Can you send a patch
> > again?
>
> I fixed the ones caught by the robot.  I'll have to switch up my build
> environment a bit to fault on warnings for the kernel, not sure why it
> isn't --

Verified the warnings being ignored isn't a local configuration issue,
but the way OpenBMC is configured.  Verified the warning via normal
kernel compilation and fixed the issue.  Reran and found no other
issues for that drivers.  Submitted patch for review.

>
> >
> > Can you also make the driver so it can build with CONFIG_COMPILE_TEST
> > enabled so that others can find your problems earlier in the review
> > process?

Verified the driver builds and produces no warnings.

Thanks,
Patrick

>
> Roger that.
>
> >
> > thanks,
> >
> > greg k-h
