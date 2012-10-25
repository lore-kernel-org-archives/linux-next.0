From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: mmotm 2012-10-24-17-15 uploaded (uml)
Date: Wed, 24 Oct 2012 18:17:59 -0700
Message-ID: <50889347.4070801@xenotime.net>
References: <20121025001628.1DEDE100047@wpzn3.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:57715 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1758890Ab2JYBSC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 24 Oct 2012 21:18:02 -0400
In-Reply-To: <20121025001628.1DEDE100047@wpzn3.hot.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-next@vger.kernel.org

On 10/24/2012 05:16 PM, akpm@linux-foundation.org wrote:

> The mm-of-the-moment snapshot 2012-10-24-17-15 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 


uml on x86_64 defconfig:

arch/um/drivers/chan_kern.c: In function 'tty_receive_char':
arch/um/drivers/chan_kern.c:89:42: error: 'struct tty_struct' has no member named 'raw'

-- 
~Randy
