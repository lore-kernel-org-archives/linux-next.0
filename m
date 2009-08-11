From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: nfsd tree build warning
Date: Tue, 11 Aug 2009 12:53:45 -0400
Message-ID: <20090811165345.GD25588@fieldses.org>
References: <20090811110749.040661e0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fieldses.org ([174.143.236.118]:40644 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754494AbZHKQxo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Aug 2009 12:53:44 -0400
Content-Disposition: inline
In-Reply-To: <20090811110749.040661e0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 11, 2009 at 11:07:49AM +1000, Stephen Rothwell wrote:
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> net/sunrpc/svc_xprt.c: In function 'svc_pool_stats_show':
> net/sunrpc/svc_xprt.c:1211: warning: too few arguments for format
> 
> Caused by commit ffcef87a1f31094709da615454b5911f3711bc65 ("Revert
> "knfsd: avoid overloading the CPU scheduler with enormous load
> averages"").

Whoops, thanks: fixed.

--b.
