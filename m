From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build warning after merge of the driver-core tree
Date: Wed, 07 Oct 2015 23:48:11 +0200
Message-ID: <8672077.UYXmy4VzzX@vostro.rjw.lan>
References: <20151007155146.41c4528f@canb.auug.org.au> <CAKohponuRX-XbGHk=T_B1+MXb8TeUwZOYc8NMLrNvZP_U_GSew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:63032 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752402AbbJGVTl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Oct 2015 17:19:41 -0400
In-Reply-To: <CAKohponuRX-XbGHk=T_B1+MXb8TeUwZOYc8NMLrNvZP_U_GSew@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next list <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wednesday, October 07, 2015 08:40:59 AM Viresh Kumar wrote:
> Hi Stephen,
> 
> On 7 October 2015 at 06:51, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Greg,
> >
> > After merging the driver-core tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> >
> > drivers/base/power/opp/debugfs.c: In function 'opp_debug_create_one':
> > drivers/base/power/opp/debugfs.c:48:7: warning: passing argument 4 of 'debugfs_create_bool' from incompatible pointer type
> >   if (!debugfs_create_bool("available", S_IRUGO, d,
> >        ^
> > In file included from drivers/base/power/opp/debugfs.c:13:0:
> > include/linux/debugfs.h:94:16: note: expected 'bool *' but argument is of type 'u32 *'
> >  struct dentry *debugfs_create_bool(const char *name, umode_t mode,
> >                 ^
> > drivers/base/power/opp/debugfs.c:52:7: warning: passing argument 4 of 'debugfs_create_bool' from incompatible pointer type
> >   if (!debugfs_create_bool("dynamic", S_IRUGO, d, (u32 *)&opp->dynamic))
> >        ^
> > In file included from drivers/base/power/opp/debugfs.c:13:0:
> > include/linux/debugfs.h:94:16: note: expected 'bool *' but argument is of type 'u32 *'
> >  struct dentry *debugfs_create_bool(const char *name, umode_t mode,
> >                 ^
> > drivers/base/power/opp/debugfs.c:55:7: warning: passing argument 4 of 'debugfs_create_bool' from incompatible pointer type
> >   if (!debugfs_create_bool("turbo", S_IRUGO, d, (u32 *)&opp->turbo))
> >        ^
> > In file included from drivers/base/power/opp/debugfs.c:13:0:
> > include/linux/debugfs.h:94:16: note: expected 'bool *' but argument is of type 'u32 *'
> >  struct dentry *debugfs_create_bool(const char *name, umode_t mode,
> >                 ^
> >
> > Introduced by commit
> >
> >   621a5f7ad9cd ("debugfs: Pass bool pointer to debugfs_create_bool()")
> >
> > interacting with commit
> >
> >   5cb5fdbf3877 ("PM / OPP: Add debugfs support")
> >
> > from the pm tree.
> 
> That was expected and the PM tree needs to get updated to get it fixed.
> And I will be doing that soon.

For the record, I'm tired of your breaking things on a regular basis like this.

I'm dropping 5cb5fdbf3877 from the PM tree.

Thanks,
Rafael
