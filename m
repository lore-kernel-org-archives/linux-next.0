From: Steven Whitehouse <swhiteho@redhat.com>
Subject: Re: linux-next: gfs2 tree build warning
Date: Wed, 03 Jun 2009 11:15:36 +0100
Message-ID: <1244024136.29604.596.camel@localhost.localdomain>
References: <20090603154031.3652281b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:37807 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752717AbZFCKPq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2009 06:15:46 -0400
In-Reply-To: <20090603154031.3652281b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Abhijith Das <adas@redhat.com>

Hi,

On Wed, 2009-06-03 at 15:40 +1000, Stephen Rothwell wrote:
> Hi Steven,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> fs/gfs2/file.c: In function 'gfs2_flock':
> fs/gfs2/file.c:697: warning: unused variable 'ip'
> 
> Introduced by commit a12af1ebe675e85831fde3c4d0908fc3b0908b7a ("GFS2:
> smbd proccess hangs with flock() call") which removed the last usage of
> 'ip'.
> 

Thanks for letting me know. There is a fix in the -nmw tree now,

Steve.
