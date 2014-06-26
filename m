From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 26 (crypto/qat)
Date: Thu, 26 Jun 2014 08:05:28 -0700
Message-ID: <53AC36B8.8000303@infradead.org>
References: <20140626164130.4d01a3b2@canb.auug.org.au> <53AC366C.5030504@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53AC366C.5030504@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, qat-linux@intel.com
List-Id: linux-next.vger.kernel.org

On 06/26/14 08:04, Randy Dunlap wrote:
> On 06/25/14 23:41, Stephen Rothwell wrote:
>> Hi all,
>>
>> The powerpc allyesconfig is again broken more than usual.
>>
>> Changes since 20140625:
>>
> 
> on x86_64:
> 
>   CC      drivers/crypto/qat/qat_dh895xcc/adf_dh895xcc_hw_data.o
> ../drivers/crypto/qat/qat_dh895xcc/adf_dh895xcc_hw_data.c: In function 'adf_enable_error_correction':
> ../drivers/crypto/qat/qat_dh895xcc/adf_dh895xcc_hw_data.c:166:3: error: implicit declaration of function '__raw_readl' [-Werror=implicit-function-declaration]
> ../drivers/crypto/qat/qat_dh895xcc/adf_dh895xcc_hw_data.c:168:3: error: implicit declaration of function '__raw_writel' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors
> make[5]: *** [drivers/crypto/qat/qat_dh895xcc/adf_dh895xcc_hw_data.o] Error 1
> 
> 
> 

Sorry, I missed another one:
../drivers/crypto/qat/qat_dh895xcc/adf_hw_arbiter.c:100:3: error: implicit declaration of function '__raw_writel' [-Werror=implicit-function-declaration]


-- 
~Randy
