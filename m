From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: Tree for June 11
Date: Fri, 25 Jun 2010 22:27:35 +0930
Message-ID: <201006252227.35693.rusty@rustcorp.com.au>
References: <20100611141738.cf8a6bbf.sfr@canb.auug.org.au> <201006151856.38882.rusty@rustcorp.com.au> <20100623155303.65ead123.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:40963 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754086Ab0FYM5l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Jun 2010 08:57:41 -0400
In-Reply-To: <20100623155303.65ead123.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 24 Jun 2010 08:23:03 am Andrew Morton wrote:
> I bisected it down to 4624469822455b4accc886557f6c997ccdd59066
> ("module: kallsyms functions take struct load_info").  I couldn't see
> anything obviously wrong with it, but there's something screwy in
> there..

Great, thanks for bisecting.  I'll wrangle with it a little and see
if I can figure out what screwed up.

Thanks,
Rusty.
