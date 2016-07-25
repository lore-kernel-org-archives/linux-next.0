From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Mon, 25 Jul 2016 10:09:02 +0200
Message-ID: <CAJfpegsP0ZAubGSFMsUF-GWdoggntfpqZUfjjBaN5n9XXAt+Jw@mail.gmail.com>
References: <20160725102453.7fbe3ddd@canb.auug.org.au> <20160725003028.GQ2356@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160725003028.GQ2356@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jul 25, 2016 at 2:30 AM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Mon, Jul 25, 2016 at 10:24:53AM +1000, Stephen Rothwell wrote:
>> Hi Al,
>>
>> Today's linux-next merge of the vfs tree got a conflict in:
>>
>>   fs/overlayfs/super.c
>>
>> between commit:
>>
>>   e2475b7276d0 ("ovl: check mounter creds on underlying lookup")
>>
>> from the overlayfs tree and commit:
>>
>>   b3ac9a85b31c ("qstr: constify instances in overlayfs")
>>
>> from the vfs tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>
> FWIW, if Miklos could pick that one-liner into overlayfs tree, I'd be only
> happy to drop it from that queue.

OK, picked that one.

Thanks,
Miklos
