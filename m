From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
	firmware tree
Date: Wed, 3 Jun 2009 07:58:33 -0700
Message-ID: <20090603145833.GA30890@kroah.com>
References: <20090603172307.ea2f6f41.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:39095 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753965AbZFCP1K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2009 11:27:10 -0400
Content-Disposition: inline
In-Reply-To: <20090603172307.ea2f6f41.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Samuel Ortiz <sameo@linux.intel.com>

On Wed, Jun 03, 2009 at 05:23:07PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/base/firmware_class.c between commit
> 6e03a201bbe8137487f340d26aa662110e324b20 ("firmware: speed up
> request_firmware(), v3") from the firmware tree and commit
> ffceb90f9b59a5186b3ce9177bfebf8819b7735a ("firmware: allocate firmware id
> dynamically") from the driver-core tree.
> 
> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix as necessary.

Thanks for the fixup, this looks like something we can handle when we
merge with Linus.

greg k-h
