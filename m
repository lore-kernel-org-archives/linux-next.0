From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: linux-next: manual merge of the lblnet tree
Date: Mon, 08 Dec 2008 08:09:39 -0800
Message-ID: <493D46C3.30306@schaufler-ca.com>
References: <20081208190708.1d2c37ec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp107.prem.mail.sp1.yahoo.com ([98.136.44.62]:33153 "HELO
	smtp107.prem.mail.sp1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753503AbYLHQQd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Dec 2008 11:16:33 -0500
In-Reply-To: <20081208190708.1d2c37ec.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Moore <paul.moore@hp.com>, linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, casey@schaufler-ca.com

Stephen Rothwell wrote:
> Hi Paul,
>
> Today's linux-next merge of the lblnet tree got a conflicts in
> security/smack/smack_lsm.c and security/smack/smackfs.c between commits
> 86a264abe542cfececb4df129bc45a0338d8cdb9 ("CRED: Wrap current->cred and a
> few other accessors") and d84f4f992cbd76e8f39c488cf0c5d123843923b1
> ("CRED: Inaugurate COW credentials") from the security-testing tree and
> commit d936691ab765fbac809e9a05c7f0c36ce2c2119e ("smack: Add support for
> unlabeled network hosts and networks") from the lblnet tree.
>
> I fixed it up (see below) and can carry the fixes as necessary.
>   
I don't see any problems with the changes. Thank you.
