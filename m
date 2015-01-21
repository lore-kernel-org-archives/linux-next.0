From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 20 -- Kernel panic - Unable to mount
 root fs
Date: Wed, 21 Jan 2015 05:32:13 -0800
Message-ID: <54BFAA5D.4040108@roeck-us.net>
References: <20150120165655.GA10904@kria> <20150120232726.GA16913@kria> <1517211.UYLV49hvpg@sifl> <1528536.jyty2pu4Mz@sifl> <20150121004117.GM29656@ZenIV.linux.org.uk> <54BF1292.2080902@roeck-us.net> <20150121033600.GN29656@ZenIV.linux.org.uk> <54BF2496.4000807@roeck-us.net> <20150121043637.GO29656@ZenIV.linux.org.uk> <20150121110539.GA8924@kria>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20150121110539.GA8924@kria>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Sabrina Dubroca <sd@queasysnail.net>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Paul Moore <pmoore@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-audit@redhat.com, Richard Guy Briggs <rgb@redhat.com>
List-Id: linux-next.vger.kernel.org

On 01/21/2015 03:05 AM, Sabrina Dubroca wrote:
> 2015-01-21, 04:36:38 +0000, Al Viro wrote:
>> On Tue, Jan 20, 2015 at 08:01:26PM -0800, Guenter Roeck wrote:
>>> With this patch:
>>>
>>> sys_mkdir .:40775 returned -17
>>> sys_mkdir usr:40775 returned 0
>>> sys_mkdir usr/lib:40775 returned 0
>>> sys_mkdir usr/share:40755 returned 0
>>> sys_mkdir usr/share/udhcpc:40755 returned 0
>>> sys_mkdir usr/bin:40775 returned 0
>>> sys_mkdir usr/sbin:40775 returned 0
>>> sys_mkdir mnt:40775 returned 0
>>> sys_mkdir proc:40775 returned 0
>>> sys_mkdir root:40775 returned 0
>>> sys_mkdir lib:40775 returned 0
>>> sys_mkdir lib/modules:40775 returned 0
>>> ...
>>>
>>> and the problem is fixed.
>
> This patch also works for me.
>
>
>> ... except that it simply confirms that something's fishy with getname_kernel()
>> of ->name of struct filename returned by getname().  IOW, I still do not
>> understand the mechanism of breakage there.
>
> I'm not so sure about that.  I tried to copy name to a new string in
> do_path_lookup and that didn't help.
>
> Now, I've removed the
>
>          putname(filename);
>
> line from do_path_lookup and I don't get the panic.
>
>
> And BTW, I added Guenter's debugging to init/initramfs.c and got:
> sys_mkdir dev:40755 returned 0
> sys_mkdir root:40700 returned 0
>
> even if it ends up panic'ing.
>
Another data point (though I have no idea if it is useful or what it means):

In the working case, path_init sets nd->flags to 0x50 or 0x51.
In the non-working case (ie for all files with a '/' in the name),
it sets nd->flags to 0x10 or 0x11, even though it is always called
with the LOOKUP_RCU bit set in flags.

Guenter

