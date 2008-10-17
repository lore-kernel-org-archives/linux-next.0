From: Trond Myklebust <Trond.Myklebust@netapp.com>
Subject: Re: linux-next: Tree for October 17 (build errors/warnings)
Date: Fri, 17 Oct 2008 18:01:03 -0400
Message-ID: <1224280863.7517.2.camel@localhost>
References: <20081017194045.202e6271.sfr@canb.auug.org.au>
	 <Pine.LNX.4.64.0810171346540.685@shark.he.net>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.netapp.com ([216.240.18.37]:27401 "EHLO mx2.netapp.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753778AbYJQWCA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 18:02:00 -0400
In-Reply-To: <Pine.LNX.4.64.0810171346540.685@shark.he.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Randy.Dunlap" <rdunlap@xenotime.net>, dhowells@redhat.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ericvh@gmail.com, jaharkes@cs.cmu.edu, airlied@linux.ie

On Fri, 2008-10-17 at 13:56 -0700, Randy.Dunlap wrote:
> On Fri, 17 Oct 2008, Stephen Rothwell wrote:
> 
> > Today's tree will not build for powerpc allyesconfig (libc aborts the
> > link due to a free() problem), sparc(32) defconfig and probably some
> > other configurations.
> 
> Since I don't have time to fix all of these, I'll just list a summary of
> today's randconfig build errors:
> 
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> build-r9562.out:ksysfs.c:(.text+0x21463): undefined reference to `create_proc_profile'
> with CONFIG_PROC_FS=n, CONFIG_SYSFS=n
> 
> build-r9567.out:linux-next-20081017/fs/nfsctl.c:45: error: implicit declaration of function 'current_cred'

This one doesn't have anything to do with my git tree. I'm assuming it
is related to the credentials patches from David Howells (cced).

-- 
Trond Myklebust
Linux NFS client maintainer

NetApp
Trond.Myklebust@netapp.com
www.netapp.com
