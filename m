From: "Joonsoo Kim" <iamjoonsoo.kim@lge.com>
Subject: RE: next-20160307 build: 2 failures 19 warnings (next-20160307)
Date: Tue, 8 Mar 2016 15:25:46 +0900
Message-ID: <002b01d17903$59b2ae00$0d180a00$@lge.com>
References: <E1actUq-0008MZ-EF@optimist> <20160308022056.GV18327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from LGEAMRELO13.lge.com ([156.147.23.53]:36165 "EHLO
	lgeamrelo13.lge.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751308AbcCHGZt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Mar 2016 01:25:49 -0500
In-Reply-To: <20160308022056.GV18327@sirena.org.uk>
Content-Language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Mark Brown' <broonie@kernel.org>, 'Andrew Morton' <akpm@linux-foundation.org>, 'Michal Nazarewicz' <mina86@mina86.com>, 'Steven Rostedt' <rostedt@goodmis.org>, 'Mel Gorman' <mgorman@techsingularity.net>, 'Minchan Kim' <minchan@kernel.org>, 'Sergey Senozhatsky' <sergey.senozhatsky.work@gmail.com>, "'Kirill A. Shutemov'" <kirill.shutemov@linux.intel.com>, 'Catalin Marinas' <catalin.marinas@arm.com>, 'Will Deacon' <will.deacon@arm.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org



> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Tuesday, March 08, 2016 11:21 AM
> To: Andrew Morton; Joonsoo Kim; Michal Nazarewicz; Steven Rostedt; Mel
> Gorman; Minchan Kim; Sergey Senozhatsky; Kirill A. Shutemov; Catalin
> Marinas; Will Deacon
> Cc: kernel-build-reports@lists.linaro.org; linaro-kernel@lists.linaro.org;
> linux-next@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: next-20160307 build: 2 failures 19 warnings (next-20160307)
> 
> On Mon, Mar 07, 2016 at 11:38:44AM +0000, Build bot for Mark Brown wrote:
> 
> For the past week or so an arm64 allmodconfig has failed to build.  I've
> not been able to perform a bisect to identify where as I've been
> travelling but the errors are below, I suspect they are triggered by
> recent changes in the akpm tree adding tracepoints to the page reference
> code.

Hello,

It's already reported problem and solved by following patch.

http://ozlabs.org/~akpm/mmots/broken-out/mm-page_ref-add-tracepoint-to-track
-down-page-reference-manipulation-fix-3.patch

Once Andrew releases new mmotm and it is applied to linux-next,
no error will happen.

Thanks.
