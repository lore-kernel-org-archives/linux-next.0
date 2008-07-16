From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of ttydev tree
Date: Wed, 16 Jul 2008 18:56:39 +0100
Message-ID: <20080716185639.0f59b8a6@the-village.bc.nu>
References: <20080711172804.a3ff6b3e.sfr@canb.auug.org.au>
	<20080716201532.157c1736.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 82-39-188-205.cable.ubr03.benw.blueyonder.co.uk ([82.39.188.205]:42002
	"EHLO the-village.bc.nu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753329AbYGQSTL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 14:19:11 -0400
In-Reply-To: <20080716201532.157c1736.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, 16 Jul 2008 20:15:32 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> On Fri, 11 Jul 2008 17:28:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today while importing the ttydev tree, patches
> > "49-tty-tidy-usb-io-edgeport" and "88-tty-moxa-warning" failed to apply
> > so I removed them from the series.
> 
> Today the list expanded to include:
> 30-usb-serial-api-change

Thats ok. I'm currently preparing them all for Linus tree, after that
hopefully the tty tree will start to fit in more sanely.
