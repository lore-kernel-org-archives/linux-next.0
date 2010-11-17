From: Dan Magenheimer <dan.magenheimer@oracle.com>
Subject: RE: linux-next: fate of the cleancache tree
Date: Tue, 16 Nov 2010 20:44:42 -0800 (PST)
Message-ID: <e5499ef1-c26d-4c9c-9336-5c61e65e45bc@default>
References: <20101117133324.0654bfd9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:35056 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933027Ab0KQEpY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Nov 2010 23:45:24 -0500
In-Reply-To: <20101117133324.0654bfd9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>

> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> To: Linus; Dan Magenheimer
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Al Viro;
> Christoph Hellwig; Andrew Morton
> Subject: linux-next: fate of the cleancache tree
> 
> Hi Linus, Dan,
> 
> I didn't really follow the discussion at Kernel Summit, but there
> seemed
> to be some question as to whether the cleancache stuff will be merged
> or
> not.  It missed 2.6.37 (obviously), but my question now is do I keep in
> in linux-next in the hope that it will be merged in 2.6.38?  Or is that
> not going to happen?

Hi Stephen --

I am continuing to work towards other users for cleancache.  While
it is not clear if they will be ready in time for the 2.6.38 window,
it is possible.  If it is not too difficult to keep cleancache in
linux-next for now, I'd appreciate it if it stayed in.  However
if you or Linus prefer otherwise, I understand.

Thanks,
Dan
