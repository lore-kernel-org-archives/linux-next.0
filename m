From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build failure after merge of the hwmon-fixes tree
Date: Wed, 5 Jun 2019 15:50:29 -0700
Message-ID: <20190605225029.GA25183@roeck-us.net>
References: <20190606083034.196219f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190606083034.196219f0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alexander Sverdlin <alexander.sverdlin@nokia.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jun 06, 2019 at 08:30:34AM +1000, Stephen Rothwell wrote:
> Hi Guenter,
> 
> After merging the hwmon-fixes tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
> 
> In file included from include/linux/notifier.h:14,
>                  from arch/x86/include/asm/uprobes.h:13,
>                  from include/linux/uprobes.h:49,
>                  from include/linux/mm_types.h:14,
>                  from include/linux/mmzone.h:21,
>                  from include/linux/gfp.h:6,
>                  from include/linux/xarray.h:14,
>                  from include/linux/radix-tree.h:18,
>                  from include/linux/fs.h:15,
>                  from include/linux/debugfs.h:15,
>                  from drivers/hwmon/pmbus/pmbus_core.c:9:
> drivers/hwmon/pmbus/pmbus_core.c: In function 'pmbus_set_samples':
> drivers/hwmon/pmbus/pmbus_core.c:1975:14: error: 'data' undeclared (first use in this function); did you mean '_data'?
>   mutex_lock(&data->update_lock);
>               ^~~~
> include/linux/mutex.h:166:44: note: in definition of macro 'mutex_lock'
>  #define mutex_lock(lock) mutex_lock_nested(lock, 0)
>                                             ^~~~
> drivers/hwmon/pmbus/pmbus_core.c:1975:14: note: each undeclared identifier is reported only once for each function it appears in
>   mutex_lock(&data->update_lock);
>               ^~~~
> include/linux/mutex.h:166:44: note: in definition of macro 'mutex_lock'
>  #define mutex_lock(lock) mutex_lock_nested(lock, 0)
>                                             ^~~~
> 
> Caused by commit
> 
>   8d719d6f3e97 ("hwmon: (pmbus/core) mutex_lock write in pmbus_set_samples")
> 

Fixed. Thanks for the note, and sorry for the trouble.

Guenter

> I have reverted that commit for today.
> 
> -- 
> Cheers,
> Stephen Rothwell
