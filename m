From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: [PATCH] nfs41: get rid of unused struct nfs41_exchange_id_res
 members
Date: Tue, 05 May 2009 18:39:25 -0400
Message-ID: <1241563165.5174.120.camel@heimdal.trondhjem.org>
References: <89c397150905010756h503498d4n9fd2f8bb3ce403c3@mail.gmail.com>
	 <1241208886-5748-1-git-send-email-bhalevy@panasas.com>
	 <1241552053.5174.44.camel@heimdal.trondhjem.org>
	 <1241552374.5174.48.camel@heimdal.trondhjem.org>
	 <1241552508.5174.50.camel@heimdal.trondhjem.org>
	 <4A00A187.4040801@panasas.com>  <4A00A309.8000305@panasas.com>
	 <1241561521.5174.97.camel@heimdal.trondhjem.org>
	 <4A00BA9D.6080501@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out2.uio.no ([129.240.10.58]:36144 "EHLO mail-out2.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751810AbZEEWjc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 May 2009 18:39:32 -0400
In-Reply-To: <4A00BA9D.6080501@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benny Halevy <bhalevy@panasas.com>
Cc: Andy Adamson <andros@netapp.com>, pnfs@linux-nfs.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Wed, 2009-05-06 at 01:15 +0300, Benny Halevy wrote:
> On 2009-05-06 01:12, Trond Myklebust wrote:
> > Not necessary. Look again at the first line of the READ_BUF(nbytes)
> > macro:
> > 
> > 	p = xdr_inline_decode(xdr, nbytes);
> > 
> > So the value of 'p' is always correctly set to the beginning of the
> > buffer of length 'nbytes'.
> 
> Right, but then we want to skip over the buffer.

The next call to READ_BUF() will take care of updating p to the
beginning of the next buffer irrespective of whether or not you have
read data from the current buffer.

Cheers
  Trond
