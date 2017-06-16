From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Thu, 15 Jun 2017 20:20:47 -0700
Message-ID: <CAGXu5j+gcoqVT6sA-_Eu-Nm5P+58FuVfW=yof1ufpXaZeXC8zA@mail.gmail.com>
References: <20170616113032.306720bf@canb.auug.org.au> <1497581467.17727.7.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497581467.17727.7.camel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Micay <danielmicay@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jun 15, 2017 at 7:51 PM, Daniel Micay <danielmicay@gmail.com> wrote:
> On Fri, 2017-06-16 at 11:30 +1000, Stephen Rothwell wrote:
>> Hi Kees,
>>
>> After merging the kspp tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> In file included from include/linux/bitmap.h:8:0,
>>                  from include/linux/cpumask.h:11,
>>                  from arch/x86/include/asm/cpumask.h:4,
>>                  from arch/x86/include/asm/msr.h:10,
>>                  from arch/x86/include/asm/processor.h:20,
>>                  from arch/x86/include/asm/cpufeature.h:4,
>>                  from arch/x86/include/asm/thread_info.h:52,
>>                  from include/linux/thread_info.h:37,
>>                  from arch/x86/include/asm/preempt.h:6,
>>                  from include/linux/preempt.h:80,
>>                  from include/linux/spinlock.h:50,
>>                  from include/linux/mmzone.h:7,
>>                  from include/linux/gfp.h:5,
>>                  from include/linux/slab.h:14,
>>                  from drivers/scsi/csiostor/csio_lnode.c:37:
>> In function 'memcpy',
>>     inlined from 'csio_append_attrib' at
>> drivers/scsi/csiostor/csio_lnode.c:248:2,
>>     inlined from 'csio_ln_fdmi_dprt_cbfn' at
>> drivers/scsi/csiostor/csio_lnode.c:471:2:
>> include/linux/string.h:309:4: error: call to '__read_overflow2'
>> declared with attribute error: detected read beyond size of object
>> passed as 2nd parameter
>>     __read_overflow2();
>>     ^
>> In function 'memcpy',
>>     inlined from 'csio_append_attrib' at
>> drivers/scsi/csiostor/csio_lnode.c:248:2,
>>     inlined from 'csio_ln_fdmi_rhba_cbfn' at
>> drivers/scsi/csiostor/csio_lnode.c:337:2:
>> include/linux/string.h:309:4: error: call to '__read_overflow2'
>> declared with attribute error: detected read beyond size of object
>> passed as 2nd parameter
>>     __read_overflow2();
>>     ^
>>
>> Caused by commit
>>
>>   b90d6eba50d7 ("include/linux/string.h: add the option of fortified
>> string.h functions")
>>
>> I have reverted that commit for today.
>
> That's this one: https://lkml.org/lkml/2017/5/9/613, which is in
> https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/ in the
> 4.13/scsi-queue and for-next branches. I think that's why Kees didn't
> include it but I get he needs to add that.

I'm so confused -- isn't this in next? All the build tests I did were
against yesterday's -next which includes this from what I can see...

-Kees

-- 
Kees Cook
Pixel Security
