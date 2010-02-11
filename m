From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build warning after merge of the suspend tree
Date: Thu, 11 Feb 2010 14:11:35 +0100
Message-ID: <201002111411.35634.rjw@sisk.pl>
References: <20100211171018.1011199f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:48159 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752252Ab0BKNLA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Feb 2010 08:11:00 -0500
In-Reply-To: <20100211171018.1011199f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

On Thursday 11 February 2010, Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the suspend tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> drivers/usb/core/hcd-pci.c:138: warning: 'wait_for_companions' defined but not used
> 
> Introduced by commit ce74abf51a15ab82a9fae6dcd8a9c0038945f10e ("USB:
> implement non-tree resume ordering constraints for PCI host controllers").

Thanks for the info, I'll fix this up later today in my tree.

Rafael
