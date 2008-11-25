From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [BUILD_FAILURE] linux-next: 20081125 - 8390 network driver
 build fails
Date: Tue, 25 Nov 2008 18:51:54 +0000
Message-ID: <20081125185154.2845e8f1@lxorguk.ukuu.org.uk>
References: <20081125213738.881b425e.sfr@canb.auug.org.au>
	<20081125182542.GA4914@linux.vnet.ibm.com>
	<492C464D.4080704@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:50324 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751976AbYKYSwd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 13:52:33 -0500
In-Reply-To: <492C464D.4080704@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, p_gortmaker@yahoo.com, netdev@vger.kernel.org, mel@csn.ul.ie

> I just reported this on netdev and said that DaveM might want to drop a patch
> that I had submitted.  Anyway, I'm looking into it.

Ditto and the only sane interpretation I can see is that someone
somewhere has crap in their tree that does

#define static

and this is leaking out.
