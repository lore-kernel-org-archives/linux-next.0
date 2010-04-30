From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the input tree
Date: Fri, 30 Apr 2010 07:44:02 -0700
Message-ID: <20100430144402.GE1824@kroah.com>
References: <20100430155122.db4d0b54.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:51959 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933000Ab0D3Rnc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 30 Apr 2010 13:43:32 -0400
Content-Disposition: inline
In-Reply-To: <20100430155122.db4d0b54.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ping Cheng <pingc@wacom.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

On Fri, Apr 30, 2010 at 03:51:22PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/input/tablet/wacom_sys.c between commits
> 4492efffffeb88d87e7aa74765f3c53b3a7dd40f ("Input: wacom - share pen info
> with touch of the same ID") and 51269fe86c263ec4fafbafe82970e6d7f6f79102
> ("Input: wacom - do not allocate wacom_wac separately") from the input
> tree and commit 3cc96f50329227fbf34de2459491901b6ee1c98c ("USB: rename
> usb_buffer_alloc() and usb_buffer_free() users") from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks, I think you will have to until things get merged.

greg k-h
