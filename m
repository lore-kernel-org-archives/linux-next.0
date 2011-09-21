From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the powerpc tree
Date: Wed, 21 Sep 2011 07:06:23 -0700
Message-ID: <20110921140623.GA19567@kroah.com>
References: <20110921150121.9f530384bc0bb6c2268fd9ea@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:50155 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750766Ab1IUOIV (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Sep 2011 10:08:21 -0400
Content-Disposition: inline
In-Reply-To: <20110921150121.9f530384bc0bb6c2268fd9ea@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hector Martin <hector@marcansoft.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Andre Heider <a.heider@gmail.com>, Geoff Levand <geoff@infradead.org>

On Wed, Sep 21, 2011 at 03:01:21PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got conflicts in
> arch/powerpc/include/asm/udbg.h and arch/powerpc/kernel/udbg.c between
> commit c26afe9e8591 ("powerpc/ps3: Add gelic udbg driver") from the
> powerpc tree and commit dcd83aaff1c8 ("tty/powerpc: introduce the ePAPR
> embedded hypervisor byte channel driver") from the tty tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Thanks, that looks fine to me.

greg k-h
