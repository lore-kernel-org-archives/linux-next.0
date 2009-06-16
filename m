From: Jeff Layton <jlayton@redhat.com>
Subject: Re: linux-next: cifs tree build warning
Date: Tue, 16 Jun 2009 06:38:23 -0400
Message-ID: <20090616063823.688c93c2@tlielax.poochiereds.net>
References: <20090616160751.4acfdf1d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:55371 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751866AbZFPKi2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2009 06:38:28 -0400
In-Reply-To: <20090616160751.4acfdf1d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steve French <sfrench@us.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 16 Jun 2009 16:07:51 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Steve,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> fs/cifs/dns_resolve.c: In function 'is_ip':
> fs/cifs/dns_resolve.c:42: warning: passing argument 1 of 'cifs_convert_address' discards qualifiers from pointer target type
> fs/cifs/cifsproto.h:77: note: expected 'char *' but argument is of type 'const char *'
> 
> Introduced by commit 1e68b2b2756fc3488ecbade5ad5f13302b3aaafc ("cifs: add
> new routine for converting AF_INET and AF_INET6 addrs").
> 

Known problem. The warning is pretty harmless (that variable doesn't
ever get changed). Once Steve commits the last patch in that series
the warning will go away.

-- 
Jeff Layton <jlayton@redhat.com>
