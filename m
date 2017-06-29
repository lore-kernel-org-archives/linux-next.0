From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 random tree
Date: Thu, 29 Jun 2017 14:04:01 -0700
Message-ID: <20170629140401.7aa5b79333c9f4cfa0958fed@linux-foundation.org>
References: <20170608162812.640fb3ab@canb.auug.org.au>
        <20170628160348.16d15d02@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:59986 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751626AbdF2VEC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Jun 2017 17:04:02 -0400
In-Reply-To: <20170628160348.16d15d02@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Theodore Ts'o <tytso@mit.edu>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Rik van Riel <riel@redhat.com>

On Wed, 28 Jun 2017 16:03:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> [Yes, top posting :-)]
> 
> With the merge window approaching, just a reminder that this conflict
> still exists.

huh, it was only a teeny thing.

I moved 

randomstackprotect-introduce-get_random_canary-function.patch
forkrandom-use-get_random_canary-to-set-tsk-stack_canary.patch
x86-ascii-armor-the-x86_64-boot-init-stack-canary.patch
arm64-ascii-armor-the-arm64-boot-init-stack-canary.patch
sh64-ascii-armor-the-sh64-boot-init-stack-canary.patch

to be post-linux-next and refreshed, so it should be good now.
