From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: build failure
Date: Wed, 03 Sep 2008 11:19:52 +0100
Message-ID: <1220437192.2985.85.camel@pmac.infradead.org>
References: <20080903184501.f280daf7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:51570 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751765AbYICKT5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Sep 2008 06:19:57 -0400
In-Reply-To: <20080903184501.f280daf7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, 2008-09-03 at 18:45 +1000, Stephen Rothwell wrote:
> -typedef __statfs_word __u32
> +#define __statfs_word __u32

Fixed in the git tree, and in the series I just sent out. Thanks.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
