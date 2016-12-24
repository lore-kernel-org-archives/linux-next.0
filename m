From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Sat, 24 Dec 2016 21:44:01 +1100
Message-ID: <20161224214401.521b2182@canb.auug.org.au>
References: <20161223114513.101402e4@canb.auug.org.au>
        <1482454594.2415.72.camel@HansenPartnership.com>
        <20161224123853.08284e8a@canb.auug.org.au>
        <20161224101508.GA12123@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54353 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753797AbcLXKoJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 24 Dec 2016 05:44:09 -0500
In-Reply-To: <20161224101508.GA12123@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Manish Rangankar <manish.rangankar@cavium.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Nilesh Javali <nilesh.javali@cavium.com>, Adheer Chandravanshi <adheer.chandravanshi@qlogic.com>, Chad Dupuis <chad.dupuis@cavium.com>, Saurav Kashyap <saurav.kashyap@cavium.com>, Arun Easi <arun.easi@cavium.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Hi Ingo,

On Sat, 24 Dec 2016 11:15:08 +0100 Ingo Molnar <mingo@kernel.org> wrote:
>
> Yeah, we'll handle it - that's why the final chunk of changes were left to after 
> -rc1, to not cause such merge conflicts upstream.

Excellent, thanks.

> For now I've excluded the relevant -tip side commits from the linux-next branch.

Well, there probably won't be any linux-next releases until Jan 3, so that's ok.

-- 
Cheers,
Stephen Rothwell
