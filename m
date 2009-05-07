From: Benny Halevy <bhalevy@panasas.com>
Subject: Re: [PATCH] nfs41: get rid of unused struct nfs41_exchange_id_res
 members
Date: Thu, 07 May 2009 18:56:55 +0300
Message-ID: <4A0304C7.2090003@panasas.com>
References: <89c397150905010756h503498d4n9fd2f8bb3ce403c3@mail.gmail.com>	 <1241208886-5748-1-git-send-email-bhalevy@panasas.com>	 <1241552053.5174.44.camel@heimdal.trondhjem.org>	 <1241552374.5174.48.camel@heimdal.trondhjem.org>	 <1241552508.5174.50.camel@heimdal.trondhjem.org>	 <4A00A187.4040801@panasas.com>  <4A00A309.8000305@panasas.com>	 <1241561521.5174.97.camel@heimdal.trondhjem.org>	 <4A00BA9D.6080501@panasas.com> <1241563165.5174.120.camel@heimdal.trondhjem.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-ca.panasas.com ([209.116.51.66]:8579 "EHLO
	laguna.int.panasas.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754099AbZEGP6c (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2009 11:58:32 -0400
In-Reply-To: <1241563165.5174.120.camel@heimdal.trondhjem.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Andy Adamson <andros@netapp.com>, pnfs@linux-nfs.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On May. 06, 2009, 1:39 +0300, Trond Myklebust <trond.myklebust@fys.uio.no> wrote:
> On Wed, 2009-05-06 at 01:15 +0300, Benny Halevy wrote:
>> On 2009-05-06 01:12, Trond Myklebust wrote:
>>> Not necessary. Look again at the first line of the READ_BUF(nbytes)
>>> macro:
>>>
>>> 	p = xdr_inline_decode(xdr, nbytes);
>>>
>>> So the value of 'p' is always correctly set to the beginning of the
>>> buffer of length 'nbytes'.
>> Right, but then we want to skip over the buffer.
> 
> The next call to READ_BUF() will take care of updating p to the
> beginning of the next buffer irrespective of whether or not you have
> read data from the current buffer.

Got it.  Thanks for being patient :-)

> 
> Cheers
>   Trond
> 

The following 6 patches fix nfs41 xdr code
based on the current helpers (over nfs-2.6/nfsv41).

I can squash them into the current patchset
after your cleanup of the xdr macros.

[PATCH 1/6] nfs41: Ignoring impid in decode_exchange_id is missing a READ_BUF
[PATCH 2/6] nfs41: fix Xcode_exchange_id's xdr Xcoding pointer type
[PATCH 3/6] nfs41: get rid of unused struct nfs41_exchange_id_res members
[PATCH 4/6] nfs41: fix Xcode_create_session's xdr Xcoding pointer type
[PATCH 5/6] nfs41: refactor decoding of channel attributes
[PATCH 6/6] nfs41: fix encode_destroy_session's xdr Xcoding pointer type

Benny
