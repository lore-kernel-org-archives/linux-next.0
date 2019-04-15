From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: linux-next: Tree for Apr 8 (iio/adc/)
Date: Mon, 15 Apr 2019 15:13:44 +0200
Message-ID: <b28b147f-0f42-3829-ff5a-aeb9ad0cc249@st.com>
References: <20190408154140.515139e3@canb.auug.org.au>
 <47db3c7b-eb05-c4cd-ed03-f03e6754d5f8@infradead.org>
 <20190414133059.4e25a574@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414133059.4e25a574@archlinux>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-iio@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 4/14/19 2:30 PM, Jonathan Cameron wrote:
> On Mon, 8 Apr 2019 09:09:37 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> On 4/7/19 10:41 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20190405:
>>>   
>>
>> on i386 or x86_64:
>>
>> modular:
>> ERROR: "is_stm32_timer_trigger" [drivers/iio/adc/stm32-dfsdm-adc.ko] undefined!
>>
>> or builtin:
>> ld: drivers/iio/adc/stm32-dfsdm-adc.o: in function `stm32_dfsdm_postenable':
>> stm32-dfsdm-adc.c:(.text+0x878): undefined reference to `is_stm32_timer_trigger'
>>
>>
>> Full i386 randconfig file is attached.
>>
> Thanks Randy.
> 
> So two possible fixes for this one.  We can do what is done for the
> stm32-adc driver and select IIO_STM_TIMER_TRIGGER or we can add a stub
> for this function in the header to make it return false if that
> driver isn't built.
> 
> I personally favour the stub option but would like Fabrice to say what
> makes more sense.
> 
> So Fabrice, which of the above? If you are busy and don't get back
> in the next day or two, I'll add the stub.

Hi Jonathan, Randy,

I've posted 3 patches:
- One to fix the current issue, with the stub option [1]. This makes
sense as the STM32 DFSDM can use timer and/or lptimer. I think I'll post
another patch later to remove the select in STM32_ADC config (no longer
needed then... But it's not the subject here, right ?).
- Two other patches to fix other warning/build issues I've seen while
working on the stub option. See [2]:

[1] https://lkml.org/lkml/2019/4/15/223
[2] https://lkml.org/lkml/2019/4/15/437

Sorry for the inconvenience, I should have seen this earlier.

Thanks,
Best Regards,
Fabrice

> 
> Thanks,
> 
> Jonathan
> 
