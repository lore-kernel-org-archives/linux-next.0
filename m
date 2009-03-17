From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree with the s390 tree
Date: Tue, 17 Mar 2009 13:15:36 +1030
Message-ID: <200903171315.37237.rusty@rustcorp.com.au>
References: <20090317133527.306e4be1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:56402 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753216AbZCQCpk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 22:45:40 -0400
In-Reply-To: <20090317133527.306e4be1.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

On Tuesday 17 March 2009 13:05:27 Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next merge of the rr tree got a conflict in
> arch/s390/include/asm/tlbflush.h between commit
> e6f19dbd10f5d871750ee3fb03e2e99a06eebf92 ("[S390] cpumask: use mm_cpumask
> () wrapper") from the s390 tree and commit
> 49797d75185490d793bd5bd5db50f143ee8c9d89 ("cpumask:use-mm_cpumask-s390")
> from the rr tree.
> 
> I assumed that the rr tree version was the correct version and used that.

Actually, they took my pull, and Martin mentioned a fix.

I'll drop my version from linux-next for tomorrow.

Thanks!
Rusty.
