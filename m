From: Alan Cox <alan@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Sun, 17 Jul 2011 00:39:38 +0100
Message-ID: <20110717003938.375976aa@bob.linux.org.uk>
References: <20110716231511.394534c7936a65d70a0a3ce6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:47441 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752488Ab1GPXiR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 16 Jul 2011 19:38:17 -0400
In-Reply-To: <20110716231511.394534c7936a65d70a0a3ce6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 16 Jul 2011 23:15:11 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/video/Kconfig:36:error: recursive dependency detected!
> drivers/video/Kconfig:36:	symbol FB is selected by
> DRM_KMS_HELPER drivers/gpu/drm/Kconfig:22:	symbol
> DRM_KMS_HELPER is selected by DRM_PSB
> drivers/staging/gma500/Kconfig:1:	symbol DRM_PSB depends on
> ACPI_VIDEO
> 
> Caused by commit 66dca5178c70 ("gma500: Fix dependencies").

Can you drop that one of your tree Greg - duplicated here and I need to
think somewhat harder about how we sort that out.
