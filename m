From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the cgroup tree
Date: Tue,  1 Oct 2013 13:07:19 +0200
Message-ID: <1380625644-11331-3-git-send-email-treding@nvidia.com>
References: <20131001110344.GA20249@ulmo.nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131001110344.GA20249@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@suse.cz>, Balbir Singh <bsingharora@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the cgroup tree got a conflict in:

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
  
