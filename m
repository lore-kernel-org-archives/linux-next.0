From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [PATCH -next] staging/fwserial: Fix build breakage when
 !CONFIG_BUG
Date: Tue, 27 Nov 2012 19:56:32 -0500
Message-ID: <1354064192.2703.10.camel@thor>
References: <20121127011738.9ecd7971a7ea2e3d09a9450d@canb.auug.org.au>
		 <50B3D767.70604@infradead.org> <1354000267.3284.4.camel@thor>
	 <50B50985.1010700@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout39.mail01.mtsvc.net ([216.70.64.83]:58991 "EHLO
	n12.mail01.mtsvc.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754681Ab2K1A4p (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Nov 2012 19:56:45 -0500
In-Reply-To: <50B50985.1010700@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Andrew Morton <akpm@linux-foundation.org>

On Tue, 2012-11-27 at 10:42 -0800, Randy Dunlap wrote:
> On 11/26/2012 11:11 PM, Peter Hurley wrote:
> 
> > Use WARN() as intended.
> > 
> > Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
> 
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks.

Hi Randy,

I blew this, sorry.

First, I mistakenly sent the patch to Stephen rather than to Greg KH,
who's carrying this submission in staging-next. So I forwarded Greg the
patch when I realized my error. Which he committed. And Greg couldn't
catch my mistake because he didn't see the original chain. Then I got
your reminder email.

I won't let it happen again.
Peter
