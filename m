From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Tue, 23 Dec 2008 18:16:23 -0800 (PST)
Message-ID: <20081223.181623.209798200.davem@davemloft.net>
References: <20081224101513.def05c7e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:39299
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751911AbYLXCQV (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Dec 2008 21:16:21 -0500
In-Reply-To: <20081224101513.def05c7e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, khc@pm.waw.pl, inaky@linux.intel.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 24 Dec 2008 10:15:13 +1100

> Today's linux-next merge of the net tree got a conflict in
> Documentation/DocBook/networking.tmpl between commit
> 66aa675719ab82a03a66b75210fd40be6541f8fb ("wimax: Makefile, Kconfig and
> docbook linkage for the stack") from the usb tree and commit
> 72364706c3b7c09a658e356218a918c5f92dcad0 ("WAN: syncppp.c is no longer
> used by any kernel code. Remove it") from the net tree.
> 
> Juts an overlapping add/remove. I fixed it up (see below) and can carry
> the fix as necessary.

Thanks Stephen.  You'll need to carry this one.
