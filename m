From: Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: Re: linux-next: manual merge of the vfs tree with the aio-direct
 tree
Date: Tue, 17 Sep 2013 22:25:21 -0500
Message-ID: <52391D21.6080703@oracle.com>
References: <20130918105638.6fa7c29605c14b408b7f5a7e@canb.auug.org.au> <20130918020035.GK13318@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:38217 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751042Ab3IRDZ3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2013 23:25:29 -0400
In-Reply-To: <20130918020035.GK13318@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zach Brown <zab@zabbo.net>

On 09/17/2013 09:00 PM, Al Viro wrote:
> On Wed, Sep 18, 2013 at 10:56:38AM +1000, Stephen Rothwell wrote:
>> Hi Al,
>>
>> Today's linux-next merge of the vfs tree got conflicts in fs/nfs/direct.c
>> and fs/nfs/file.c between commits b9517433d65d ("dio: Convert direct_IO
>> to use iov_iter"), a8431c667ae8 ("nfs: add support for read_iter,
>> write_iter") and a1b8ec384b73 ("nfs: simplify swap") from the aio-direct
>> tree and commit c18d1ec44f7a ("nfs: use %p[dD] instead of open-coded (and
>> often racy) equivalents") from the vfs tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary (no action
>> is required).
> 
> Hrm...  FWIW, I would greatly prefer to offload these printk patches to
> NFS and NFSD trees.  Didn't get around to that yet, but...
> 
> As for aio-direct...  Two questions:
> 	* had anybody tried to measure the effect on branch predictor from
> introducing that method vector?  Commit d6afd4c4 ("iov_iter: hide iovec
> details behind ops function pointers")

Any suggestions for a good benchmark?

> 	* WTF does aforementioned commit lack its author's s-o-b?  The same
> goes for a lot of zab's commits in there...

That would be my bad. Zach's original patches had his s-o-b (w/an Oracle
email address). I'll add them back.

Shaggy
