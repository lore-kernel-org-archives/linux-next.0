From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: Fix icom serial compile.
Date: Tue, 22 Jul 2008 11:46:49 +0100
Message-ID: <20080722114649.575e22f6@lxorguk.ukuu.org.uk>
References: <20080721211659.GA29106@redhat.com>
	<20080721221355.GD3472@redhat.com>
	<20080721230742.4649b94a@lxorguk.ukuu.org.uk>
	<20080722112538.03c06649.sfr@canb.auug.org.au>
	<20080722030519.7d0e5ee3@lxorguk.ukuu.org.uk>
	<20080722024100.GA23365@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:60084 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750971AbYGVLE1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Jul 2008 07:04:27 -0400
In-Reply-To: <20080722024100.GA23365@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org

> Leaving the tree broken, and NACKing attempts to fix it don't seem to be
> particularly productive for anyone.

I NAKKed the fix because it would have broken the merge *AGAIN* which
would have messed up the merging for everything else all for the matter
of what four hours ?

> Please, less drama, more fixing.

Go see figure 1
