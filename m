From: Jeff Layton <jlayton@kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the iversion
 tree
Date: Mon, 01 Jan 2018 10:12:00 -0500
Message-ID: <1514819520.3675.1.camel@kernel.org>
References: <20180102014424.052eaa73@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180102014424.052eaa73@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: linux-next.vger.kernel.org

On Tue, 2018-01-02 at 01:44 +1100, Stephen Rothwell wrote:
> Hi Jeff,
> 
> Commit
> 
>   e9f12c2601ee ("ima: Use i_version only when filesystem supports it")
> 
> is missing a Signed-off-by from its committer.
> 

Thanks, I added my SoB. FWIW, my expectation is that that patch will go
in via the IMA tree and not via this PR.

Cheers,
-- 
Jeff Layton <jlayton@kernel.org>
