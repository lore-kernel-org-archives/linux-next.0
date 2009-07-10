From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree import failure
Date: Fri, 10 Jul 2009 01:34:11 +0100
Message-ID: <20090710013411.32a68454@lxorguk.ukuu.org.uk>
References: <20090710091408.67c4da53.sfr@canb.auug.org.au>
	<20090710004743.202b36e5@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:54001 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751325AbZGJAdT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Jul 2009 20:33:19 -0400
In-Reply-To: <20090710004743.202b36e5@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Fixed - chuckle

the right patch was there but I forgot to remove the original patch which
for some reason stgit didn't import properly so you had both in the file.
Will push that tomorrow.
