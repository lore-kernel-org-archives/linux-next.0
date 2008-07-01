From: Chuck Lever <chuck.lever@oracle.com>
Subject: Re: linux-next: manual merge of the bkl-removal tree
Date: Tue, 1 Jul 2008 12:05:23 -0400
Message-ID: <D7B0AA05-7E8D-483B-AA9C-AC830C2B24F2@oracle.com>
References: <20080630182122.99ea9f2e.sfr@canb.auug.org.au> <20080630165118.743626f3@bike.lwn.net>
Mime-Version: 1.0 (Apple Message framework v926)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:34284 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753107AbYGAQGD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 12:06:03 -0400
In-Reply-To: <20080630165118.743626f3@bike.lwn.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Trond Myklebust <Trond.Myklebust@netapp.com>


On Jun 30, 2008, at 6:51 PM, Jonathan Corbet wrote:

> Hi Trond, Chuck,
>
> On Mon, 30 Jun 2008 18:21:22 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> Today's linux-next merge of the bkl-removal tree got a trivial
>> conflict in fs/nfs/file.c between commit
>> 69cc426fc4b7664ec69642cd9b30eabe2ec8ad4a ("NFS: Make nfs_llseek
>> methods consistent") from the nfs tree and commit
>> a9f88f0c4fed5d1ed6fb4a0389891d327a147130 ("Remove BKL from
>> remote_llseek v2") from the bkl-removal tree.
>>
>> I fixed it up and can carry it.  Or maybe you should liaise with
>> Trond to put ths nfs part of the BKL removal in his tree.
>
> So how would you like to handle this one?  The patch from Andi which
> conflicts with your tree can stand alone, but it affects a few files
> outside of the NFS tree.  Even so, it looks like having you snarf it
> and merge it there might be the easiest way to make the pieces fit
> together.

Whatever Trond decides is OK with me.

--
Chuck Lever
chuck[dot]lever[at]oracle[dot]com
