From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the device-mapper
 tree
Date: Tue, 16 Jan 2018 00:27:36 +1100
Message-ID: <20180116002736.4d464214@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Commit

  34e1467da673 ("Revert "genirq/affinity: assign vectors to all possible CPUs"")

is missing a Signed-off-by from its author and committer.

Reverts are commits as well.

Though I do note it actually has a reasonable commit message, thanks.

-- 
Cheers,
Stephen Rothwell
