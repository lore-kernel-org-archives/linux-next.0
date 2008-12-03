From: Paul Moore <paul.moore@hp.com>
Subject: Re: linux-next: lblnet tree build failure
Date: Wed, 3 Dec 2008 09:51:06 -0500
Message-ID: <200812030951.06686.paul.moore@hp.com>
References: <20081203162202.01a3088f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g5t0007.atlanta.hp.com ([15.192.0.44]:30108 "EHLO
	g5t0007.atlanta.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751930AbYLCOvJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Dec 2008 09:51:09 -0500
In-Reply-To: <20081203162202.01a3088f.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wednesday 03 December 2008 12:22:02 am Stephen Rothwell wrote:
> Hi Paul,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> security/smack/smackfs.c: In function 'smk_unlbl_ambient':
> security/smack/smackfs.c:386: warning: passing argument 2 of
> 'netlbl_cfg_map_del' makes integer from pointer without a cast
> security/smack/smackfs.c:386: error: too few arguments to function
> 'netlbl_cfg_map_del'
>
> Caused by commit dc9d06d6226e4855c50961940498427acb4f9866 ("netlabel:
> Update kernel configuration API").
>
> I have dropped the lblnet tree for today.

My apologies (again), I'll get that fixed up today.  Casey, the Smack 
maintainer, and I have been changing things around a fair amount lately 
and it looks like I missed something in the last update.

-- 
paul moore
linux @ hp
