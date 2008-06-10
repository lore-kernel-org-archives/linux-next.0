From: "Matt Carlson" <mcarlson@broadcom.com>
Subject: Re: linux-next: net/net-current merge conflict
Date: Tue, 10 Jun 2008 12:38:26 -0700
Message-ID: <20080610193826.GD5841@localdomain>
References: <20080610172823.12e0fb8f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mms1.broadcom.com ([216.31.210.17]:3358 "EHLO mms1.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754031AbYFJTe1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 15:34:27 -0400
In-Reply-To: <20080610172823.12e0fb8f.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Matt Carlson <mcarlson@broadcom.com>, mchan@broadcom.com

The correct thing to do would be to increment the net-next version every
time these conflicts appear.  Right now and to the best of my knowledge,
this policy would only apply to the tg3 driver.  Do you feel this is an
acceptable / sustainable way to deal with versioning between net and
net-next?

On Tue, Jun 10, 2008 at 05:28:23PM +1000, Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next merge of the net tree got a trivial conflict in
> drivers/net/tg3.c between commit 1b84d9462a93ccfa99f725aad744ab4d1af8402b
> ("tg3: Update version to 3.92.1") from the net-current tree and commit
> bb9122b829e960f4e242c04c2b38c12efb37757b ("tg3: Update version to 3.93")
> from the net tree.
> 
> They both update the version and release dates.  I took the net tree
> version.
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/




