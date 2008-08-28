From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for August 28
Date: Thu, 28 Aug 2008 14:39:34 -0700
Message-ID: <20080828143934.a5034a01.akpm@linux-foundation.org>
References: <20080828183307.23c6be82.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:52637 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752005AbYH1VkZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Aug 2008 17:40:25 -0400
In-Reply-To: <20080828183307.23c6be82.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Andy Whitcroft <apw@shadowen.org>

On Thu, 28 Aug 2008 18:33:07 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git

firmware/yamaha/yss225_registers.bin.ihex uses \r\n line termination.
Is that actually required, or can we use plain old \n?

Andy, a checkpatch rule for this would be nice.
