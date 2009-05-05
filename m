From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: [PATCH] nfs41: get rid of unused struct nfs41_exchange_id_res
 members
Date: Tue, 05 May 2009 18:12:01 -0400
Message-ID: <1241561521.5174.97.camel@heimdal.trondhjem.org>
References: <89c397150905010756h503498d4n9fd2f8bb3ce403c3@mail.gmail.com>
	 <1241208886-5748-1-git-send-email-bhalevy@panasas.com>
	 <1241552053.5174.44.camel@heimdal.trondhjem.org>
	 <1241552374.5174.48.camel@heimdal.trondhjem.org>
	 <1241552508.5174.50.camel@heimdal.trondhjem.org>
	 <4A00A187.4040801@panasas.com>  <4A00A309.8000305@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out2.uio.no ([129.240.10.58]:43314 "EHLO mail-out2.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753242AbZEEWML (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 May 2009 18:12:11 -0400
In-Reply-To: <4A00A309.8000305@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benny Halevy <bhalevy@panasas.com>
Cc: Andy Adamson <andros@netapp.com>, pnfs@linux-nfs.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tue, 2009-05-05 at 23:35 +0300, Benny Halevy wrote:
> On 2009-05-05 23:28, Benny Halevy wrote:
> > On May. 05, 2009, 22:41 +0300, Trond Myklebust <trond.myklebust@fys.uio.no> wrote:
> >> On Tue, 2009-05-05 at 15:39 -0400, Trond Myklebust wrote:
> >>> On Tue, 2009-05-05 at 15:34 -0400, Trond Myklebust wrote:
> >>>> On Fri, 2009-05-01 at 23:14 +0300, Benny Halevy wrote:
> >>>>> struct nfs41_exchange_id_res is currently allocated on the stack
> >>>>> insanely taking over 2K of stack space due to the NFS4_OPAQUE_LIMIT (1K(
> >>>>> byte arrays embedded in server_owner and server_scope.
> >>>>> Since these are not in use yet, this patch gets rid of them for the
> >>>>> time being.
> >>>>>
> >>>>> Signed-off-by: Benny Halevy <bhalevy@panasas.com>
> >>>>> ---
> >>>>>  fs/nfs/nfs4xdr.c        |   27 ++++++++++++++-------------
> >>>>>  include/linux/nfs_xdr.h |    3 ---
> >>>>>  2 files changed, 14 insertions(+), 16 deletions(-)
> >>>>>
> >>>>> diff --git a/fs/nfs/nfs4xdr.c b/fs/nfs/nfs4xdr.c
> >>>>> index 80af0ae..3350d19 100644
> >>>>> --- a/fs/nfs/nfs4xdr.c
> >>>>> +++ b/fs/nfs/nfs4xdr.c
> >>>>> @@ -4185,8 +4185,8 @@ static int decode_delegreturn(struct xdr_stream *xdr)
> >>>>>  static int decode_exchange_id(struct xdr_stream *xdr,
> >>>>>  			      struct nfs41_exchange_id_res *res)
> >>>>>  {
> >>>>> -	uint32_t *p;
> >>>>> -	int status, dummy;
> >>>>> +	uint32_t *p, dummy;
> >> Oh, and 'p' _always_ has to be of type '__be32', otherwise the 'sparse'
> >> checker will yell at you.
> > 
> > Thanks!  I'll send a fixed version
> > of this patch and also look into the rest of the xdr code.
> > 
> >>>>> +	int status;
> >>>>>  	struct nfs_client *clp = res->client;
> >>>>>  
> >>>>>  	status = decode_op_hdr(xdr, OP_EXCHANGE_ID);
> >>>>> @@ -4204,25 +4204,26 @@ static int decode_exchange_id(struct xdr_stream *xdr,
> >>>>>  	if (dummy != SP4_NONE)
> >>>>>  		return -EIO;
> >>>>>  
> >>>>> -	/* minor_id */
> >>>>> +	/* Throw away minor_id */
> >>>>>  	READ_BUF(8);
> >>>>> -	READ64(res->server_owner.minor_id);
> >>>>> +	p += 8;
> >>>>          ^^^^^^^^ Err... This isn't the same thing at all!
> > 
> > Ouch, of course.  What did I smoke that day?
> > 
> >>>> You're suddenly skipping 10=words instead of the original 2. READ_BUF()
> >>>> will already take care of updating the 'p' pointer.
> > 
> > Which p?
> > It takes care of argp->p, not the local 'p' variable, doesn't it.
> 
> Grr, I meant "xdr->p" of course, via xdr_inline_decode
> (argp is the server's READ_BUF, sigh)
> 
> > p += 2 has an equivalent side effect on 'p' as doing READ64.
> > I can do "p = argp;" instead though to reset 'p' onto
> 
> p = xdr->p; ...

Not necessary. Look again at the first line of the READ_BUF(nbytes)
macro:

	p = xdr_inline_decode(xdr, nbytes);

So the value of 'p' is always correctly set to the beginning of the
buffer of length 'nbytes'.

I'll make a point of removing those macro references from the client
code in the next week or so. I'm getting really tired of them...

Cheers
  Trond
