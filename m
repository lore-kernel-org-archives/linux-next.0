From: Timothy Shimmin <tes@sgi.com>
Subject: Re: [xfs-masters] Re: linux-next: Tree for June 24 (XFS x2)
Date: Thu, 17 Jul 2008 15:26:10 +1000
Message-ID: <487ED7F2.3040505@sgi.com>
References: <20080624175612.cdf29651.sfr@canb.auug.org.au> <20080624171809.42bbdf68.randy.dunlap@oracle.com> <20080625003751.GP29319@disturbed> <20080627132317.GB23854@lst.de> <20080716071922.GA16777@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from netops-testserver-3-out.sgi.com ([192.48.171.28]:49819 "EHLO
	relay.sgi.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750954AbYGQF0Z (ORCPT
	<rfc822;@sgi.com:linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 01:26:25 -0400
In-Reply-To: <20080716071922.GA16777@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: xfs-masters@oss.sgi.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Christoph Hellwig wrote:
> On Fri, Jun 27, 2008 at 03:23:17PM +0200, Christoph Hellwig wrote:
>> The tree is still messed up.  This original [XFS] commit is still there,
>> but also a revert of it.  but no patch with the actual changes again (?)
>>
>> Also my patch to switch to the generic xattr code is attributed to
>> Lachlan and appears twice in the commit list.  I think this whole git
>> tree needs to be regenerated.
> 
> Could this please get fixed before the 2.6.27 pull?  The xfs.git tree
> now has Linus' latest changes pulled but this still doesn't look
> fixed up.

Yep, I believe Lachlan is planning to regenerate the xfs git tree before
the pull request.

--Tim
