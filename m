From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the s390
 tree
Date: Wed, 4 Jan 2012 15:07:57 -0800
Message-ID: <20120104230757.GE24583@kroah.com>
References: <20111228172611.b23752f58cc9cda66c194dc2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5.smtp.messagingengine.com ([66.111.4.29]:53099 "EHLO
	out5.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757292Ab2ADXJW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2012 18:09:22 -0500
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 006AA20C65
	for <linux-next@vger.kernel.org>; Wed,  4 Jan 2012 18:09:21 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20111228172611.b23752f58cc9cda66c194dc2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

On Wed, Dec 28, 2011 at 05:26:11PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> arch/s390/kernel/smp.c between commit 83a24e329084 ("[S390] topology: get
> rid of ifdefs") from the s390 tree and commit 8a25a2fd126c ("cpu: convert
> 'cpu' and 'machinecheck' sysdev_class to a regular subsystem") from the
> driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.
> 
> I also applied the following merge fix patch (which may not be correct or
> enough) for the bits moved into topology.c:

Looks good, thanks for doing this.

greg k-h
