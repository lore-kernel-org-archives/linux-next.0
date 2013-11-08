From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: build failure after merge of the userns tree
Date: Fri, 08 Nov 2013 14:50:42 -0800
Message-ID: <87ob5uwlrx.fsf@xmission.com>
References: <20131108175848.6ca49f0ee8fe2a6c1125394a@canb.auug.org.au>
	<20131108072732.GA27537@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:51426 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757570Ab3KHWvD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Nov 2013 17:51:03 -0500
In-Reply-To: <20131108072732.GA27537@infradead.org> (Christoph Hellwig's
	message of "Thu, 7 Nov 2013 23:27:32 -0800")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Christoph Hellwig <hch@infradead.org> writes:

> On Fri, Nov 08, 2013 at 05:58:48PM +1100, Stephen Rothwell wrote:
>> Hi Eric,
>> 
>> After merging the userns tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>> 
>> fs/namei.c: In function 'covered':
>> fs/namei.c:3528:2: error: too many arguments to function '__lookup_mnt'
>>   is_covered = d_mountpoint(dentry) && __lookup_mnt(mnt, dentry, 1);
>>   ^
>> 
>> Caused by my incomplete merge resolution between commits 474279dc0f77
>> ("split __lookup_mnt() in two functions") from the vfs tree and
>> a3b4491433f2 ("vfs: Don't allow overwriting mounts in the current mount
>> namespace") from the userns tree.
>
> Btw, I don't think the userns tree has any business touching lookup
> and mount semantics in namei.c without an explicit VFS signoff.
>
> Please drop the tree for now.

This is ultimatley a pretty siginficant bug user namespace fix.  So the
code absolutely has business being in the user namespace tree.  The code
has been reviewed and people did not scream.  I asked if Al wanted to
take the patches and if not I would take them through my tree.

Al was watching the conversation so I assumed that no answer to that
request was sufficient to take these patches in my tree.

I fully intend to take responsibility for these patches and work through
whatever issues they have, and I intend to send Linus my pull request.
As such dropping the userns tree from linux-next seems inappropriate.

Eric
