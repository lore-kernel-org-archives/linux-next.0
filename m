From: Paul Moore <paul.moore@hp.com>
Subject: Re: linux-next: lblnet tree build failure
Date: Tue, 16 Dec 2008 11:33:48 -0500
Message-ID: <200812161133.48529.paul.moore@hp.com>
References: <20081216191419.43ae28af.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g1t0027.austin.hp.com ([15.216.28.34]:48093 "EHLO
	g1t0027.austin.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755509AbYLPQeO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Dec 2008 11:34:14 -0500
In-Reply-To: <20081216191419.43ae28af.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>

On Tuesday 16 December 2008 3:14:19 am Stephen Rothwell wrote:
> Hi Paul,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> security/smack/smackfs.c: In function 'smk_netlabel_audit_set':
> security/smack/smackfs.c:118: error: 'struct task_struct' has no
> member named 'security'
>
> Caused by commit 2d22b59c5401e60c04e6258a245b8a99d103f55b ("smack:
> Add support for unlabeled network hosts and networks") interacting
> with commit b6dff3ec5e116e3af6f537d4caedcad6b9e5082a ("CRED: Separate
> task security context from task_struct") from the security-testing
> tree.  This latter commit is also in the lblnet tree (since it merges
> the security testing tree).
>
> I have dropped the lblnet tree for today.

My mistake, it should be fixed now.

When I was updating the lblnet-2.6_next tree yesterday I made a mistake 
and didn't refresh Casey's patch completely when merging it against the 
security-testing tree as a result some of the necessary merges didn't 
make it out of my local directory.  Sorry guys.

-- 
paul moore
linux @ hp
