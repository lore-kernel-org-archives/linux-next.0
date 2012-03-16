From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the powerpc
 tree
Date: Fri, 16 Mar 2012 08:29:03 -0700
Message-ID: <20120316152903.GG28696@kroah.com>
References: <20120316165207.5a4f0985863b5ae7c50bdd81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34025 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1032896Ab2CPP3G (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Mar 2012 11:29:06 -0400
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 5FD1E2139F
	for <linux-next@vger.kernel.org>; Fri, 16 Mar 2012 11:29:05 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20120316165207.5a4f0985863b5ae7c50bdd81@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Masanari Iida <standby24x7@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Fri, Mar 16, 2012 at 04:52:07PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in
> drivers/char/viotape.c between commit ba7a4822b48f ("powerpc: Remove some
> of the legacy iSeries specific device drivers") from the powerpc tree and
> commit 5fb15db4376f ("char: Fix typo in viotape.c") from the char-misc
> tree.
> 
> The former removed this file, so I did that.

Sounds good to me, thanks.

greg k-h
