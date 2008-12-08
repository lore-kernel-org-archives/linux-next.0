From: Paul Moore <paul.moore@hp.com>
Subject: Re: linux-next: manual merge of the lblnet tree
Date: Mon, 8 Dec 2008 14:41:12 -0500
Message-ID: <200812081441.12338.paul.moore@hp.com>
References: <20081208190708.1d2c37ec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g4t0014.houston.hp.com ([15.201.24.17]:18584 "EHLO
	g4t0014.houston.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751448AbYLHTlR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Dec 2008 14:41:17 -0500
In-Reply-To: <20081208190708.1d2c37ec.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>

On Monday 08 December 2008 3:07:08 am Stephen Rothwell wrote:
> Hi Paul,
>
> Today's linux-next merge of the lblnet tree got a conflicts in
> security/smack/smack_lsm.c and security/smack/smackfs.c between
> commits 86a264abe542cfececb4df129bc45a0338d8cdb9 ("CRED: Wrap
> current->cred and a few other accessors") and
> d84f4f992cbd76e8f39c488cf0c5d123843923b1 ("CRED: Inaugurate COW
> credentials") from the security-testing tree and commit
> d936691ab765fbac809e9a05c7f0c36ce2c2119e ("smack: Add support for
> unlabeled network hosts and networks") from the lblnet tree.
>
> I fixed it up (see below) and can carry the fixes as necessary.

Thanks Stephen.  It sounds like both David and Casey are okay with the 
changes so I have no arguments with the fix-up patch.

James, is the security-testing tree rebased regularly or is suitable to 
back a tree against?  If so, I can rebase the lblnet-2.6_next tree 
against security-testing to resolve the conflict ...

-- 
paul moore
linux @ hp
