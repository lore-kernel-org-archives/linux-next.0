From: Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com>
Subject: [PATCH 2/2] mm/linux-next: Fix rcu locking in vm_is_stack
Date: Wed,  7 Mar 2012 01:46:34 +0530
Message-ID: <1331064994-6693-2-git-send-email-siddhesh.poyarekar@gmail.com>
References: <1331045377.17099.2.camel@deneb.redhat.com>
 <1331064994-6693-1-git-send-email-siddhesh.poyarekar@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1331064994-6693-1-git-send-email-siddhesh.poyarekar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Salter <msalter@redhat.com>
Cc: linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Oleg Nesterov <oleg@redhat.com>, Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com>
List-Id: linux-next.vger.kernel.org

Take rcu read lock before we do anything at all with the threadgroup
list. Also use list_first_entry_rcu to safely get the reference to the
first task in the list.

Signed-off-by: Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com>
---
 mm/memory.c |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 0ca7fe6..1d5830c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3932,18 +3932,20 @@ pid_t vm_is_stack(struct task_struct *task,
 		return task->pid;
 
 	if (in_group) {
-		struct task_struct *t = task;
+		struct task_struct *t;
 		rcu_read_lock();
-		while_each_thread(task, t) {
+		t = list_first_entry_rcu(&task->thread_group,
+					 struct task_struct, thread_group);
+		do {
 			if (vm_is_stack_for_task(t, vma)) {
 				ret = t->pid;
 				goto done;
 			}
-		}
+		} while_each_thread(task, t);
+done:
+		rcu_read_unlock();
 	}
 
-done:
-	rcu_read_unlock();
 	return ret;
 }
 
-- 
1.7.7.4
