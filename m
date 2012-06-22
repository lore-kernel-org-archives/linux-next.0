From: Michal Hocko <mhocko@suse.cz>
Subject: Re: mmotm 2012-06-21-16-20 uploaded
Date: Fri, 22 Jun 2012 11:23:27 +0200
Message-ID: <20120622092327.GA5742@tiehlicka.suse.cz>
References: <20120621232149.F0286A026A@akpm.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <20120621232149.F0286A026A@akpm.mtv.corp.google.com>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu 21-06-12 16:21:49, Andrew Morton wrote:
> The mm-of-the-moment snapshot 2012-06-21-16-20 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/

And from now on, memcg-devel tree[1] will not only pick up memcg
relevant patches but all patches in the mm section.
The tree was mainly focused on memcg development in the past but it
seems that having all mm and memcg patches together would be much easier
and also non memcg developers could benefit from it.

The tree will not be rebased (unlike linux-next) and after Linus
releases X.Y a new branch (since-X.Y) will be created and the current
stack rebased on top of vX.Y tag. Old branches stay at the place.

Please note that the tree doesn't substitute mmotm and all the changes
still fly through Andrew. The sole purpose of the tree is to make git
worklows for -mm development easier.

Thanks Andrew for helping me with this and tweaking his series file to
make it as much automated as possible.

---
[1] https://github.com/mstsxfx/memcg-devel.git

-- 
Michal Hocko
SUSE Labs
SUSE LINUX s.r.o.
Lihovarska 1060/12
190 00 Praha 9    
Czech Republic

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
