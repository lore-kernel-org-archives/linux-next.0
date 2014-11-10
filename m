From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Mon, 10 Nov 2014 07:21:30 -0800
Message-ID: <1415632890.22736.1.camel@jarvis.lan>
References: <20141110171533.63b2dfcc@canb.auug.org.au>
	 <525DB349B3FB5444AE057A887CB2A8D8D71B12@nice.asicdesigners.com>
	 <20141110134607.GA3621@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:39256 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752941AbaKJPVc (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Nov 2014 10:21:32 -0500
In-Reply-To: <20141110134607.GA3621@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Anish Bhatt <anish@chelsio.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Karen Xie <kxie@chelsio.com>

On Mon, 2014-11-10 at 14:46 +0100, Christoph Hellwig wrote:
> On Mon, Nov 10, 2014 at 06:27:13AM +0000, Anish Bhatt wrote:
> > Fix for this was sent out on thursday itself, but does not seem to be applied yet :
> > http://marc.info/?l=linux-scsi&m=141529629911520&w=2
> 
> And I pulled it from drivers-for-3.18 early on Thursday, but that didn't
> propagate to James' tree it seems.  I'll do another range of patch merging
> these afternoon and will add the proper version.

so that's adding the 3.18-incoming trees?

James
