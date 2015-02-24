From: Bob Peterson <rpeterso@redhat.com>
Subject: Re: linux-next: Tree for Feb 24 (build failure due to 'GFS2:
 Allocate reservation during splice_write')
Date: Tue, 24 Feb 2015 11:56:31 -0500 (EST)
Message-ID: <920599110.18428494.1424796991441.JavaMail.zimbra@redhat.com>
References: <20150224140257.729c3958@canb.auug.org.au> <20150224051950.GA20733@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3-phx2.redhat.com ([209.132.183.24]:33652 "EHLO
	mx3-phx2.redhat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753126AbbBXQ4h (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Feb 2015 11:56:37 -0500
In-Reply-To: <20150224051950.GA20733@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

----- Original Message -----
> On Tue, Feb 24, 2015 at 02:02:57PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20150223:
> > 
> > The hid tree gained a conflict against Linus' tree.
> > 
> > The drm-misc tree gained a build failure for which I applied a merge
> > fix patch.
> > 
> > Non-merge commits (relative to Linus' tree): 1108
> >  718 files changed, 18557 insertions(+), 17357 deletions(-)
> > 
> > ----------------------------------------------------------------------------
> > 
> 
> Building powerpc:ppc6xx_defconfig ... failed
> --------------
> Error log:
> fs/gfs2/file.c:1126:18: error: 'gfs2_file_splice_write' undeclared here (not
> in a function)
>   .splice_write = gfs2_file_splice_write,
>                     ^
> 		    make[2]: *** [fs/gfs2/file.o] Error 1

Hi Guenter,

Due to other errors, I rebased the linux-gfs2 tree and pushed a new patch to fix
this problem. Sorry about that.

Regards,

Bob Peterson
