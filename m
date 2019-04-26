From: Petr Mladek <pmladek@suse.com>
Subject: Re: linux-next: Fixes tag needs some work in the printk tree
Date: Fri, 26 Apr 2019 09:37:32 +0200
Message-ID: <20190426073732.mjen7hqw3skhb67x@pathway.suse.cz>
References: <20190425233049.7e2283b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190425233049.7e2283b0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu 2019-04-25 23:30:49, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   e43bb4d0feb8 ("vsprintf: Consistent %pK handling for kptr_restrict == 0")
> 
> Fixes tag
> 
>   Fixes: commit ef0010a30935de4e0211 ("vsprintf: don't use 'restricted_pointer()' when not restricting")
> 
> has these problem(s):
> 
>   - leading word 'commit' unexpected

Thanks for the report! I have just fixed it.

Best Regards,
Petr
