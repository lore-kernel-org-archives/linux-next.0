From: Benny Halevy <bhalevy@panasas.com>
Subject: Re: linux-next: nfs tree build warning
Date: Fri, 01 May 2009 15:19:00 +0300
Message-ID: <49FAE8B4.6020500@panasas.com>
References: <20090501131545.ca8c314a.sfr@canb.auug.org.au> <1241148155.15476.128.camel@heimdal.trondhjem.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-ca.panasas.com ([209.116.51.66]:15127 "EHLO
	laguna.int.panasas.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753751AbZEAMT6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2009 08:19:58 -0400
In-Reply-To: <1241148155.15476.128.camel@heimdal.trondhjem.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>, Andy Adamson <andros@umich.edu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On May. 01, 2009, 6:22 +0300, Trond Myklebust <trond.myklebust@fys.uio.no> wrote:
> On Fri, 2009-05-01 at 13:15 +1000, Stephen Rothwell wrote:
>> Hi Trond,
>>
>> Today's linux-next build (x86_64 allmodconfig) produced this warning:
>>
>> fs/nfs/nfs4proc.c: In function 'nfs4_proc_exchange_id':
>> fs/nfs/nfs4proc.c:4279: warning: the frame size of 2288 bytes is larger than 2048 bytes
>>
>> Introduced by commit 63a93b4af49220c74757beb17b5617b72d912b6b ("nfs41:
>> exchange_id operation").  This commit has been around for a while.
> 
> Benny, Andy,
> 
> Why are we preallocating 1k buffers on the stack for these things?
> That's an insane amount of free space...
> 
> If this is truly a realistic value (which I sincerely doubt), then the
> right thing to do is to preallocate a page in which to store them.
> Putting 1k arrays on the stack is just _wrong_.
> 
> Trond
> 

Ouch, struct nfs41_exchange_id_res contains
	struct server_owner		server_owner;
	struct server_scope		server_scope;
each embedding a char [NFS4_OPAQUE_LIMIT] array
which is 1K in length.
Not only we should have preallocated these arrays dynamically,
we actually throw them away.
Therefore I suggest that until they are put to use
we should just skip their xdr decoding, like we do
for the implementation ID.

Benny
