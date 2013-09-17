From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: old trees
Date: Tue, 17 Sep 2013 17:36:12 +0200
Message-ID: <201309171736.12482.arnd@arndb.de>
References: <20130917170124.0afa2e103a9977355ad7c72c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:50804 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752828Ab3IQPg2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2013 11:36:28 -0400
In-Reply-To: <20130917170124.0afa2e103a9977355ad7c72c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

On Tuesday 17 September 2013, Stephen Rothwell wrote:
> asm-generic     9 months ago

I occasionally use this tree, but in most releases all asm-generic patches tend to
go along with whatever patch series needs them, since asm-generic changes are
typically done whenever we add some code to the kernel elsewhere. Please keep this
one.

	Arnd
