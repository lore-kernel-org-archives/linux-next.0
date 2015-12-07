From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the cgroup tree with Linus' tree
Date: Mon, 7 Dec 2015 10:20:32 -0500
Message-ID: <20151207152032.GC9175@mtj.duckdns.org>
References: <20151207173605.37fe583d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151207173605.37fe583d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nina Schiff <ninasc@fb.com>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

Hello,

Resolved from cgroup/for-4.4-fixes side.

Thanks.

------ 8< ------
commit 0b98f0c04245877ae0b625a7f0aa55b8ff98e0c4
Merge: 67cde9c 527e931
Author: Tejun Heo <tj@kernel.org>
Date:   Mon Dec 7 10:09:03 2015 -0500

    Merge branch 'master' into for-4.4-fixes
    
    The following commit which went into mainline through networking tree
    
      3b13758f51de ("cgroups: Allow dynamically changing net_classid")
    
    conflicts in net/core/netclassid_cgroup.c with the following pending
    fix in cgroup/for-4.4-fixes.
    
      1f7dd3e5a6e4 ("cgroup: fix handling of multi-destination migration from subtree_control enabling")
    
    The former separates out update_classid() from cgrp_attach() and
    updates it to walk all fds of all tasks in the target css so that it
    can be used from both migration and config change paths.  The latter
    drops @css from cgrp_attach().
    
    Resolve the conflict by making cgrp_attach() call update_classid()
    with the css from the first task.  We can revive @tset walking in
    cgrp_attach() but given that net_cls is v1 only where there always is
    only one target css during migration, this is fine.
    
    Signed-off-by: Tejun Heo <tj@kernel.org>
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Cc: Nina Schiff <ninasc@fb.com>

diff --cc net/core/netclassid_cgroup.c
index 81cb3c7,2e4df84..d9ee8d0
--- a/net/core/netclassid_cgroup.c
+++ b/net/core/netclassid_cgroup.c
@@@ -67,19 -67,25 +67,27 @@@ static int update_classid_sock(const vo
  	return 0;
  }
  
- static void cgrp_attach(struct cgroup_taskset *tset)
+ static void update_classid(struct cgroup_subsys_state *css, void *v)
  {
+ 	struct css_task_iter it;
  	struct task_struct *p;
- 	struct cgroup_subsys_state *css;
- 
- 	cgroup_taskset_for_each(p, css, tset) {
- 		struct cgroup_cls_state *cs = css_cls_state(css);
- 		void *v = (void *)(unsigned long)cs->classid;
  
+ 	css_task_iter_start(css, &it);
+ 	while ((p = css_task_iter_next(&it))) {
  		task_lock(p);
- 		iterate_fd(p->files, 0, update_classid, v);
+ 		iterate_fd(p->files, 0, update_classid_sock, v);
  		task_unlock(p);
  	}
+ 	css_task_iter_end(&it);
+ }
+ 
 -static void cgrp_attach(struct cgroup_subsys_state *css,
 -			struct cgroup_taskset *tset)
++static void cgrp_attach(struct cgroup_taskset *tset)
+ {
++	struct cgroup_subsys_state *css;
++
++	cgroup_taskset_first(tset, &css);
+ 	update_classid(css,
+ 		       (void *)(unsigned long)css_cls_state(css)->classid);
  }
  
  static u64 read_classid(struct cgroup_subsys_state *css, struct cftype *cft)
