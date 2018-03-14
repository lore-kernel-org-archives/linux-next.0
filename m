From: Michal Hocko <mhocko@kernel.org>
Subject: Re: mmotm 2018-03-13-15-15 uploaded
Date: Wed, 14 Mar 2018 14:03:13 +0100
Message-ID: <20180314130313.GB23100@dhcp22.suse.cz>
References: <20180313221617.IBhUuE5FL%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180313221617.IBhUuE5FL%akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: broonie@kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, mm-commits@vger.kernel.org, sfr@canb.auug.org.au
List-Id: linux-next.vger.kernel.org

On Tue 13-03-18 15:16:17, Andrew Morton wrote:
> The mm-of-the-moment snapshot 2018-03-13-15-15 has been uploaded to
[...]
> To develop on top of mmotm git:
> 
>   $ git remote add mmotm git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git
>   $ git remote update mmotm
>   $ git checkout -b topic mmotm/master
>   <make changes, commit>
>   $ git send-email mmotm/master.. [...]

JFYI. After few missed mmotm updates while I was offline the tree is
back up-to-date.
-- 
Michal Hocko
SUSE Labs
