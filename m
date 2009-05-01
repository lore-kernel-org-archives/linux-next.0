From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
	tracing tree
Date: Thu, 30 Apr 2009 22:22:56 -0700
Message-ID: <20090501052256.GA18785@kroah.com>
References: <20090501150115.ce386142.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:54076 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750908AbZEAFXD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 1 May 2009 01:23:03 -0400
Content-Disposition: inline
In-Reply-To: <20090501150115.ce386142.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Jan Blunck <jblunck@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Fri, May 01, 2009 at 03:01:15PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> init/main.c between commit 02af61bb50f5d5f0322dbe5ab2a0d75808d25c7b
> ("tracing, kmemtrace: Separate include/trace/kmemtrace.h to kmemtrace
> part and tracepoint part") from the tracing tree and commit
> e6a9527dba81973b8fe7000f42c84b2ffbe98d65 ("driver-core: devtmpfs - driver
> core maintained /dev tmpfs") from the driver-core tree.
> 
> Just simple overlapping additions.  I fixed it up (see below) and can
> carry the fix as necessary.

Thanks, it's a pretty trivial merge.

> [Aside:  the first I can find of this is the patch submission to LKML
> within the last day ... so "posted, reviewed, unit tested"?  I assume
> this has had some discussion somewhere, but Google doesn't know where.]

It was posted today for discussion, which didn't seem to happen.

It has been unit tested a lot in SuSE's kernels with review from our
kernel developers (hence the 3 signed-off-bys).   We use it to speed up
booting a lot because we have to use an initramfs (like all distros need
to for various reasons.)  It aleviates the udev coldplug issues a lot,
and the embedded developers have been very happy to see this (for some
reason they only like writing private emails, not to the list, which is
unfortunate.)

thanks,

greg k-h
