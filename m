From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: build failure after merge of the modules tree
Date: Fri, 02 Nov 2012 13:46:04 +1030
Message-ID: <87objg4ruy.fsf@rustcorp.com.au>
References: <20121102125711.6cca854164da5372700db109@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:58485 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750997Ab2KBEZR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 2 Nov 2012 00:25:17 -0400
In-Reply-To: <20121102125711.6cca854164da5372700db109@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Matthew Leach <matthew@mattleach.net>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Rusty,
>
> After merging the modules tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:

As this is in Andrew's tree, I've reverted it from my modules-next tree.

Thanks,
Rusty.
