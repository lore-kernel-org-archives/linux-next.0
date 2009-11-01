From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: nfs/nfsd trees fetch failed
Date: Sun, 01 Nov 2009 17:03:38 -0500
Message-ID: <1257113019.3916.6.camel@heimdal.trondhjem.org>
References: <20091102085835.651ddd02.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out2.uio.no ([129.240.10.58]:52864 "EHLO mail-out2.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753548AbZKAWDk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2009 17:03:40 -0500
In-Reply-To: <20091102085835.651ddd02.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2009-11-02 at 08:58 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's fetch of the nfs and nfsd trees failed like this:
> 
> nfs: git
> git.linux-nfs.org[0: 141.212.112.37]: errno=Connection refused
> fatal: unable to connect a socket (Connection refused)
> nfsd: git
> git.linux-nfs.org[0: 141.212.112.37]: errno=Connection refused
> fatal: unable to connect a socket (Connection refused)
> 
> I will use the version of those trees from next-20091030.

Hi Stephen,

Yes. It's a known problem: an upgrade+reboot that went awry combined
with a remote console failure. I'm hoping that Bruce might be able to
help out when he returns to the office tomorrow morning...

Cheers
  Trond
