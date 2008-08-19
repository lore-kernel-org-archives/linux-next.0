From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: import of ttydev failed
Date: Tue, 19 Aug 2008 09:21:57 +0100
Message-ID: <20080819092157.2ca2c23f@lxorguk.ukuu.org.uk>
References: <20080819104952.ddf914e0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:51364 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751464AbYHSIjR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Aug 2008 04:39:17 -0400
In-Reply-To: <20080819104952.ddf914e0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, 19 Aug 2008 10:49:52 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Firstly, can you put a line in your series files that looks like this:
> 
> # BASE <sha1|git commit identifier>
> 
> This could replace the current first line you have or be another line
> with the same id in it.

Its on my todo list - but I need to dig into the innards of stgit to do
that. Fixed the others (forgot to do a clean after merging stuff)

Alan
