From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2013-06-05-17-24 uploaded (ptp_pch)
Date: Wed, 05 Jun 2013 21:37:04 -0700
Message-ID: <51B011F0.6050805@infradead.org>
References: <20130606002636.6746F5A41AE@corp2gmr1-2.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:38231 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751950Ab3FFEiI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Jun 2013 00:38:08 -0400
In-Reply-To: <20130606002636.6746F5A41AE@corp2gmr1-2.hot.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On 06/05/13 17:26, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2013-06-05-17-24 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 

on i386:  when CONFIG_PCI is not enabled:

drivers/ptp/ptp_pch.c:710:1: warning: data definition has no type or storage class [enabled by default]
drivers/ptp/ptp_pch.c:710:1: warning: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
drivers/ptp/ptp_pch.c:710:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/ptp/ptp_pch.c:701:26: warning: 'pch_driver' defined but not used [-Wunused-variable]


-- 
~Randy
