From: "William A. (Andy) Adamson" <androsadamson@gmail.com>
Subject: Re: linux-next: nfs tree build warning
Date: Fri, 1 May 2009 10:56:20 -0400
Message-ID: <89c397150905010756h503498d4n9fd2f8bb3ce403c3@mail.gmail.com>
References: <20090501131545.ca8c314a.sfr@canb.auug.org.au>
	 <1241148155.15476.128.camel@heimdal.trondhjem.org>
	 <49FAE8B4.6020500@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.30]:44114 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1765338AbZEAO4V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2009 10:56:21 -0400
Received: by yw-out-2324.google.com with SMTP id 5so1393154ywb.1
        for <linux-next@vger.kernel.org>; Fri, 01 May 2009 07:56:20 -0700 (PDT)
In-Reply-To: <49FAE8B4.6020500@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benny Halevy <bhalevy@panasas.com>
Cc: Trond Myklebust <trond.myklebust@fys.uio.no>, Andy Adamson <andros@umich.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Fri, May 1, 2009 at 8:19 AM, Benny Halevy <bhalevy@panasas.com> wrote:
> On May. 01, 2009, 6:22 +0300, Trond Myklebust <trond.myklebust@fys.uio.no> wrote:
>> On Fri, 2009-05-01 at 13:15 +1000, Stephen Rothwell wrote:
>>> Hi Trond,
>>>
>>> Today's linux-next build (x86_64 allmodconfig) produced this warning:
>>>
>>> fs/nfs/nfs4proc.c: In function 'nfs4_proc_exchange_id':
>>> fs/nfs/nfs4proc.c:4279: warning: the frame size of 2288 bytes is larger than 2048 bytes
>>>
>>> Introduced by commit 63a93b4af49220c74757beb17b5617b72d912b6b ("nfs41:
>>> exchange_id operation").  This commit has been around for a while.
>>
>> Benny, Andy,
>>
>> Why are we preallocating 1k buffers on the stack for these things?
>> That's an insane amount of free space...
>>
>> If this is truly a realistic value (which I sincerely doubt), then the
>> right thing to do is to preallocate a page in which to store them.
>> Putting 1k arrays on the stack is just _wrong_.
>>
>> Trond
>>
>
> Ouch, struct nfs41_exchange_id_res contains
>        struct server_owner             server_owner;
>        struct server_scope             server_scope;
> each embedding a char [NFS4_OPAQUE_LIMIT] array
> which is 1K in length.
> Not only we should have preallocated these arrays dynamically,
> we actually throw them away.
> Therefore I suggest that until they are put to use
> we should just skip their xdr decoding, like we do
> for the implementation ID.

Yes, I agree. That is just wrong....

-->Andy
>
> Benny
>
