From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: Fixes tag needs some work in the ext3 tree
Date: Mon, 1 Apr 2019 10:10:54 +0200
Message-ID: <20190401081054.GC4826@quack2.suse.cz>
References: <20190330161939.231c39cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190330161939.231c39cd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, yangerkun <yangerkun@huawei.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen

On Sat 30-03-19 16:19:39, Stephen Rothwell wrote:
> In commit
> 
>   47d92aa5d33a ("quota: fix a problem about transfer quota")
> 
> Fixes tag
> 
>   Fixes: 7b9ca4c61("quota: Reduce contention on dq_data_lock")
> 
> has these problem(s):
> 
>   - missing space between the SHA1 and the subject
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Thanks for the notice. I didn't notice the problems when merging the patch.
I've fixed these problems up.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
