From: Gary R Hook <gary.hook@amd.com>
Subject: Re: linux-next: build warning after merge of the crypto tree
Date: Mon, 31 Jul 2017 08:50:28 -0500
Message-ID: <25e2301b-258c-df38-3417-d446b820e924@amd.com>
References: <20170731121756.6f54cadf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-by2nam03on0046.outbound.protection.outlook.com ([104.47.42.46]:9568
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751054AbdGaNvK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 31 Jul 2017 09:51:10 -0400
In-Reply-To: <20170731121756.6f54cadf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 07/30/2017 09:17 PM, Stephen Rothwell wrote:
> Hi Herbert,
>
> After merging the crypto tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/crypto/ccp/ccp-ops.c: In function 'ccp_run_rsa_cmd':
> drivers/crypto/ccp/ccp-ops.c:1856:3: warning: 'sb_count' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    cmd_q->ccp->vdata->perform->sbfree(cmd_q, op.sb_key, sb_count);
>    ^
>
> Maybe introduced by commit
>
>   6ba46c7d4d7e ("crypto: ccp - Fix base RSA function for version 5 CCPs")
>

Actually, it's been this way for a while: 956ee21 should be the commit 
that introduced the spurious warning.

If you can explain to me a way to get the compiler to either (a) be 
smarter, or (b) shut up about this, I'd like to hear it. I see this with 
gcc 4.8/4.9/50.

IMO the compiler is incorrect. The code path where the variable is used 
is complete, and the path where it is unused is complete. I don't see a 
way for a logic error (and thus, use an uninitialized variable) to occur.

If someone can enlighten me, I'd appreciate it. Or, I can change the 
code to recompute the value when it's needed.
