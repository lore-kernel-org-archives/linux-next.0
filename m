From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: linux-next: build warning after merge of the wireless-drivers-next tree
Date: Wed, 20 Jul 2016 21:41:49 +0300
Message-ID: <87oa5sqhhu.fsf@kamboji.qca.qualcomm.com>
References: <20160720122503.09a46d7b@canb.auug.org.au>
	<8665E2433BC68541A24DFFCA87B70F5B3616184A@DFRE01.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8665E2433BC68541A24DFFCA87B70F5B3616184A-1tpBd5JUCm6IQmiDNMet8wC/G2K4zDHf@public.gmane.org>
	(Eyal Reizer's message of "Wed, 20 Jul 2016 06:18:00 +0000")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Reizer, Eyal" <eyalr-l0cyMroinI0@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, "linux-wireless@vger.kernel.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-next@vger.kernel.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

"Reizer, Eyal" <eyalr-l0cyMroinI0@public.gmane.org> writes:

>> After merging the wireless-drivers-next tree, today's linux-next build
>> (x86_64 allmodconfig) produced this warning:
>> 
>> drivers/net/wireless/ti/wlcore/spi.c: In function 'wlcore_probe_of':
>> drivers/net/wireless/ti/wlcore/spi.c:457:6: warning: unused variable 'ret' [-
>> Wunused-variable]
>>   int ret;
>>       ^
>> 
>> Introduced by commit
>> 
>>   01efe65aba65 ("wlcore: spi: add wl18xx support")
>
> Of course you are right. It is indeed redundant now. Don't know how I
>have missed it. Don't remember seeing a warning from the tool chain I
>have used. Anyway ,will submit an amended patch soon.
 
I didn't notice it either as I didn't have CONFIG_WLCORE_SPI enabled.
But what's odd is that kbuild didn't report anything, it's usually quite
good to catch warnings like this.

Anyway, I have pushed the fix to wireless-drivers-next:

cb6a11518850 wlcore: spi: fix build warning caused by redundant variable

-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
