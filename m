From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the staging tree
Date: Tue, 16 Jan 2018 11:47:47 +0100
Message-ID: <CAK8P3a1VeGAe5tE5rRcVT=VzoNidVVFvdNkMuZyGq9nqhRkZpA@mail.gmail.com>
References: <20180116134544.5f999209@canb.auug.org.au> <20180116055901.GA20154@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180116055901.GA20154@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jan 16, 2018 at 6:59 AM, Greg KH <greg@kroah.com> wrote:
> On Tue, Jan 16, 2018 at 01:45:44PM +1100, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> After merging the staging tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>>
>> drivers/staging/lustre/lnet/selftest/module.c: In function 'lnet_selftest_init':
>> drivers/staging/lustre/lnet/selftest/module.c:98:10: warning: 'rc' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>    return rc;
>>           ^~
>>
>> Introduced by commit
>>
>>   6106c0f82481 ("staging: lustre: lnet: convert selftest to use workqueues")
>
> Yeah, I told Neil about this, hopefully he sends me a fix soon :)

I sent a fix for that one, but now ran into another problem that I can't
easily figure out:

drivers/staging/lustre/lnet/selftest/module.c: In function 'lnet_selftest_init':
drivers/staging/lustre/lnet/selftest/module.c:128:49: error: 'struct
cfs_cpt_table' has no member named 'ctb_parts'; did you mean
'ctb_nparts'?
   cpumask_copy(attrs.cpumask, lnet_cpt_table()->ctb_parts[i].cpt_cpumask);

I see that there are two definitions of 'struct cfs_cpt_table', and only
one of them has a ctb_parts member, but I don't know what this means
for its users.

The build regression also comes from commit 6106c0f82481 ("staging:
lustre: lnet: convert selftest to use workqueues"), and I see that all
other references to ctb_parts are in
drivers/staging/lustre/lnet/libcfs/linux/linux-cpu.c.

         Arnd
