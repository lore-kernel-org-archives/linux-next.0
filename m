From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [patch v2] sound/soc/codecs : fix build failure for next-20130325
Date: Wed, 27 Mar 2013 11:30:43 -0700
Message-ID: <51533AD3.9040809@infradead.org>
References: <alpine.DEB.2.02.1303272127400.26487@M2420> <20130327133915.GU18316@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130327133915.GU18316@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Xiong Zhou <jencce.kernel@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On 03/27/13 06:39, Mark Brown wrote:
> On Wed, Mar 27, 2013 at 09:31:33PM +0800, Xiong Zhou wrote:
> 
>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
>> index 18fea10..f38af70 100644
>> --- a/sound/soc/codecs/Kconfig
>> +++ b/sound/soc/codecs/Kconfig
>> @@ -79,7 +79,6 @@ config SND_SOC_ALL_CODECS
>>  	select SND_SOC_WM0010 if SPI_MASTER
>>  	select SND_SOC_WM1250_EV1 if I2C
>>  	select SND_SOC_WM2000 if I2C
>> -	select SND_SOC_WM2200 if I2C
>>  	select SND_SOC_WM5100 if I2C
>>  	select SND_SOC_WM5102 if MFD_WM5102
>>  	select SND_SOC_WM5110 if MFD_WM5110
>> @@ -370,6 +369,7 @@ config SND_SOC_WM2000
>>  	tristate
>>  
>>  config SND_SOC_WM2200
>> +	depends on SND_SOC_ARIZONA && I2C
>>  	tristate
> 
> I really don't understand this at all, removing something from
> ALL_CODECS is not a good idea.  This isn't a Kconfig issue.
> 

Hi Mark,

Do you have a suggestion for a kernel config where SND_SOC_ARIZONA
is not enabled but SND_SOC_WM_ADSP is enabled, which causes a build
error in linux-next?

thanks,
-- 
~Randy
