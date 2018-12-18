From: Petr Mladek <pmladek@suse.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the printk tree
Date: Tue, 18 Dec 2018 09:42:34 +0100
Message-ID: <20181218084234.sa2gplversistjzf@pathway.suse.cz>
References: <20181218070807.07cb795d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181218070807.07cb795d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue 2018-12-18 07:08:07, Stephen Rothwell wrote:
> Hi Petr,
> 
> Commit
> 
>   503283fa006d ("printk: Add caller information to printk() output.")
> 
> is missing a Signed-off-by from its committer.
> 
> Moreover, that patch appears twice in the tree (the other time properly
> signed-off),

Thanks a lot for the report. I have fixed it.

Sigh, I guess that I left there the duplicated patch from testing.
It is pity that git did not complain. I need to be more careful.

Best Regards,
Petr
