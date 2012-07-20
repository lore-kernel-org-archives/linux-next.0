From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Fri, 20 Jul 2012 21:55:16 +0100
Message-ID: <20120720215516.03abd164@pyramind.ukuu.org.uk>
References: <20120713141345.f71b7c01f720d616d74721dd@canb.auug.org.au>
	<20120713121053.0637219f@pyramind.ukuu.org.uk>
	<CAMuHMdWRM0y07r1nL-9fXB3nLKXMgftqhiruEeuEe4QYDA2o9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:42460 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751451Ab2GTUvu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Jul 2012 16:51:50 -0400
In-Reply-To: <CAMuHMdWRM0y07r1nL-9fXB3nLKXMgftqhiruEeuEe4QYDA2o9Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Daney <david.daney@cavium.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux MIPS Mailing List <linux-mips@linux-mips.org>

> Today's build failed because there's a new user in the MIPS tree:
> arch/mips/cavium-octeon/serial.c
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/6739341/

The version in the tree I have registers a platform device rather than
calling into 8250 directly. That appears to be rather better mannered
than whatever you are building.

If someone has moved from the platform device could they kindly explain
*why* ?
