From: Christoph Hellwig <hch@lst.de>
Subject: Re: [xfs-masters] Re: linux-next: Tree for June 24 (XFS x2)
Date: Thu, 26 Jun 2008 10:17:52 +0200
Message-ID: <20080626081752.GA7462@lst.de>
References: <20080624175612.cdf29651.sfr@canb.auug.org.au> <20080624171809.42bbdf68.randy.dunlap@oracle.com> <20080625003751.GP29319@disturbed> <4861A00E.6040801@sgi.com> <4861A4E8.1060101@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:46223 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750783AbYFZISS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Jun 2008 04:18:18 -0400
Content-Disposition: inline
In-Reply-To: <4861A4E8.1060101@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: xfs-masters@oss.sgi.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

The patch looks good as an iterim fix.  With the pending conversion
to the generic ACL code the handlers for the ACLs will move to xfs_acl.c
and solve this, too.
