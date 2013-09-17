From: Antti Palosaari <crope@iki.fi>
Subject: Re: randconfig build error with next-20130917, in drivers/staging/media/msi3101
Date: Tue, 17 Sep 2013 20:13:29 +0300
Message-ID: <52388DB9.9020406@iki.fi>
References: <CA+r1Zhig6Xc_-jw=nGqd18j0MfTbpLRZoVYYtFZ2wY5LUp6J5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kapsi.fi ([217.30.184.167]:40272 "EHLO mail.kapsi.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752884Ab3IQROQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Sep 2013 13:14:16 -0400
In-Reply-To: <CA+r1Zhig6Xc_-jw=nGqd18j0MfTbpLRZoVYYtFZ2wY5LUp6J5w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <m.chehab@samsung.com>

Hello Jim,

That is maybe 5th times I got that same bug report :-] It is already 
fixed. Mauro tends to handle pending patches once per release candidate, 
so I think fix will be in next very soon (during this week).

https://patchwork.kernel.org/patch/2856771/
https://lkml.org/lkml/2013/9/12/824

regards
Antti


On 09/17/2013 08:05 PM, Jim Davis wrote:
> Building with the attached random configuration file,
>
>    LD      init/built-in.o
> drivers/built-in.o: In function `msi3101_probe':
> /home/jim/linux-randbuild/2/drivers/staging/media/msi3101/sdr-msi3101.c:1847:
> undefined reference to `vb2_vmalloc_memops'
> make: *** [vmlinux] Error 1
>


-- 
http://palosaari.fi/
