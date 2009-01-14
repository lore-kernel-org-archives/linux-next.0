From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: quota tree build failure
Date: Wed, 14 Jan 2009 15:18:51 +0100
Message-ID: <20090114141851.GD19950@duck.suse.cz>
References: <20090114121551.2dc725f9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from styx.suse.cz ([82.119.242.94]:50118 "EHLO mail.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753633AbZANOSx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Jan 2009 09:18:53 -0500
Content-Disposition: inline
In-Reply-To: <20090114121551.2dc725f9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed 14-01-09 12:15:51, Stephen Rothwell wrote:
> Hi Jan,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> fs/ocfs2/quota_global.c: In function 'ocfs2_dquot_initialize':
> fs/ocfs2/quota_global.c:858: error: implicit declaration of function 'dquot_is_cached'
> fs/ocfs2/quota_global.c: In function 'ocfs2_dquot_drop':
> fs/ocfs2/quota_global.c:962: error: implicit declaration of function 'dquot_drop_locked'
> 
> Caused by commit 39a225f20e9b881f1c9431d073a62fbf38219614 ("quota:
> Improve locking") which removes these functions.
  OK, thanks for letting me know. OCFS2 hasn't yet merged the corresponding patch. I've
removed the patch from my for_next branch for now.

										Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
