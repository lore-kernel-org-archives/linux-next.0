From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: ocsf2 tree build warnings
Date: Tue, 25 Nov 2008 14:16:56 +0100
Message-ID: <20081125131656.GC460@duck.suse.cz>
References: <20081125213102.28efa104.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from styx.suse.cz ([82.119.242.94]:51847 "EHLO mail.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750745AbYKYNQ5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 08:16:57 -0500
Content-Disposition: inline
In-Reply-To: <20081125213102.28efa104.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Fasheh <mfasheh@suse.com>, linux-next@vger.kernel.org

On Tue 25-11-08 21:31:02, Stephen Rothwell wrote:
> Hi Mark,
> 
> Today's linux-next build (powerpc allyesconfig) produced these warnings:
  Thanks, these slipped my attention. Fixed.

> fs/ocfs2/quota_local.c: In function 'olq_set_dquot':
> fs/ocfs2/quota_local.c:844: warning: format '%lld' expects type 'long long int', but argument 7 has type '__le64'
> fs/ocfs2/quota_local.c:844: warning: format '%lld' expects type 'long long int', but argument 8 has type '__le64'
> fs/ocfs2/quota_local.c:844: warning: format '%lld' expects type 'long long int', but argument 7 has type '__le64'
> fs/ocfs2/quota_local.c:844: warning: format '%lld' expects type 'long long int', but argument 8 has type '__le64'
> fs/ocfs2/quota_local.c:844: warning: format '%lld' expects type 'long long int', but argument 7 has type '__le64'
> fs/ocfs2/quota_local.c:844: warning: format '%lld' expects type 'long long int', but argument 8 has type '__le64'
> fs/ocfs2/quota_global.c: In function '__ocfs2_sync_dquot':
> fs/ocfs2/quota_global.c:457: warning: format '%lld' expects type 'long long int', but argument 8 has type 's64'
> fs/ocfs2/quota_global.c:457: warning: format '%lld' expects type 'long long int', but argument 10 has type 's64'
> fs/ocfs2/quota_global.c:457: warning: format '%lld' expects type 'long long int', but argument 8 has type 's64'
> fs/ocfs2/quota_global.c:457: warning: format '%lld' expects type 'long long int', but argument 10 has type 's64'
> fs/ocfs2/quota_global.c:457: warning: format '%lld' expects type 'long long int', but argument 8 has type 's64'
> fs/ocfs2/quota_global.c:457: warning: format '%lld' expects type 'long long int', but argument 10 has type 's64'
> 
> These are because s64 is "long" on some architectures.  Our usual
> solution is to cast them to "long long" when printing them.  Also, you
> shouldn't directly print an __le64 (you need to convert it to the host
> type first for it to make much sense.

										Honza

-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
