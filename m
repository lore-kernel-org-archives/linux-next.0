From: Antti Palosaari <crope@iki.fi>
Subject: Re: linux-next: build warning in Linus' tree
Date: Tue, 06 Nov 2012 00:36:12 +0200
Message-ID: <50983F5C.3000107@iki.fi>
References: <20121024134333.baf0c90a323a831675ed7e79@canb.auug.org.au> <20121028174423.45b67cab@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kapsi.fi ([217.30.184.167]:60508 "EHLO mail.kapsi.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932348Ab2KEWgq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Nov 2012 17:36:46 -0500
In-Reply-To: <20121028174423.45b67cab@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/28/2012 09:44 PM, Mauro Carvalho Chehab wrote:
> Em Wed, 24 Oct 2012 13:43:33 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> escreveu:
>
>> Hi Mauro,
>>
>> After merging the origin tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>>
>> drivers/media/usb/dvb-usb-v2/dvb_usb_core.c: In function 'dvb_usb_ctrl_feed':
>> drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:291:12: warning: 'ret' may be used uninitialized in this function [-Wuninitialized]
>>
>> Which points out some badly formatted and blocked code ...
>>
>> Probably introduced by commit 62a5f449cab5 ("[media] dvb_usb_v2: refactor
>> dvb_usb_ctrl_feed() logic").
>
>
> Hi Stephen,
>
> Thanks for pointing it. It took me some time, but I applied today
> a bunch of patches that are fixing all warnings on everything
> at drivers/media and drivers/staging/media, with:
> 	make ARCH=i386 W=1
> (allyesconfig, gcc 4.7.2)
>
> Maybe there are still a few ones with random configs and other
> archs, but at least on my usual testing environment, we're
> warnings-free on drivers/media for now, probably up to the
> next gcc version.

Sorry for the delay, I was on holiday trip.

hmmm, yes there seems to be something stupid, like missing block braces. 
I will check that during this week and fix properly if Mauro didn't 
already fixed it.

regards
Antti

-- 
http://palosaari.fi/
