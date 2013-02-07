From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: manual merge of the signal tree with the s390 tree
Date: Thu, 7 Feb 2013 09:41:05 +0100
Message-ID: <20130207084105.GA3929@osiris>
References: <20130207162205.cf749e433ad1ca45410d0aa7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp16.uk.ibm.com ([195.75.94.112]:34628 "EHLO
	e06smtp16.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752208Ab3BGIlK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Feb 2013 03:41:10 -0500
Received: from /spool/local
	by e06smtp16.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Thu, 7 Feb 2013 08:39:24 -0000
Content-Disposition: inline
In-Reply-To: <20130207162205.cf749e433ad1ca45410d0aa7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Thu, Feb 07, 2013 at 04:22:05PM +1100, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next merge of the signal tree got a conflict in
> arch/s390/Kconfig between commit ad2c429560fc ("s390/Kconfig: sort list
> of arch selected config options") from the s390 tree and commits
> e181ee4cd7e5 ("s390: switch to generic old sigsuspend") and 7eddd99c289a
> ("s390: switch to generic old sigaction()") from the signal tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks Stephen. I hope in the long term sorting the config options pays
off, since seeing merge conflicts like this is exactly what I wanted
to avoid.. :)
