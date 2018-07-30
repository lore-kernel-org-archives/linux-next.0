From: Gao Xiang <gaoxiang25@huawei.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Mon, 30 Jul 2018 19:23:56 +0800
Message-ID: <c43607d8-7dd5-030c-8036-208295c2aef0@huawei.com>
References: <b4645de1-a58f-7615-4f47-7a3fd8c7e056@huawei.com>
 <559c49b8-9d58-e242-20c2-fe1b491664dd@huawei.com>
 <20180730161622.3837cb15@canb.auug.org.au>
 <2379.1532944057@warthog.procyon.org.uk>
 <15567.1532949496@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <15567.1532949496@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miao Xie <miaoxie@huawei.com>, Chao Yu <yuchao0@huawei.com>
List-Id: linux-next.vger.kernel.org



On 2018/7/30 19:18, David Howells wrote:
> Gao Xiang <gaoxiang25@huawei.com> wrote:
> 
>> struct erofs_mount_private priv = {
>> 	.dev_name = dev_name,
>> 	.options = data
>> };
>> return mount_bdev(fs_type, flags, dev_name, &priv, erofs_fill_super);
>>
>>
>> However, I have no idea if it is safe to do so in the future, so I also
>> change it into a more stardard way.
> 
> Hopefully, in the near future, you won't do it like this at all, but rather
> create an fs_context and then your filesystem would be able to munge that
> directly before calling mount_bdev().
> 

OK, got you. Look forword to the new fs_context feature and thanks for your help :)

Thanks,
Gao Xiang

> David
> 
