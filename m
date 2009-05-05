From: Benny Halevy <bhalevy@panasas.com>
Subject: Re: [PATCH] nfs41: get rid of unused struct nfs41_exchange_id_res
 members
Date: Tue, 05 May 2009 23:35:21 +0300
Message-ID: <4A00A309.8000305@panasas.com>
References: <89c397150905010756h503498d4n9fd2f8bb3ce403c3@mail.gmail.com>	 <1241208886-5748-1-git-send-email-bhalevy@panasas.com>	 <1241552053.5174.44.camel@heimdal.trondhjem.org>	 <1241552374.5174.48.camel@heimdal.trondhjem.org> <1241552508.5174.50.camel@heimdal.trondhjem.org> <4A00A187.4040801@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-ca.panasas.com ([209.116.51.66]:18806 "EHLO
	laguna.int.panasas.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753403AbZEEUfn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2009 16:35:43 -0400
In-Reply-To: <4A00A187.4040801@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Andy Adamson <andros@netapp.com>, pnfs@linux-nfs.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On 2009-05-05 23:28, Benny Halevy wrote:
> On May. 05, 2009, 22:41 +0300, Trond Myklebust <trond.myklebust@fys.uio.no> wrote:
>> On Tue, 2009-05-05 at 15:39 -0400, Trond Myklebust wrote:
>>> On Tue, 2009-05-05 at 15:34 -0400, Trond Myklebust wrote:
>>>> On Fri, 2009-05-01 at 23:14 +0300, Benny Halevy wrote:
>>>>> struct nfs41_exchange_id_res is currently allocated on the stack
>>>>> insanely taking over 2K of stack space due to the NFS4_OPAQUE_LIMIT (1K(
>>>>> byte arrays embedded in server_owner and server_scope.
>>>>> Since these are not in use yet, this patch gets rid of them for the
>>>>> time being.
>>>>>
>>>>> Signed-off-by: Benny Halevy <bhalevy@panasas.com>
>>>>> ---
>>>>>  fs/nfs/nfs4xdr.c        |   27 ++++++++++++++-------------
>>>>>  include/linux/nfs_xdr.h |    3 ---
>>>>>  2 files changed, 14 insertions(+), 16 deletions(-)
>>>>>
>>>>> diff --git a/fs/nfs/nfs4xdr.c b/fs/nfs/nfs4xdr.c
>>>>> index 80af0ae..3350d19 100644
>>>>> --- a/fs/nfs/nfs4xdr.c
>>>>> +++ b/fs/nfs/nfs4xdr.c
>>>>> @@ -4185,8 +4185,8 @@ static int decode_delegreturn(struct xdr_stream *xdr)
>>>>>  static int decode_exchange_id(struct xdr_stream *xdr,
>>>>>  			      struct nfs41_exchange_id_res *res)
>>>>>  {
>>>>> -	uint32_t *p;
>>>>> -	int status, dummy;
>>>>> +	uint32_t *p, dummy;
>> Oh, and 'p' _always_ has to be of type '__be32', otherwise the 'sparse'
>> checker will yell at you.
> 
> Thanks!  I'll send a fixed version
> of this patch and also look into the rest of the xdr code.
> 
>>>>> +	int status;
>>>>>  	struct nfs_client *clp = res->client;
>>>>>  
>>>>>  	status = decode_op_hdr(xdr, OP_EXCHANGE_ID);
>>>>> @@ -4204,25 +4204,26 @@ static int decode_exchange_id(struct xdr_stream *xdr,
>>>>>  	if (dummy != SP4_NONE)
>>>>>  		return -EIO;
>>>>>  
>>>>> -	/* minor_id */
>>>>> +	/* Throw away minor_id */
>>>>>  	READ_BUF(8);
>>>>> -	READ64(res->server_owner.minor_id);
>>>>> +	p += 8;
>>>>          ^^^^^^^^ Err... This isn't the same thing at all!
> 
> Ouch, of course.  What did I smoke that day?
> 
>>>> You're suddenly skipping 10=words instead of the original 2. READ_BUF()
>>>> will already take care of updating the 'p' pointer.
> 
> Which p?
> It takes care of argp->p, not the local 'p' variable, doesn't it.

Grr, I meant "xdr->p" of course, via xdr_inline_decode
(argp is the server's READ_BUF, sigh)

> p += 2 has an equivalent side effect on 'p' as doing READ64.
> I can do "p = argp;" instead though to reset 'p' onto

p = xdr->p; ...

Benny

> the current xdr stream "head".
> 
>>> BTW, this is exactly why the whole READ_BUF(), READ*(), WRITE*() macro
>>> crap is so utterly broken. The magic that happens to the 'p' pointer is
>>> completely opaque to someone unfamiliar with the code.
> 
> I completely agree.  We're dealing with bits and bytes (or 32 bit words
> actually) at the wrong abstraction layer.
> 
>>>>>  
>>>>> -	/* Major id */
>>>>> +	/* Throw away Major id */
>>>>>  	READ_BUF(4);
>>>>> -	READ32(res->server_owner.major_id_sz);
>>>>> -	READ_BUF(res->server_owner.major_id_sz);
>>>>> -	COPYMEM(res->server_owner.major_id, res->server_owner.major_id_sz);
>>>>> +	READ32(dummy);
>>>>> +	READ_BUF(dummy);
>>>>> +	p += XDR_QUADLEN(dummy);
>>>>          ^^^^^^^^^^^^^^^^^^^^^^^^^ Ditto. You're skipping 2*dummy words.
> 
> Why?
> READ_BUF increments argp->p in XDR_QUADLEN(dummy) words
> and the local p should be adjusted correspondingly.
> This used to happen as the side effect of COPY_MEM.
> 
>>>>>  
>>>>> -	/* server_scope */
>>>>> +	/* Throw away server_scope */
>>>>>  	READ_BUF(4);
>>>>> -	READ32(res->server_scope.server_scope_sz);
>>>>> -	READ_BUF(res->server_scope.server_scope_sz);
>>>>> -	COPYMEM(res->server_scope.server_scope,
>>>>> -		res->server_scope.server_scope_sz);
>>>>> +	READ32(dummy);
>>>>> +	READ_BUF(dummy);
>>>>> +	p += XDR_QUADLEN(dummy);
>>>>           ^^^^^^^^^^^^^^^^^^^^^^^^ Ditto
> 
> Ditto
> 
>>>>> +
>>>>>  	/* Throw away Implementation id array */
>>>>>  	READ_BUF(4);
>>>>>  	READ32(dummy);
>>>>> +	READ_BUF(dummy);
>>>>>  	p += XDR_QUADLEN(dummy);
>>>>           ^^^^^^^^^^^^^^^^^^^^^^^^ Ditto
>>>>
> 
> and here too...
> 
> BTW, Calling READ_BUF here was missing before, so this could be put
> in a patch of its own, and adjusting p is not really necessary since
> we're about to exit the function...
> 
> In any case, are we going to squash these fixes into the respective
> queued patch, or would like to start accumulating the patches for
> 2.6.31 without rebasing?
> 
> Benny
> 
>>>>>  
>>>>>  	return 0;
>>>>> diff --git a/include/linux/nfs_xdr.h b/include/linux/nfs_xdr.h
>>>>> index 071a6d1..62f63fb 100644
>>>>> --- a/include/linux/nfs_xdr.h
>>>>> +++ b/include/linux/nfs_xdr.h
>>>>> @@ -925,9 +925,6 @@ struct server_scope {
>>>>>  struct nfs41_exchange_id_res {
>>>>>  	struct nfs_client		*client;
>>>>>  	u32				flags;
>>>>> -	struct server_owner		server_owner;
>>>>> -	struct server_scope		server_scope;
>>>>> -	struct nfs_impl_id4		impl_id;
>>>>>  };
>>>>>  
>>>>>  struct nfs41_create_session_args {
>>
