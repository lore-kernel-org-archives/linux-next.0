From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: mmotm 2018-03-07-16-19 uploaded (UML & memcg)
Date: Wed, 7 Mar 2018 18:41:41 -0800
Message-ID: <20180307184141.3dff2f6c0f7d415912e50030@linux-foundation.org>
References: <20180308002016.L3JwBaNZ9%akpm@linux-foundation.org>
        <41ec9eeb-f0bf-e26d-e3ae-4a684c314360@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <41ec9eeb-f0bf-e26d-e3ae-4a684c314360@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: broonie@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz, mm-commits@vger.kernel.org, sfr@canb.auug.org.au, Shakeel Butt <shakeelb@google.com>
List-Id: linux-next.vger.kernel.org

On Wed, 7 Mar 2018 18:20:12 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:

> On 03/07/2018 04:20 PM, akpm@linux-foundation.org wrote:
> > The mm-of-the-moment snapshot 2018-03-07-16-19 has been uploaded to
> > 
> >    http://www.ozlabs.org/~akpm/mmotm/
> > 
> > mmotm-readme.txt says
> > 
> > README for mm-of-the-moment:
> > 
> > http://www.ozlabs.org/~akpm/mmotm/
> > 
> > This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> > more than once a week.
> 
> UML on i386 and/or x86_64:
> 
> defconfig, CONFIG_MEMCG is not set:
> 
> ../fs/notify/group.c: In function 'fsnotify_final_destroy_group':
> ../fs/notify/group.c:41:24: error: dereferencing pointer to incomplete type
>    css_put(&group->memcg->css);

oops.

From: Andrew Morton <akpm@linux-foundation.org>
Subject: fs-fsnotify-account-fsnotify-metadata-to-kmemcg-fix

fix CONFIG_MEMCG=n build

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Christoph Lameter <cl@linux.com>
Cc: David Rientjes <rientjes@google.com>
Cc: Greg Thelen <gthelen@google.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Vladimir Davydov <vdavydov.dev@gmail.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 fs/notify/group.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/fs/notify/group.c~fs-fsnotify-account-fsnotify-metadata-to-kmemcg-fix
+++ a/fs/notify/group.c
@@ -38,7 +38,7 @@ static void fsnotify_final_destroy_group
 		group->ops->free_group_priv(group);
 
 	if (group->memcg)
-		css_put(&group->memcg->css);
+		mem_cgroup_put(group->memcg);
 
 	kfree(group);
 }
_
