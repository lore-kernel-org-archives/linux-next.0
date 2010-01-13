From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: linux-next: origin tree build failure
Date: Wed, 13 Jan 2010 00:14:13 +0000
Message-ID: <4B4D1055.7070605@lougher.demon.co.uk>
References: <20100112121434.49930eea.sfr@canb.auug.org.au>	<alpine.LFD.2.00.1001111720290.17145@localhost.localdomain>	<20100112133252.8b4591bd.sfr@canb.auug.org.au> <20100112133900.f22b3b72.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from anchor-post-3.mail.demon.net ([195.173.77.134]:50281 "EHLO
	anchor-post-3.mail.demon.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751444Ab0AMAR3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Jan 2010 19:17:29 -0500
In-Reply-To: <20100112133900.f22b3b72.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Albin Tonnerre <albin.tonnerre@free-electrons.com>

Stephen Rothwell wrote:
> On Tue, 12 Jan 2010 13:32:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> I guess there is something else in the partially
>> created linux-next today that has triggered this build failure.   I will
>> investigate further.
> 
> Yes, there are two commits in the squashfs tree that rearrange some of
> the decompression code.  They are:
> 
> "lzma: Make lzma available to non initramfs/initrd code"
> "lzma: make lzma reentrant"
> 
> Phillip, you need to merge Linus' tree (or rebase on it) and fix those up
> for the introduction of the LZO decompression stuff.
> 

Done.

Thanks

Phillip
