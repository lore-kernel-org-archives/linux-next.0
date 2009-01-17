From: Jesper Nilsson <Jesper.Nilsson@axis.com>
Subject: Re: linux-next: manual merge of the cris tree
Date: Sat, 17 Jan 2009 02:00:28 +0100
Message-ID: <20090117010028.GO19262@axis.com>
References: <20090116111127.3fc8dbd9.sfr@canb.auug.org.au> <1232074284.5786.0.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from krynn.se.axis.com ([193.13.178.10]:32975 "EHLO
	krynn.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755307AbZAQBfl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Jan 2009 20:35:41 -0500
Content-Disposition: inline
In-Reply-To: <1232074284.5786.0.camel@brick>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Fri, Jan 16, 2009 at 03:51:24AM +0100, Harvey Harrison wrote:
> On Fri, 2009-01-16 at 11:11 +1100, Stephen Rothwell wrote:
> > Hi Jesper,
> > 
> > Today's linux-next merge of the cris tree got a conflict in
> > arch/cris/include/arch-v32/arch/byteorder.h between commit
> > aa0effbd1c0269ce7dd13be8dbf13e6b04f30ebd ("cris: introduce asm/swab.h")
> > from Linus' tree and commit 0db42c6b23ce26b05b235dbe2e0aa096db194e33
> > ("cris: use the new byteorder headers") from the cris tree.
> > 
> > There was also conflicts in arch/cris/include/asm/byteorder.h.
> > 
> > I have dropped the cris tree for today.  You should do a merge with
> > Linus' tree and fix these conflicts.
> 
> Linus wanted a slightly different approach for the byteorder headers,
> so the patch in the cris tree is now outdated.  Please drop it.

Ok, I've dropped it. Thanks for the heads up.

> Cheers,
> 
> Harvey

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
