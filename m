From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 15:14:02 +0100
Message-ID: <20080701151402.19006f07@lxorguk.ukuu.org.uk>
References: <20080702000951.ab1f6666.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:55771 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756045AbYGAObl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 10:31:41 -0400
In-Reply-To: <20080702000951.ab1f6666.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

On Wed, 2 Jul 2008 00:09:51 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next merge of the ttydev tree got a conflict in drivers/usb/serial/airprime.c between commit 31c3b66aea5816d8c9406a272de71ea474ef86b5 ("USB: delete airprime driver") from the usb tree and commit ce8194a09dee5b7e101467aba6b7cd5617b1cd0f ("23-usb-serial-api-change") from the ttydev tree.
> 
> The former removed the file.

Will drop out of my patch
