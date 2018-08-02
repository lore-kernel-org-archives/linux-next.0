From: Chao Yu <yuchao0@huawei.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Thu, 2 Aug 2018 14:12:15 +0800
Message-ID: <fb9fb971-c607-c93e-d16f-16534edb8224@huawei.com>
References: <20180730161622.3837cb15@canb.auug.org.au>
 <559c49b8-9d58-e242-20c2-fe1b491664dd@huawei.com>
 <7152b6ba-9ad6-4a9c-3b13-2d5310266ccd@huawei.com>
 <20180802010705.24a72730@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802010705.24a72730@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Gao Xiang <gaoxiang25@huawei.com>, Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Miao Xie <miaoxie@huawei.com>, Linus <torvalds@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Sorry, yesterday I missed this email due to my email filter.

On 2018/8/1 23:07, Stephen Rothwell wrote:
> Hi Chao,
> 
> On Wed, 1 Aug 2018 17:09:13 +0800 Chao Yu <yuchao0@huawei.com> wrote:
>>
>> Xiang has submitted several patches as below to fix compiling error on -next
>> tree, could you consider to merge those temporary fixes into -next after merging
>> staging-next's updates, and reenable CONFIG_EROFS_FS for further integrity
>> compiling and test?
>>
>> staging: erofs: fix superblock/inode flags (MS_RDONLY -> SB_RDONLY, S_NOATIME)
>> https://lists.ozlabs.org/pipermail/linux-erofs/2018-July/000282.html
>>
>> staging: erofs: remove RADIX_TREE_EXCEPTIONAL_{ENTRY, SHIFT}
>> https://lists.ozlabs.org/pipermail/linux-erofs/2018-July/000283.html
>>
>> staging: erofs: update .mount and .remount_sb
>> https://lists.ozlabs.org/pipermail/linux-erofs/2018-July/000285.html
> 
> OK, I will apply those tomorrow (actually later today :-)) and and stop
> disabling CONFIG_EROFS_FS.

OK, thanks for doing that, I and Xiang will keep an eye on compile result.

> 
>> BTW, for this condition that erofs was not covered by some common vfs
>> stuff changes in other one's tree, who should take care of those
>> missing fixes during coming next merge window?
> 
> It might be easiest for Greg to add the disabling CONFIG_EROFS_FS patch
> to the staging tree itself for his first pull request during the merge
> window and then send a second pull request (after the vfs and maybe the
> Xarray stuff has been merged by Linus) with these patches followed by a
> revert of the disabling patch.

Thanks for the advice, I think that's a good way to solve the issue, let me send
a patch to disable erofs compiling temporarily to avoid conflict during merge
window. :)

Thanks,

> 
