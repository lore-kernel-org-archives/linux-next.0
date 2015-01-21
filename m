From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 20 -- Kernel panic - Unable to mount
 root fs
Date: Tue, 20 Jan 2015 20:01:26 -0800
Message-ID: <54BF2496.4000807@roeck-us.net>
References: <20150120165655.GA10904@kria> <20150120232726.GA16913@kria> <1517211.UYLV49hvpg@sifl> <1528536.jyty2pu4Mz@sifl> <20150121004117.GM29656@ZenIV.linux.org.uk> <54BF1292.2080902@roeck-us.net> <20150121033600.GN29656@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150121033600.GN29656@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Paul Moore <pmoore@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-audit@redhat.com, Richard Guy Briggs <rgb@redhat.com>
List-Id: linux-next.vger.kernel.org

On 01/20/2015 07:36 PM, Al Viro wrote:
> On Tue, Jan 20, 2015 at 06:44:34PM -0800, Guenter Roeck wrote:
>>> The shit hits the fan earlier - when we end up missing /dev.  There are
>>> two places where it could've been created (depending on CONFIG_BLK_DEV_INITRD);
>>> 	sys_mkdir(collected, mode);
>>> in init/initramfs.c (line 353 in linux-next) and
>>>          err = sys_mkdir((const char __user __force *) "/dev", 0755);
>>> in init/noinitramfs.c (line 32).  The latter would've screamed on failure;
>>> could you printk of collected (%s), mode (%o) and return value (%d) in the
>>> former and see what happens?
>>>
>>
>> sys_mkdir .:40775 returned -17
>> sys_mkdir usr:40775 returned 0
>> sys_mkdir usr/lib:40775 returned -2
>> sys_mkdir usr/share:40755 returned -2
>> sys_mkdir usr/share/udhcpc:40755 returned -2
>> sys_mkdir usr/bin:40775 returned -2
>> sys_mkdir usr/sbin:40775 returned -2
>> sys_mkdir mnt:40775 returned 0
>> sys_mkdir proc:40775 returned 0
>> sys_mkdir root:40775 returned 0
>> sys_mkdir lib:40775 returned 0
>> sys_mkdir lib/modules:40775 returned -2
>> sys_mkdir lib/modules/3.9.2:40775 returned -2
>> sys_mkdir lib/modules/3.9.2/kernel:40775 returned -2
>>
>> with
>> 	int err = sys_mkdir(collected, mode);
>> 	pr_info("sys_mkdir %s:%o returned %d\n", collected, mode, err);
>> added in init/initramfs.c.
>
> Just what is lib/modules/3.9.2 doing there?  In any case, I think I have at

Artifact from when I created the root file system (which apparently was with
3.9.2). It is irrelevant for my testing, at least so far, so I never
bothered fixing it.

> least a plausible direction for digging.  Look:
>

> diff --git a/fs/namei.c b/fs/namei.c
> index 323957f..c7d107c 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c

With this patch:

sys_mkdir .:40775 returned -17
sys_mkdir usr:40775 returned 0
sys_mkdir usr/lib:40775 returned 0
sys_mkdir usr/share:40755 returned 0
sys_mkdir usr/share/udhcpc:40755 returned 0
sys_mkdir usr/bin:40775 returned 0
sys_mkdir usr/sbin:40775 returned 0
sys_mkdir mnt:40775 returned 0
sys_mkdir proc:40775 returned 0
sys_mkdir root:40775 returned 0
sys_mkdir lib:40775 returned 0
sys_mkdir lib/modules:40775 returned 0
...

and the problem is fixed.

Guenter
