From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging-next tree with the
	v4l-dvb tree
Date: Wed, 28 Jul 2010 06:51:49 -0700
Message-ID: <20100728135149.GA12904@kroah.com>
References: <20100728152736.bcaa5d59.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:47188 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751134Ab0G1N4P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Jul 2010 09:56:15 -0400
Content-Disposition: inline
In-Reply-To: <20100728152736.bcaa5d59.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jarod Wilson <jarod@redhat.com>, Mauro Carvalho Chehab <mchehab@redhat.com>

On Wed, Jul 28, 2010 at 03:27:36PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging-next tree got a conflict in
> drivers/staging/Kconfig between commit
> 44d349d2b19019e0b5912bc4e6c8531e50b394aa ("V4L/DVB: staging/lirc: wire up
> Kconfig and Makefile bits") from the v4l-dvb tree and several commits
> from the staging-next tree.
> 
> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix as necessary.

Looks good to me.

thanks,

greg k-h
