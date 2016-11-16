From: Joel Fernandes <joelaf@google.com>
Subject: Re: linux-next: build warning after merge of the pstore tree
Date: Tue, 15 Nov 2016 21:19:43 -0800
Message-ID: <CAJWu+opZzur9TD6MjqrWBLOr-T1TT28SxSEanwbEiQCerBXk8w@mail.gmail.com>
References: <20161116112749.061f7424@canb.auug.org.au> <CAGXu5jJoCHwtV7y_xqN-y4FKPATfNJjTPp0_T0CyBWK21rj0Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jJoCHwtV7y_xqN-y4FKPATfNJjTPp0_T0CyBWK21rj0Kw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Nov 15, 2016 at 4:35 PM, Kees Cook <keescook@chromium.org> wrote:
> On Tue, Nov 15, 2016 at 4:27 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Kees,
>>
>> After merging the pstore tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>>
>> In file included from include/linux/rcupdate.h:38:0,
>>                  from include/linux/idr.h:18,
>>                  from include/linux/kernfs.h:14,
>>                  from include/linux/sysfs.h:15,
>>                  from include/linux/kobject.h:21,
>>                  from include/linux/device.h:17,
>>                  from fs/pstore/ram_core.c:17:
>> fs/pstore/ram_core.c: In function 'buffer_size_add':
>> include/linux/spinlock.h:246:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>    _raw_spin_unlock_irqrestore(lock, flags); \
>>    ^
>> fs/pstore/ram_core.c:78:16: note: 'flags' was declared here
>>   unsigned long flags;
>>                 ^
>> In file included from include/linux/rcupdate.h:38:0,
>>                  from include/linux/idr.h:18,
>>                  from include/linux/kernfs.h:14,
>>                  from include/linux/sysfs.h:15,
>>                  from include/linux/kobject.h:21,
>>                  from include/linux/device.h:17,
>>                  from fs/pstore/ram_core.c:17:
>> fs/pstore/ram_core.c: In function 'buffer_start_add':
>> include/linux/spinlock.h:246:3: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>    _raw_spin_unlock_irqrestore(lock, flags); \
>>    ^
>> fs/pstore/ram_core.c:56:16: note: 'flags' was declared here
>>   unsigned long flags;
>>                 ^
>>
>> Introduced by commit
>>
>>   95937ddce59a ("pstore: Allow prz to control need for locking")
>>
>> They appear to be a very noisy false positives. :-(
>
> Hah. Ironically, I ran sparse against this code to make sure it would
> be happy with the conditional locking, and totally missed the flags
> bit. I'll switch it to explicitly initialize flags to silence this.
>

Ah! False positive.

Thanks a lot Kees for fixing it.

Regards,
Joel
