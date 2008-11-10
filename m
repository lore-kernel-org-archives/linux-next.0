From: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Subject: Re: linux-next: Tree for November 7
Date: Mon, 10 Nov 2008 17:12:35 +0900
Message-ID: <20081110171235.f219cf0b.kamezawa.hiroyu@jp.fujitsu.com>
References: <20081107205457.f64dea59.sfr@canb.auug.org.au>
	<20081110154535.8848546e.kamezawa.hiroyu@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fgwmail6.fujitsu.co.jp ([192.51.44.36]:56601 "EHLO
	fgwmail6.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750970AbYKJINN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Nov 2008 03:13:13 -0500
In-Reply-To: <20081110154535.8848546e.kamezawa.hiroyu@jp.fujitsu.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 10 Nov 2008 15:45:35 +0900
KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com> wrote:

> On Fri, 7 Nov 2008 20:54:57 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > Changes since 20081106:
> > 
> > Undropped trees:
> > 	cpus4096
> > 	creds
> > 	userns
> > 
> > Dropped trees (temporarily):
> > 	v4l-dvb (due to an unfixed build failure)
> > 	semaphore-removal (due to unfixed conflicts against Linus' tree)
> > 	xfs (unresolved build error)
> > 	firmware (unfixed build failure)
> > 	perfmon3 (build errors and a merge conflict)
> > 
> 
> following script hangs easily on my x86-64 box (on VMWare)
> (When a program hangs, all other programs hang when they access filesystem(ext3)/disk)
> 
> ==
> #!/bin/bash
> 
> while true; do
> 	dd if=/dev/zero of=./tmpfile bs=4096 count=10000
> 	sync
> 	rm ./tmpfile
> 	sync;
> done;
> ==
> Any idea ?
> 
Seems linux-next-November-10 works well.

Sorry for noise.

Thanks,
-Kame
