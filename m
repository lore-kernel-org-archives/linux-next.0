From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the akpm-current tree
Date: Thu, 24 Aug 2017 17:41:59 +1000
Message-ID: <20170824174159.67177da2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changwei Ge <ge.changwei@h3c.com>, Mark Fasheh <mfasheh@versity.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

fs/ocfs2/dlm/dlmrecovery.c: In function 'dlm_free_dead_locks':
fs/ocfs2/dlm/dlmrecovery.c:2306:6: warning: unused variable 'i' [-Wunused-variable]
  int i;
      ^
fs/ocfs2/dlm/dlmrecovery.c:2305:20: warning: unused variable 'queue' [-Wunused-variable]
  struct list_head *queue = NULL;
                    ^

Caused by commit

  d09f2c6cf3b8 ("ocfs2: re-queue AST or BAST if sending is failed to improve the reliability")

-- 
Cheers,
Stephen Rothwell
