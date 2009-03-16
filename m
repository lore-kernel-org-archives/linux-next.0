From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: nfsd tree build warning
Date: Mon, 16 Mar 2009 09:42:45 -0400
Message-ID: <20090316134245.GB8598@fieldses.org>
References: <20090316165121.3ebaf449.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.fieldses.org ([141.211.133.115]:52673 "EHLO
	pickle.fieldses.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760022AbZCPNmr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2009 09:42:47 -0400
Content-Disposition: inline
In-Reply-To: <20090316165121.3ebaf449.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Mon, Mar 16, 2009 at 04:51:21PM +1100, Stephen Rothwell wrote:
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> fs/nfsd/nfs4recover.c: In function 'nfsd4_build_namelist':
> fs/nfsd/nfs4recover.c:203: warning: array subscript is above array bounds
> 
> Caused by commit d1d269b9d0cadf221cfa3ddbe65a3a0e4cf100e1 ("nfsd4: don't
> do lookup within readdir in recovery code").

That should be fixed now, thanks.--b.
