From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: ide build failure
Date: Tue, 17 Jun 2008 11:53:54 +0200
Message-ID: <200806171153.54673.bzolnier@gmail.com>
References: <20080616133817.83c9f304.sfr@canb.auug.org.au> <200806161154.43011.bzolnier@gmail.com> <1213656057.8129.143.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.30]:37885 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750793AbYFQJwV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Jun 2008 05:52:21 -0400
Received: by yw-out-2324.google.com with SMTP id 9so3350786ywe.1
        for <linux-next@vger.kernel.org>; Tue, 17 Jun 2008 02:52:20 -0700 (PDT)
In-Reply-To: <1213656057.8129.143.camel@pasglop>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: benh@kernel.crashing.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tuesday 17 June 2008, Benjamin Herrenschmidt wrote:
> 
> > [ However it may be connected with the fact that recently I've been
> >   waiting for _weeks_ for your feedback (sometimes to not get _any_). ]
> 
> Yeah well, I'm a bit swamped, and drivers/ide as far as I'm concerned
> is supposed to be stable and in maintainance mode, not in active
> developement :-) Oh well, anyway, I will try to review your patches
> more promptly. Keep in mind that properly testing changes to the
> pmac IDE driver however does require me to dig various kind of ancient
> HW (such as my half broken Wallstreet powerbook with its mediabay)
> and so is fairly time consuming.

Thanks.

[ I don't envision a lot of ide-pmac changes in the future because
  the driver should be now in line with other host drivers. ]

Bart
