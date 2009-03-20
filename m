From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the drm tree
Date: Thu, 19 Mar 2009 22:15:01 -0700
Message-ID: <20090320051501.GB3698@kroah.com>
References: <20090320153826.e6f1d760.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:58481 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753227AbZCTFQd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Mar 2009 01:16:33 -0400
Content-Disposition: inline
In-Reply-To: <20090320153826.e6f1d760.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Thomas Hellstrom <thellstrom@vmware.com>, Richard Purdie <rpurdie@linux.intel.com>, Ben Gamari <bgamari@gmail.com>, Eric Anholt <eric@anholt.net>, Dave Airlie <airlied@linux.ie>

On Fri, Mar 20, 2009 at 03:38:26PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/gpu/drm/Makefile between commit
> 955b12def42e83287c1bdb1411d99451753c1391 ("drm: Convert proc files to
> seq_file and introduce debugfs") from the drm tree and commit
> 69a914df73e04807248f21b6738dab9cf9e3c094 ("drm: Add a tracker for global
> objects") from the staging tree.
> 
> Just trivial overlapping additions.  I fixed it up (see below) and can
> carry the fix as necessary.
> 
> However, I do need to wonder why changes to drivers/gpu are appearing in
> the staging tree - I assumed that its updates would be restricted to the
> drivers/staging directory (as much as possible).

There is a driver in the staging directory that needs these drm core
changes.  I've posted these to David and the drm list and lkml, and we
are currently discussing their future.  If David ends up rejecting them,
I'll drop them from my tree.

thanks,

greg k-h
