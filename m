From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: Automated Build Infrastructure
Date: Wed, 26 Nov 2008 11:59:46 -0800
Message-ID: <20081126115946.6d425563.randy.dunlap@oracle.com>
References: <A938C8A5-205C-4DBF-A242-3966757C02E6@gmail.com>
	<20081117144535.6981ecef.sfr@canb.auug.org.au>
	<4920F951.5080109@oracle.com>
	<49210027.8070608@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:16771 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750816AbYKZUAD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Nov 2008 15:00:03 -0500
In-Reply-To: <49210027.8070608@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Holden <aciddeath@gmail.com>
Cc: linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Sun, 16 Nov 2008 21:24:55 -0800 Randy Dunlap wrote:

> Randy Dunlap wrote:
> > Stephen Rothwell wrote:
> >> Hi Richard,
> >>
> >> On Sun, 16 Nov 2008 20:32:39 -0700 Richard Holden <aciddeath@gmail.com> wrote:
> >>> Does anyone have any scripts to kick off compilation when Stephen  
> >>> releases a new linux-next? I've started to plan out my own but wanted  
> >>> to see if anyone had something first so I don't reinvent the wheel.
> >> In case it helps, your most reliable trigger would be the LATEST-IS file
> >> in http://www.kernel.org/pub/linux/kernel/people/sfr/linux-next/
> >> changing.  I think Randy Dunlap (cc'd) has some stuff.
> > 
> > Hi,
> > 
> > My scripts are available in
> >    http://www.xenotime.net/linux/scripts/
> > 
> > The scripts are:  grab_kernel (for mainline), grab_next (for -next),
> > and get-mmotm (for mmotm).  They all work with tarballs and patches,
> > not git trees.  get-mmotm requires an mainline tree for its patch
> > series to be applied to.  The 'kcurrent' script tells me what
> > linux-next or mmotm applies to:
> > 
> > The latest stable version of the Linux kernel is:           2.6.27.6
> > The latest prepatch for the stable Linux kernel tree is:    2.6.28-rc5
> > The latest snapshot for the stable Linux kernel tree is:    2.6.28-rc5-git1
> > The latest 2.4 version of the Linux kernel is:              2.4.36.9
> > The latest prepatch for the 2.4 Linux kernel tree is:       2.4.37-rc2
> > The latest 2.2 version of the Linux kernel is:              2.2.26
> > The latest prepatch for the 2.2 Linux kernel tree is:       2.2.27-rc2
> > The latest -mm patch to the stable Linux kernels is:        2.6.28-rc2-mm1
> > mmotm-2008-1114-2050 ... applies to: 2.6.28-rc4
> > next-20081114 ... applies to: v2.6.28-rc4
> > 
> > grab_kernel downloads & applies any mainline kernel (except for
> > -stable kernels); it knows how to apply -rc & -git patches (zipped).
> > 
> > If you have any questions about them, just ask.
> 
> OK, these scripts don't do the automated kickoff part.
> For that, I'm using Crucible (crucible.sf.net).
> The scripts are all in the subversion repository at sf.net.


Hi,
Here are 2 other options for you (besides Crucible, which may be
overkill for this task).  The first one uses git.


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

A.  From:	Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
To:	linux-next@vger.kernel.org
Subject: Script to automatically build and test linux-next locally
Date:	Tue, 29 Jul 2008 17:57:28 +0200

Hello!

Just wanted to share this [0] script for easy rebuild with others, who
build their kernel quite regullary, like I do.

Sincerly,

Nico

[0]: http://unix.schottelius.org/cgi-bin/gitweb.cgi?p=nsbin;a=blob;f=linux-next-build.sh;h=a53aac2e3d5df099fa5cf0f7e3c65f62bc02ccc0;hb=HEAD


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

B.  I just added 2 small scripts to my library of many scripts:
wait4next and build_next.  They use the scripts that I mentioned above.

The usage is simply:  build_next 20081130

build_next waits for the target linux-next to be available (defaults to the
current day's version), downloads it (using grab_next mentioned above),
then kicks off some builds of it.  You can customize the builds part
as you see fit.  I use it to kick off a bunch of randconfig builds.


http://www.xenotime.net/linux/scripts/build_next
http://www.xenotime.net/linux/scripts/wait4next

---
~Randy
