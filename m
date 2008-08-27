From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: build failure
Date: Wed, 27 Aug 2008 12:55:22 +1000
Message-ID: <200808271255.22789.rusty@rustcorp.com.au>
References: <20080827100656.0f87e6b2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:39415 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752964AbYH0DtS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Aug 2008 23:49:18 -0400
In-Reply-To: <20080827100656.0f87e6b2.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-next@vger.kernel.org, netdev@vger.kernel.org

On Wednesday 27 August 2008 10:06:56 Stephen Rothwell wrote:
> Introduced by commit 4cb9da6ecc2b0e25056b45981239475f8509d59d ("remove
> CONFIG_KMOD from net") which added a !CONFIG_MODULES (static inline)
> version of dev_load() to include/linux/netdevice.h but the copy in
> net/core/dev.c is not protected by CONFIG_MODULES.

Thanks.  I've fixed this the simplest way: remove the change to the header.

Rusty.
