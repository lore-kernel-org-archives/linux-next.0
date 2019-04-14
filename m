From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: linux-next: Tree for Apr 8 (iio/adc/)
Date: Sun, 14 Apr 2019 13:30:59 +0100
Message-ID: <20190414133059.4e25a574@archlinux>
References: <20190408154140.515139e3@canb.auug.org.au>
        <47db3c7b-eb05-c4cd-ed03-f03e6754d5f8@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <47db3c7b-eb05-c4cd-ed03-f03e6754d5f8@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-iio@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: linux-next.vger.kernel.org

On Mon, 8 Apr 2019 09:09:37 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 4/7/19 10:41 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20190405:
> >   
> 
> on i386 or x86_64:
> 
> modular:
> ERROR: "is_stm32_timer_trigger" [drivers/iio/adc/stm32-dfsdm-adc.ko] undefined!
> 
> or builtin:
> ld: drivers/iio/adc/stm32-dfsdm-adc.o: in function `stm32_dfsdm_postenable':
> stm32-dfsdm-adc.c:(.text+0x878): undefined reference to `is_stm32_timer_trigger'
> 
> 
> Full i386 randconfig file is attached.
> 
Thanks Randy.

So two possible fixes for this one.  We can do what is done for the
stm32-adc driver and select IIO_STM_TIMER_TRIGGER or we can add a stub
for this function in the header to make it return false if that
driver isn't built.

I personally favour the stub option but would like Fabrice to say what
makes more sense.

So Fabrice, which of the above? If you are busy and don't get back
in the next day or two, I'll add the stub.

Thanks,

Jonathan
