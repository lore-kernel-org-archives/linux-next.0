From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 20 -- Kernel panic - Unable to mount
 root fs
Date: Wed, 21 Jan 2015 08:21:29 -0800
Message-ID: <54BFD209.1080507@roeck-us.net>
References: <20150120165655.GA10904@kria> <20150121110539.GA8924@kria> <20150121144214.GA22884@ulmo.nvidia.com> <9422577.FVVyjQBZjy@sifl> <20150121153910.GD22884@ulmo.nvidia.com> <20150121155407.GA18701@kria>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20150121155407.GA18701@kria>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Sabrina Dubroca <sd@queasysnail.net>, Paul Moore <pmoore@redhat.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-audit@redhat.com, Richard Guy Briggs <rgb@redhat.com>
List-Id: linux-next.vger.kernel.org

On 01/21/2015 07:54 AM, Sabrina Dubroca wrote:
> 2015-01-21, 16:39:12 +0100, Thierry Reding wrote:
>> On Wed, Jan 21, 2015 at 10:24:11AM -0500, Paul Moore wrote:
>>> On Wednesday, January 21, 2015 03:42:16 PM Thierry Reding wrote:
>>>> On Wed, Jan 21, 2015 at 12:05:39PM +0100, Sabrina Dubroca wrote:
>>>>> 2015-01-21, 04:36:38 +0000, Al Viro wrote:
>>>>>> On Tue, Jan 20, 2015 at 08:01:26PM -0800, Guenter Roeck wrote:
>>>>>>> With this patch:
>>>>>>>
>>>>>>> sys_mkdir .:40775 returned -17
>>>>>>> sys_mkdir usr:40775 returned 0
>>>>>>> sys_mkdir usr/lib:40775 returned 0
>>>>>>> sys_mkdir usr/share:40755 returned 0
>>>>>>> sys_mkdir usr/share/udhcpc:40755 returned 0
>>>>>>> sys_mkdir usr/bin:40775 returned 0
>>>>>>> sys_mkdir usr/sbin:40775 returned 0
>>>>>>> sys_mkdir mnt:40775 returned 0
>>>>>>> sys_mkdir proc:40775 returned 0
>>>>>>> sys_mkdir root:40775 returned 0
>>>>>>> sys_mkdir lib:40775 returned 0
>>>>>>> sys_mkdir lib/modules:40775 returned 0
>>>>>>> ...
>>>>>>>
>>>>>>> and the problem is fixed.
>>>>>
>>>>> This patch also works for me.
>>>>>
>>>>>> ... except that it simply confirms that something's fishy with
>>>>>> getname_kernel() of ->name of struct filename returned by getname().
>>>>>> IOW, I still do not understand the mechanism of breakage there.
>>>>>
>>>>> I'm not so sure about that.  I tried to copy name to a new string in
>>>>> do_path_lookup and that didn't help.
>>>>>
>>>>> Now, I've removed the
>>>>>
>>>>>          putname(filename);
>>>>>
>>>>> line from do_path_lookup and I don't get the panic.
>>>>
>>>> That would indicate that somehow the refcount got unbalanced. Looking
>>>> more closely it seems like the various audit_*() function do take a
>>>> reference, but maybe that's not enough.
>>>
>>> I'm thinking the same thing and I think the problem may be that
>>> __audit_reusename() is not bumping the filename->refcnt.  Can someone who is
>>> seeing this problem bump the refcnt in __audit_reusename()?
>>>
>>>    struct filename *
>>>    __audit_reusename(const __user char *uptr)
>>>    {
>>>          struct audit_context *context = current->audit_context;
>>>          struct audit_names *n;
>>>
>>>          list_for_each_entry(n, &context->names_list, list) {
>>>                  if (!n->name)
>>>                          continue;
>>>                  if (n->name->uptr == uptr) {
>>> +                       n->name->refcnt++;
>>>                          return n->name;
>>>                  }
>>>          }
>>>          return NULL;
>>>    }
>>
>> That doesn't seem to help, at least in my case.
>
> Same here.
>
> Well, it's probably not an audit issue.  I tried audit=0 on the
> commandline, and I just rebuilt a kernel with CONFIG_AUDIT=n, and it's
> still panicing.  This should have fixed any audit-related issue,
> right?
>
I don't have audit enabled, so I don't think that is the problem either
(the refcount increase didn't help, and a WARN(1) added to the code
at the same location did not trigger).

Wonder if we have a use-after-free case and just have been lucky all along.

Guenter

