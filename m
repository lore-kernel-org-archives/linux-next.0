From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: ide build failure
Date: Mon, 16 Jun 2008 21:24:39 +0200
Message-ID: <200806162124.39806.bzolnier@gmail.com>
References: <20080616133817.83c9f304.sfr@canb.auug.org.au> <1213588543.8129.122.camel@pasglop> <200806161154.43011.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from an-out-0708.google.com ([209.85.132.247]:62095 "EHLO
	an-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753589AbYFPTXt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Jun 2008 15:23:49 -0400
Received: by an-out-0708.google.com with SMTP id d40so1228969and.103
        for <linux-next@vger.kernel.org>; Mon, 16 Jun 2008 12:23:47 -0700 (PDT)
In-Reply-To: <200806161154.43011.bzolnier@gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: benh@kernel.crashing.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Monday 16 June 2008, Bartlomiej Zolnierkiewicz wrote:

[...]

> [ I could be of course wrong and there may be real problems with other
>   patches as well so please do review / test.  Thanks! ]
> 
> PS Stephen, thanks for fixing the build problems.

Upon closer look these build problems were present in 3 patches (fixed
patches posted in separate mails) so indeed it wasn't up to the usual
standard (lets call it a warning sign that I need to slow down a bit).

I dropped these ide-pmac patches for now from IDE tree (just to be on
a safe side and also to give Ben sensible amount of time to review+test
the changes).

Thanks,
Bart
