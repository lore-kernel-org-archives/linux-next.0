From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for September 3
Date: Thu, 4 Sep 2008 10:21:21 +0100
Message-ID: <20080904102121.40c91139@lxorguk.ukuu.org.uk>
References: <20080903191619.6b6b230e.sfr@canb.auug.org.au>
	<20080903214634.ea17ff53.akpm@linux-foundation.org>
	<20080903215455.792c78a3.akpm@linux-foundation.org>
	<20080904145744.3f791ca7.sfr@canb.auug.org.au>
	<20080903220546.bd673658.akpm@linux-foundation.org>
	<20080904152015.3145b06e.sfr@canb.auug.org.au>
	<20080903230129.806d54af.akpm@linux-foundation.org>
	<20080904001558.875f58b1.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:41376 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752576AbYIDJWU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Sep 2008 05:22:20 -0400
In-Reply-To: <20080904001558.875f58b1.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Yinghai Lu <yhlu.kernel@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>

> [*] symptoms: there are no login prompts appearing on the VT consoles. 
> sshd works OK (will it did, but I had to disable the net driver due to
> networking bisect breakage).

What does an strace of the getty tasks show ?
