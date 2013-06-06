From: Ben Hutchings <bhutchings@solarflare.com>
Subject: Re: mmotm 2013-06-05-17-24 uploaded (ptp_pch)
Date: Thu, 6 Jun 2013 20:51:18 +0100
Message-ID: <1370548278.4757.2.camel@bwh-desktop.uk.level5networks.com>
References: <20130606002636.6746F5A41AE@corp2gmr1-2.hot.corp.google.com>
	 <51B011F0.6050805@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from webmail.solarflare.com ([12.187.104.25]:24397 "EHLO
	webmail.solarflare.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751818Ab3FFTvX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Jun 2013 15:51:23 -0400
In-Reply-To: <51B011F0.6050805@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On Wed, 2013-06-05 at 21:37 -0700, Randy Dunlap wrote:
> On 06/05/13 17:26, akpm@linux-foundation.org wrote:
> > The mm-of-the-moment snapshot 2013-06-05-17-24 has been uploaded to
> > 
> >    http://www.ozlabs.org/~akpm/mmotm/
> > 
> > mmotm-readme.txt says
> > 
> > README for mm-of-the-moment:
> > 
> > http://www.ozlabs.org/~akpm/mmotm/
> > 
> 
> on i386:  when CONFIG_PCI is not enabled:
> 
> drivers/ptp/ptp_pch.c:710:1: warning: data definition has no type or storage class [enabled by default]
> drivers/ptp/ptp_pch.c:710:1: warning: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
> drivers/ptp/ptp_pch.c:710:1: warning: parameter names (without types) in function declaration [enabled by default]
> drivers/ptp/ptp_pch.c:701:26: warning: 'pch_driver' defined but not used [-Wunused-variable]

Right, it should depend on CONFIG_PCI.  Previously reported in
<http://thread.gmane.org/gmane.linux.network/270531> but there was then
some confusion about whether it was s390 breakage (which it isn't).

Ben.

-- 
Ben Hutchings, Staff Engineer, Solarflare
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
