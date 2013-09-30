From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: linux-next: manual merge of the cgroup tree
Date: Mon, 30 Sep 2013 13:26:05 +0200
Message-ID: <1380540373-25352-3-git-send-email-treding@nvidia.com>
References: <1380540373-25352-1-git-send-email-treding@nvidia.com>
Return-path: <cgroups-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380540373-25352-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: cgroups-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Li Zefan <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: cgroups-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the cgroup tree got conflicts in

	mm/memcontrol.c

I fixed it up (see below). Please check if the resolution looks correct.

Thanks,
Thierry
---
diff --cc mm/memcontrol.c
index 1c52ddb,65a46ef..84dcc5c
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@@ -6203,9 -5979,6 +6216,8 @@@ static void __mem_cgroup_free(struct me
  	int node;
  	size_t size = memcg_size();
  
 +	mem_cgroup_remove_from_trees(memcg);
- 	free_css_id(&mem_cgroup_subsys, &memcg->css);
 +
  	for_each_node(node)
  		free_mem_cgroup_per_zone_info(memcg, node);
  
