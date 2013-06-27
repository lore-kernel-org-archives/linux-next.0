From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: manual merge of the cpuinit tree with the mips tree
Date: Thu, 27 Jun 2013 14:17:14 -0400
Message-ID: <51CC81AA.7090406@windriver.com>
References: <20130627184826.416dcb8c84d77f8455794829@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:50527 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753712Ab3F0SQp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 27 Jun 2013 14:16:45 -0400
In-Reply-To: <20130627184826.416dcb8c84d77f8455794829@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jayachandran C <jchandra@broadcom.com>, Ralf Baechle <ralf@linux-mips.org>

On 13-06-27 04:48 AM, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the cpuinit tree got a conflict in
> arch/mips/mm/tlbex.c between commits 8c24cb9d180b ("MIPS: Move generated
> code to .text for microMIPS") and d45accb44e19 ("MIPS: mm: Use scratch
> for PGD when !CONFIG_MIPS_PGD_C0_CONTEXT") from the mips tree and commit
> "MIPS: Delete __cpuinit/__CPUINIT usage from MIPS code" from the cpuinit
> tree.

Now fixed/refreshed, thanks!

P.
--

> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> Ralf, your merge commit e6d254aea905 ("Merge branch '3.10-fixes' into
> mips-for-linux-next") left some conflict markers in this file which I
> have removed as well.
> 
