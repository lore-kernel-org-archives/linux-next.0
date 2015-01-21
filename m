From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 20 -- Kernel panic - Unable to mount
 root fs
Date: Wed, 21 Jan 2015 09:51:15 -0800
Message-ID: <54BFE713.20807@roeck-us.net>
References: <20150120165655.GA10904@kria> <20150121153910.GD22884@ulmo.nvidia.com> <20150121155407.GA18701@kria> <6942214.D1ODllqz3j@sifl> <20150121173810.GP29656@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20150121173810.GP29656@ZenIV.linux.org.uk>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Paul Moore <pmoore@redhat.com>
Cc: Sabrina Dubroca <sd@queasysnail.net>, Thierry Reding <thierry.reding@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-audit@redhat.com, Richard Guy Briggs <rgb@redhat.com>
List-Id: linux-next.vger.kernel.org

On 01/21/2015 09:38 AM, Al Viro wrote:
> On Wed, Jan 21, 2015 at 11:16:23AM -0500, Paul Moore wrote:
>> On Wednesday, January 21, 2015 04:54:07 PM Sabrina Dubroca wrote:
>>> 2015-01-21, 16:39:12 +0100, Thierry Reding wrote:
>>>> That doesn't seem to help, at least in my case.
>>>
>>> Same here.
>>
>> Okay, thanks for trying.  Sorry that didn't resolve things.
>>
>>> Well, it's probably not an audit issue.  I tried audit=0 on the
>>> commandline, and I just rebuilt a kernel with CONFIG_AUDIT=n, and it's
>>> still panicing.  This should have fixed any audit-related issue,
>>> right?
>>
>> Most likely.  Back to the code I go ...
>
> FWIW, I really wonder if populate_rootfs() (run ultimately from
> kernel_init(), by way of kernel_init_freeable(), do_basic_setup() and
> do_initcalls()) ends up with some side effects as far as struct filename
> are concerned...
>
> Note that if we _ever_ hit reuse logics there, we are going to get bogus
> matches asoddingplenty - *all* those sys_mkdir(), etc. are going to be
> with filenames in the same reused buffer.  So if anything in there leaks
> from one call to another, we are going to have a mess on hands.
>
> Another place where that can be a problem is devtmpfs - there's a kernel
> thread doing actual mkdir, mknod, etc. in that abomination and if _that_
> ends up accumulating aushit entries, we'll end up with interesting problems.
>
> Folks, could you print the value of audit_dummy_context() in populate_rootfs()
> and in drivers/base/devtmpfs.c:devtmpfsd()?
>
populate_rootfs: audit_dummy_context() returns 1

Guenter

