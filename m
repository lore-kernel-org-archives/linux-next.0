From: Konstantin Khlebnikov <khlebnikov@openvz.org>
Subject: [PATCH linux-next] mm: fix rcu-lock/unlock balance in vm_is_stack()
Date: Wed, 21 Mar 2012 00:54:55 +0400
Message-ID: <20120320205455.31285.23096.stgit@zurg>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Fix bug introduced in "procfs: mark thread stack correctly in proc/<pid>/maps"
(patch in mm/linux-next)

Signed-off-by: Konstantin Khlebnikov <khlebnikov@openvz.org>
---
 mm/memory.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index ee85fc4..cc08b86 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3932,13 +3932,12 @@ pid_t vm_is_stack(struct task_struct *task,
 		while_each_thread(task, t) {
 			if (vm_is_stack_for_task(t, vma)) {
 				ret = t->pid;
-				goto done;
+				break;
 			}
 		}
+		rcu_read_unlock();
 	}
 
-done:
-	rcu_read_unlock();
 	return ret;
 }
 
