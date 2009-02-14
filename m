From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH next] Staging: pohmelfs should depend on CRYPTO
Date: Sat, 14 Feb 2009 14:00:33 +0300
Message-ID: <a4423d670902140300k1aa3f2ccp8961f005cb020723@mail.gmail.com>
References: <20090213150654.GA7390@orion> <20090214102704.GB29771@ioremap.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f21.google.com ([209.85.219.21]:48036 "EHLO
	mail-ew0-f21.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751337AbZBNLAg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 14 Feb 2009 06:00:36 -0500
In-Reply-To: <20090214102704.GB29771@ioremap.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: gregkh@suse.de, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

2009/2/14 Evgeniy Polyakov <zbr@ioremap.net>:
> On Fri, Feb 13, 2009 at 06:06:54PM +0300, Alexander Beregalov (a.beregalov@gmail.com) wrote:
>>
>>
>> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
>
> Doesn't subsystem selection also forces higher level selection, i.e.
> selecing CRYPTO_BLKCIPHER also forces CRYPTO selection? If it is not the
> case, then your patch is definitely valid.
No, it does not. The kernel fails to build if CRYPTO was disabled
before enabling POHMELFS.
>
>> ---
>>
>>  drivers/staging/pohmelfs/Kconfig |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/staging/pohmelfs/Kconfig b/drivers/staging/pohmelfs/Kconfig
>> index f150ecb..4c6276b 100644
>> --- a/drivers/staging/pohmelfs/Kconfig
>> +++ b/drivers/staging/pohmelfs/Kconfig
>> @@ -1,6 +1,7 @@
>>  config POHMELFS
>>       tristate "POHMELFS filesystem support"
>>       select CONNECTOR
>> +     select CRYPTO
>>       select CRYPTO_BLKCIPHER
>>       select CRYPTO_HMAC
>>       help
>
> --
>        Evgeniy Polyakov
>
