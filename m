From: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: drm tree build failure
Date: Wed, 4 Feb 2009 08:35:19 +0000 (GMT)
Message-ID: <alpine.DEB.2.00.0902040834460.22386@skynet.skynet.ie>
References: <20090204163318.0ebba7e1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gir.skynet.ie ([193.1.99.77]:37398 "EHLO gir.skynet.ie"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751920AbZBDIfV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2009 03:35:21 -0500
In-Reply-To: <20090204163318.0ebba7e1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, =?ISO-8859-15?Q?=22Kristian_H=F8gsberg=22?= <krh@redhat.com>

On Wed, 4 Feb 2009, Stephen Rothwell wrote:

> Hi Dave,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:

Oops need to run git diff before pushing branches, half a changeset 
sitting on my PC still.

Thanks,
Dave.


> 
> drivers/gpu/drm/radeon/radeon_drv.c:98: error: unknown field 'dri_library_name' specified in initializer
> drivers/gpu/drm/radeon/radeon_drv.c:98: warning: initialization from incompatible pointer type
> 
> Caused by commit 9a6c3df9d95d4986b55a6de951310aaf9e3c9546 ("drm: Drop
> unused and broken dri_library_name sysfs attribute").  Grep is your
> friend ...
> 
> I have dropped the drm tree for today.
> 
