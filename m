From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Sept 4 (cma)
Date: Tue, 04 Sep 2012 10:29:55 -0700
Message-ID: <50463A93.1080108@xenotime.net>
References: <20120904171330.f6b0a922a754ba0f3acc123b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy11-pub.bluehost.com ([173.254.64.10]:47479 "HELO
	oproxy11-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753512Ab2IDRcG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Sep 2012 13:32:06 -0400
In-Reply-To: <20120904171330.f6b0a922a754ba0f3acc123b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>, Michal Nazarewicz <mina86@mina86.com>

On 09/04/2012 12:13 AM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120824:
> 



drivers/base/dma-contiguous.c:351:3: error: expected ';' before '}' token


		} else if (ret != -EBUSY) {
>>>			break
		}


-- 

~Randy
