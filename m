From: Chris Ball <cjb@laptop.org>
Subject: Re: linux-next: triage for April 18, 2012
Date: Thu, 19 Apr 2012 18:02:46 -0400
Message-ID: <878vhrjs6x.fsf@laptop.org>
References: <20120419020136.GB3443@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from void.printf.net ([89.145.121.20]:48792 "EHLO void.printf.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932281Ab2DSWCh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Apr 2012 18:02:37 -0400
In-Reply-To: <20120419020136.GB3443@windriver.com> (Paul Gortmaker's message
	of "Wed, 18 Apr 2012 22:01:36 -0400")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Magnus Damm <magnus.damm@gmail.com>

Hi,

On Wed, Apr 18 2012, Paul Gortmaker wrote:
> ARM:mackerel_defconfig,ag5evm_defconfig
> 	when:	Apr 19 (possibly earlier?)
> 	why:	pfc-sh7372.c: undefined reference to `mmc_detect_change'
> 	why:	pfc-sh73a0.c: undefined reference to `mmc_detect_change'
> 	status:	
> 	fix:	
> 	ref:	http://kisskb.ellerman.id.au/kisskb/buildresult/6131930/
> 	ref:	http://kisskb.ellerman.id.au/kisskb/buildresult/6131908/

Adding Guennadi and Magnus to CC for this error (which is coming from
tmio_mmc_cd_wakeup).

Thanks,

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
