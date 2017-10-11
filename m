From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Oct 9th (drivers/dma/stm32-mdma.c)
Date: Wed, 11 Oct 2017 09:19:59 -0700
Message-ID: <ad2ff849-ea08-a384-b809-df2404116591@infradead.org>
References: <20171009212122.wx4lgnecmqyzuywq@sirena.co.uk>
 <a86da771-5abc-acc9-cc2e-c31984fba659@infradead.org>
 <20171011125528.GI30097@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171011125528.GI30097@localhost>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Mark Brown <broonie@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pierre-Yves Mordret <pierre-yves.mordret@st.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 10/11/17 05:55, Vinod Koul wrote:
> On Tue, Oct 10, 2017 at 09:27:18AM -0700, Randy Dunlap wrote:
>> On 10/09/17 14:21, Mark Brown wrote:
>>> For my birthday I've gone and got myself a linux-next tree:
> 
> Nice thing you chose to do for the day :D
> 
>>>
>>> Changes since 20170929:
>>>
>>
>> on i386:
>>
>> drivers/dma/stm32-mdma.o: In function `stm32_mdma_prep_dma_memcpy':
>> stm32-mdma.c:(.text+0x1174): undefined reference to `__umoddi3'
>> stm32-mdma.c:(.text+0x1208): undefined reference to `__umoddi3'
>> stm32-mdma.c:(.text+0x134c): undefined reference to `__umoddi3'
>> stm32-mdma.c:(.text+0x141d): undefined reference to `__umoddi3'
> 
> The driver uses DIV_ROUND_UP but this should have worked, let me check more.
> Was generic i386 defconfig used or some other config

Maybe look at the uses of '%' (modulus, as in __umoddi3).

-- 
~Randy
