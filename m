From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: Tree for Feb 12
Date: Fri, 12 Feb 2016 11:32:42 +0530
Message-ID: <20160212060241.GA1390@sudip-pc>
References: <20160212162035.1e0260cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:34628 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750714AbcBLGCx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Feb 2016 01:02:53 -0500
Content-Disposition: inline
In-Reply-To: <20160212162035.1e0260cd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 12, 2016 at 04:20:35PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160211:

since last few days with gcc-4.6.3, x86_64 and i386 defconfig and
allmodconfig builds are failing with the error:
"arch/x86/include/asm/tlbflush.h:26:18: error: memory input 0 is not
directly addressable"

But with gcc-4.8.2 and later it builds fine. Should I try to bisect and
find the problem or its not worth for gcc-4.6.3 ?

regards
sudip
