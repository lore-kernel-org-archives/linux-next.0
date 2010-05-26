From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build warning in Linus'tree
Date: Wed, 26 May 2010 08:33:32 -0700 (PDT)
Message-ID: <alpine.LFD.2.00.1005260833220.3689@i5.linux-foundation.org>
References: <20100526110506.f2f4f22c.sfr@canb.auug.org.au> <20100525182040.f1882d0a.akpm@linux-foundation.org> <20100526140900.5b091c16.sfr@canb.auug.org.au> <OFC00BDFAC.5596A841-ONC125772F.0022984D-C125772F.0023AF14@transmode.se>
 <20100525234116.71889c71.akpm@linux-foundation.org> <20100526171424.447fac18.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:45622 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753981Ab0EZPhV (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 26 May 2010 11:37:21 -0400
In-Reply-To: <20100526171424.447fac18.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joakim Tjernlund <joakim.tjernlund@transmode.se>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org



On Wed, 26 May 2010, Stephen Rothwell wrote:
> 
> We also need to revert b3b77c8caef1750ebeea1054e39e358550ea9f55 ("endian:
> #define __BYTE_ORDER") in order to get rid of the other warning I pointed out:

Done.

		Linus
