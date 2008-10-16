From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: manual merge of the scsi-post-merge tree
Date: Thu, 16 Oct 2008 08:56:24 -0500
Message-ID: <1224165384.3322.1.camel@localhost.localdomain>
References: <20081016194143.69fe282c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from accolon.hansenpartnership.com ([76.243.235.52]:55386 "EHLO
	accolon.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752269AbYJPN4c (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 09:56:32 -0400
In-Reply-To: <20081016194143.69fe282c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Thu, 2008-10-16 at 19:41 +1100, Stephen Rothwell wrote:
> I attempted to merge this tree, but it appears that it already applied or
> even updated.  So I have dropped it for today.

Yes, sorry; now all the precursors are upstream I moved its contents to
scsi-misc.  I'll clean the tree out and make merge base equal to head so
it won't cause trouble until it's needed again.

James
