From: Andreas Ruprecht <rupran@einserver.de>
Subject: Re: [PATCH] media: pci: smipcie: Fix dependency for DVB_SMIPCIE
Date: Fri, 21 Nov 2014 19:15:06 +0100
Message-ID: <546F812A.1000103@einserver.de>
References: <1416592319-23644-1-git-send-email-rupran@einserver.de> <20141121161316.23963dc5@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141121161316.23963dc5@recife.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au
List-Id: linux-next.vger.kernel.org

On 21.11.2014 19:13, Mauro Carvalho Chehab wrote:
> Em Fri, 21 Nov 2014 18:51:59 +0100
> Andreas Ruprecht <rupran@einserver.de> escreveu:
> 
>> In smipcie.c, the function i2c_bit_add_bus() is called. This
>> function is defined by the I2C bit-banging interfaces enabled
>> with CONFIG_I2C_ALGOBIT.
>>
>> As there was no dependency in Kconfig, CONFIG_I2C_ALGOBIT could
>> be set to "m" while CONFIG_DVB_SMIPCIE was set to "y", resulting
>> in a build error due to an undefined reference. This patch adds
>> the dependency on CONFIG_I2C_ALGOBIT in Kconfig.
>>
>> Signed-off-by: Andreas Ruprecht <rupran@einserver.de>
>> Reported-by: Jim Davis <jim.epost@gmail.com>
>> ---
>>  drivers/media/pci/smipcie/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/pci/smipcie/Kconfig b/drivers/media/pci/smipcie/Kconfig
>> index 75a2992..c728721 100644
>> --- a/drivers/media/pci/smipcie/Kconfig
>> +++ b/drivers/media/pci/smipcie/Kconfig
>> @@ -1,6 +1,6 @@
>>  config DVB_SMIPCIE
>>  	tristate "SMI PCIe DVBSky cards"
>> -	depends on DVB_CORE && PCI && I2C
>> +	depends on DVB_CORE && PCI && I2C && I2C_ALGOBIT
> 
> IMHO, the best would be, instead, to select I2C_ALGOBIT.

Okay, I'll change that and submit a new version of this patch.

Regards,

Andreas Ruprecht
