From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: nfsd tree build warning
Date: Wed, 29 Apr 2009 11:01:50 -0400
Message-ID: <20090429150150.GB8604@fieldses.org>
References: <20090429135702.943f2bfa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.fieldses.org ([141.211.133.115]:51534 "EHLO
	pickle.fieldses.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753152AbZD2PBv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Apr 2009 11:01:51 -0400
Content-Disposition: inline
In-Reply-To: <20090429135702.943f2bfa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Bian Naimeng <biannm@cn.fujitsu.com>, nfsv4@linux-nfs.org

On Wed, Apr 29, 2009 at 01:57:02PM +1000, Stephen Rothwell wrote:
> Hi Bruce,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this new
> warning:
> 
> fs/nfsd/nfs4state.c: In function 'EXPIRED_STATEID':
> fs/nfsd/nfs4state.c:2757: warning: comparison of distinct pointer types lacks a cast
> 
> Caused by commit 78155ed75f470710f2aecb3e75e3d97107ba8374 ("nfsd4:
> distinguish expired from stale stateids").
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/

Probably just needs yet another cast.  Argh; maybe Bian Naimeng's
after_boot()/before_lease() idea would have been simpler.

--b.


diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index 74e822e..d24dd12 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -2754,7 +2754,7 @@ EXPIRED_STATEID(stateid_t *stateid)
 {
 	if (time_before((unsigned long)boot_time,
 			((unsigned long)stateid->si_boot)) &&
-	    time_before((stateid->si_boot + lease_time), get_seconds())) {
+	    time_before((unsigned long)(stateid->si_boot + lease_time), get_seconds())) {
 		dprintk("NFSD: expired stateid (%08x/%08x/%08x/%08x)!\n",
 			stateid->si_boot, stateid->si_stateownerid,
 			stateid->si_fileid, stateid->si_generation);
