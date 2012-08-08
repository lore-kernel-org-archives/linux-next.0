From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] tools/perf: fix build when WERROR=1
Date: Wed, 08 Aug 2012 19:47:22 +0300
Message-ID: <1344444442.24513.36.camel@smile>
References: <1344438350-22574-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <20120808161849.GC2210@infradead.org> <1344443566.24513.35.camel@smile>
	 <20120808163829.GD2210@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:12790 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758853Ab2HHQrD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Aug 2012 12:47:03 -0400
In-Reply-To: <20120808163829.GD2210@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Cc: linux-next@vger.kernel.org

On Wed, 2012-08-08 at 13:38 -0300, Arnaldo Carvalho de Melo wrote: 
> > Ah, it's a fix on top on mine other fix.
> > I'll resend squashed version soon.
> But are you having trouble with the current implementation of hex2u64?
Actually it's a clean up.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
