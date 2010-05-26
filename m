From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build warning in Linus'tree
Date: Wed, 26 May 2010 08:29:02 -0700 (PDT)
Message-ID: <alpine.LFD.2.00.1005260828320.3689@i5.linux-foundation.org>
References: <20100526110506.f2f4f22c.sfr@canb.auug.org.au> <20100525182040.f1882d0a.akpm@linux-foundation.org> <20100526140900.5b091c16.sfr@canb.auug.org.au> <OFC00BDFAC.5596A841-ONC125772F.0022984D-C125772F.0023AF14@transmode.se>
 <20100525234116.71889c71.akpm@linux-foundation.org> <20100526171424.447fac18.sfr@canb.auug.org.au> <OFE5212A1C.B62E8E51-ONC125772F.00371EE7-C125772F.0038EEC8@transmode.se>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:44989 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752795Ab0EZPcp (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 26 May 2010 11:32:45 -0400
In-Reply-To: <OFE5212A1C.B62E8E51-ONC125772F.00371EE7-C125772F.0038EEC8@transmode.se>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org



On Wed, 26 May 2010, Joakim Tjernlund wrote:
> 
> If my suggestion above works, then one could start transforming current uses of __BYTE_ORDER,
> into similar constructs and once all are done, #define both __LITTLE_ENDIAN/__BIG_ENDIAN and
> move back to #if __BYTE_ORDER == __LITTLE_ENDIAN

No. Don't do it. Why the hell would we want to use the inferior model?

		Linus
