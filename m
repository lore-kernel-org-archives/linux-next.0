From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the rtc tree
Date: Tue, 11 Apr 2017 07:55:09 +0200
Message-ID: <20170411055509.o2ob2z3kavteykqh@piout.net>
References: <20170410160454.3741cce8@canb.auug.org.au>
 <e5cb6b88-ea66-c874-272e-183bba1a2d7a@redhat.com>
 <20170411102238.24477c5d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:48784 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752224AbdDKFzL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Apr 2017 01:55:11 -0400
Content-Disposition: inline
In-Reply-To: <20170411102238.24477c5d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hans de Goede <hdegoede@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 11/04/2017 at 10:22:38 +1000, Stephen Rothwell wrote:
> Hi Hans,
> 
> On Mon, 10 Apr 2017 09:45:45 +0200 Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > On 10-04-17 08:04, Stephen Rothwell wrote:
> > >
> > > After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
> > > failed like this:
> > >
> > > ERROR: "legacy_pic" [drivers/rtc/rtc-cmos.ko] undefined!
> > >
> > > Caused by commit
> > >
> > >   d3e3a65c6a96 ("rtc: cmos: Do not assume irq 8 for rtc when there are no legacy irqs")
> > >
> > > "legacy_pic" is not exported to modules.
> > >
> > > I have used the rtc tree from next-20170407 for today.  
> > 
> > I already send out a patch to fix this yesterday. I've attached a copy.
> 
> I will add that to linux-next today and will drop it when Alexandre
> adds it (or some other fix).
> 

I think the x86 maintainers will take it as it is fairly independent.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
