From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm64 tree
Date: Mon, 13 Nov 2017 15:44:02 +0000
Message-ID: <20171113154400.GA29665@arm.com>
References: <20171107163117.5aeaac71@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171107163117.5aeaac71@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>
List-Id: linux-next.vger.kernel.org

On Tue, Nov 07, 2017 at 04:31:17PM +1100, Stephen Rothwell wrote:
> Hi Catalin,
> 
> Commit
> 
>   2c0db5b45071 ("rm64: Implement __lshrti3 library function")
> 
> is missing a Signed-off-by from its author.

Bugger; my fault. I split Jason's patch in a hurry so that it applied on
top of his old one (that I'd already pushed) and forgot his SoB, despite
getting the authorship right.

Given that this is HEAD on arm64 and nobody is using that as a base, I'll
do the --amend and repush.

Sorry about the mess.

Will
