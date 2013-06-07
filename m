From: Peng Tao <bergwolf@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Fri, 7 Jun 2013 16:11:17 +0800
Message-ID: <CA+a=Yy5cHJ1wEK+DrmptN6iUBu_KH7eABNe7pFqTKRyBiadQ1g@mail.gmail.com>
References: <20130607162830.9d7ce277a9eda2b54fe73e92@canb.auug.org.au>
 <CA+a=Yy7BOcCXjZnbiZArWf=JCeSyp7k=J4DaBhQYQjy2ASgGkw@mail.gmail.com> <20130607175244.95368825087acdfb25a2a8eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130607175244.95368825087acdfb25a2a8eb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Chinner <dchinner@redhat.com>, Glauber Costa <glommer@openvz.org>, Greg KH <greg@kroah.com>, "Dilger, Andreas" <andreas.dilger@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 7, 2013 at 3:52 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi,
>
> On Fri, 7 Jun 2013 15:26:56 +0800 Peng Tao <bergwolf@gmail.com> wrote:
>>
>> On Fri, Jun 7, 2013 at 2:28 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >
>> > After merging the akpm tree, today's linux-next build (x86_64
>> > allmodconfig) failed like this:
>> >
>> > In file included from drivers/staging/lustre/include/linux/libcfs/linux/libcfs.h:49:0,
>> >                  from drivers/staging/lustre/include/linux/libcfs/libcfs.h:44,
>> >                  from drivers/staging/lustre/include/linux/lnet/linux/lib-lnet.h:45,
>> >                  from drivers/staging/lustre/include/linux/lnet/lib-lnet.h:44,
>> >                  from drivers/staging/lustre/lnet/lnet/api-ni.c:38:
>> > drivers/staging/lustre/include/linux/libcfs/linux/linux-mem.h: In function 'set_shrinker':
>> > drivers/staging/lustre/include/linux/libcfs/linux/linux-mem.h:102:3: error: 'struct shrinker' has no member named 'shrink'
>> >   s->shrink = func;
>> >    ^
>> >
>> > Caused by commit a37f14f05f2f ("shrinker: Kill old ->shrink API") from
>> > the akpm tree interacting with the new Lustre client code from the
>> > staging tree.
>> >
>> > I have just disabled the Lustre client code again (by reverting commit
>> > ee04fd11f11f ("Revert "Revert "staging/lustre: drop CONFIG_BROKEN
>> > dependency""")) and maybe someone can tell me what I need to do to fix
>> > this when I get back in a week.
>> I have a patchset to fix this but haven't yet sent out because it will
>> break build in Greg's staging tree. I can send it now but please tell
>> me to whom I should send the patches? Greg's tree doesn't contain
>> shrinker change, and mm- tree doesn't have Lustre code.
>
> The mm- tree now has the lustre code since it it based on most of
> linux-next, so send them to Andrew.
>
> It will then be up to Andrew and Greg to make sure that the staging tree
> is merged into Linus' tree before Andrew's patch bomb.
I see. Thanks. I will send them to Andrew then.

--
Thanks,
Tao
