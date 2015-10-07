From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the driver-core tree
Date: Thu, 8 Oct 2015 09:04:27 +1100
Message-ID: <20151008090427.61690eef@canb.auug.org.au>
References: <20151007155146.41c4528f@canb.auug.org.au>
	<CAKohponuRX-XbGHk=T_B1+MXb8TeUwZOYc8NMLrNvZP_U_GSew@mail.gmail.com>
	<8672077.UYXmy4VzzX@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60753 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751757AbbJGWE3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Oct 2015 18:04:29 -0400
In-Reply-To: <8672077.UYXmy4VzzX@vostro.rjw.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Greg KH <greg@kroah.com>, linux-next list <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Rafael,

On Wed, 07 Oct 2015 23:48:11 +0200 "Rafael J. Wysocki" <rjw@rjwysocki.net> wrote:
>
> On Wednesday, October 07, 2015 08:40:59 AM Viresh Kumar wrote:
> > 
> > On 7 October 2015 at 06:51, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the driver-core tree, today's linux-next build (arm
> > > multi_v7_defconfig) produced this warning:
> > >
> > > drivers/base/power/opp/debugfs.c: In function 'opp_debug_create_one':
> > > drivers/base/power/opp/debugfs.c:48:7: warning: passing argument 4 of 'debugfs_create_bool' from incompatible pointer type
> > >   if (!debugfs_create_bool("available", S_IRUGO, d,
> > >        ^
> > > In file included from drivers/base/power/opp/debugfs.c:13:0:
> > > include/linux/debugfs.h:94:16: note: expected 'bool *' but argument is of type 'u32 *'
> > >  struct dentry *debugfs_create_bool(const char *name, umode_t mode,
> > >                 ^
> > > drivers/base/power/opp/debugfs.c:52:7: warning: passing argument 4 of 'debugfs_create_bool' from incompatible pointer type
> > >   if (!debugfs_create_bool("dynamic", S_IRUGO, d, (u32 *)&opp->dynamic))
> > >        ^
> > > In file included from drivers/base/power/opp/debugfs.c:13:0:
> > > include/linux/debugfs.h:94:16: note: expected 'bool *' but argument is of type 'u32 *'
> > >  struct dentry *debugfs_create_bool(const char *name, umode_t mode,
> > >                 ^
> > > drivers/base/power/opp/debugfs.c:55:7: warning: passing argument 4 of 'debugfs_create_bool' from incompatible pointer type
> > >   if (!debugfs_create_bool("turbo", S_IRUGO, d, (u32 *)&opp->turbo))
> > >        ^
> > > In file included from drivers/base/power/opp/debugfs.c:13:0:
> > > include/linux/debugfs.h:94:16: note: expected 'bool *' but argument is of type 'u32 *'
> > >  struct dentry *debugfs_create_bool(const char *name, umode_t mode,
> > >                 ^
> > >
> > > Introduced by commit
> > >
> > >   621a5f7ad9cd ("debugfs: Pass bool pointer to debugfs_create_bool()")
> > >
> > > interacting with commit
> > >
> > >   5cb5fdbf3877 ("PM / OPP: Add debugfs support")
> > >
> > > from the pm tree.
> > 
> > That was expected and the PM tree needs to get updated to get it fixed.
> > And I will be doing that soon.
> 
> For the record, I'm tired of your breaking things on a regular basis like this.
> 
> I'm dropping 5cb5fdbf3877 from the PM tree.

To be fair, this is caused by in interaction between your tree and
Greg's ... i.e. the API for debugfs_create_bool() was updated in Greg's
tree while a new use of it was added to your tree.  It can only be
fixed by one of you merging the other's tree (or part of it) or by
someone giving me a merge resolution patch (or just a hint) and me
carrying that (and someone remembering to tell Linus about it.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
