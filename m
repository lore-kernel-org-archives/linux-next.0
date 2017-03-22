From: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the tpmdd
 tree
Date: Tue, 21 Mar 2017 20:43:28 -0600
Message-ID: <081d6fe2-b7bd-0b80-be71-09df0be5cd96@deltatee.com>
References: <20170322131319.6278c15d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ale.deltatee.com ([207.54.116.67]:42282 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933227AbdCVCnh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Mar 2017 22:43:37 -0400
In-Reply-To: <20170322131319.6278c15d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>

Thanks Stephen,

I've reviewed the merge and it looks correct to me.

On 21/03/17 08:13 PM, Stephen Rothwell wrote:
> I fixed it up (I hope, see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Jarko and Jason both reviewed and were aware of my patch. No one
mentioned James' work or the potential for conflict.

Logan
