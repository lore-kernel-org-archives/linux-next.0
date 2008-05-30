From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: rr/driver-core merge conflict
Date: Thu, 29 May 2008 20:55:00 -0700
Message-ID: <20080530035500.GA7302@kroah.com>
References: <20080530132009.398754a5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:59896 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752139AbYE3D4c (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 May 2008 23:56:32 -0400
Content-Disposition: inline
In-Reply-To: <20080530132009.398754a5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Cornelia Huck <cornelia.huck@de.ibm.com>

On Fri, May 30, 2008 at 01:20:09PM +1000, Stephen Rothwell wrote:
> Hi Greg, Rusty,
> 
> Today's linux-next merge of the rr tree got a trivial context conflict in
> drivers/s390/kvm/kvm_virtio.c between "s390: Use s390_root_dev_* in
> kvm_virtio" from the driver-core tree and "virtio:common-index-counters"
> from the rr tree.  I did the obvious fixup and will carry it.

Thanks.  The s390 kvm patch came from the s390 kvm developers, so I hope
we can trust it :)

greg k-h
