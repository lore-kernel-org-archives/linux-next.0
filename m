From: Chuck Lever <chuck.lever@oracle.com>
Subject: Re: linux-next: manual merge of the rdma tree with the nfsd tree
Date: Wed, 6 Jan 2016 07:27:25 -0500
Message-ID: <5E455D80-357B-428D-8484-93E61A3E644C@oracle.com>
References: <20151231133022.0b3ecab9@canb.auug.org.au> <20160104124450.7ba21c87@canb.auug.org.au> <5689DEA0.1020803@redhat.com> <20160104193616.GB30315@fieldses.org> <24AC8112-95A2-4D7B-8048-3D7D50A78B90@oracle.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:25425 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750989AbcAFM1m convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Jan 2016 07:27:42 -0500
In-Reply-To: <24AC8112-95A2-4D7B-8048-3D7D50A78B90@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>, Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML Kernel <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Ira Weiny <ira.weiny@intel.com>, Or Gerlitz <ogerlitz@mellanox.com>


> On Jan 6, 2016, at 7:01 AM, Chuck Lever <chuck.lever@oracle.com> wrote:
> 
> 
>> On Jan 4, 2016, at 2:36 PM, J. Bruce Fields <bfields@fieldses.org> wrote:
>> 
>> On Sun, Jan 03, 2016 at 09:53:20PM -0500, Doug Ledford wrote:
>>> On 01/03/2016 08:44 PM, Stephen Rothwell wrote:
>>>> Hi all,
>>>> 
>>>> On Thu, 31 Dec 2015 13:30:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>> 
>>>>> Hi Doug,
>>>>> 
>>>>> Today's linux-next merge of the rdma tree got conflicts in a quite a
>>>>> few files between (mostly, I think) commit:
>>>>> 
>>>>> 6c7b6d2d442c ("IB: merge struct ib_device_attr into struct ib_device")
>>>>> 
>>>>> from the nfsd tree and various commits from the rdma tree.
>>>>> 
>>>>> It would have taken me considerable time to fix the conflicts up, so I
>>>>> have dropped teh rdma tree for today (just because it was merged second).
>>>>> Please have a conversation and figure out how you are going to cooperate
>>>>> and get these conflicts fixed e.g. set up a stable branch with Christoph's
>>>>> commit (and any other conflicting commits) in it and merge that into
>>>>> both trees.
>>>> 
>>>> So, on further inspection, it appears that there is a series of commits
>>>> in the rdma tree that does basically the same as that nfsd tree commit
>>>> above.  So I have dropped the rdma tree again today.  Please have a
>>>> conversation guys ...
>>>> 
>>> 
>>> The initial patchset was Christoph's.  It was later replaced with a
>>> different patchset from Or Gerlitz.  Bruce picked up some changes from
>>> Chuck Lever that were originally based on Christoph's work but now need
>>> to be rebased off of the current RDMA tree.
>> 
>> OK.  I'm assuming Chuck will want to do any necessary rebasing and
>> retesting himself, so for now I've just dropped those patches, and
>> expect to pick up new versions when Chuck gets back from the holidays.
> 
> Part of the plan was that Doug's tree would be merged before
> Bruce's. But the above problem description looks like the
> maintainer trees were merged into linux-next in the other order.
> 
> I'd like to make this simpler for everyone. Bruce, may I send
> my for-4.5 NFS/RDMA server patches to Doug with your Acked-by?
> That way, merge order won't matter.

Also, I see Dan Carpenter has posted a couple of clean-ups for
this series. I can include them with my upcoming repost if you
wish.

--
Chuck Lever
