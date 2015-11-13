From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-merge tree with the scsi
 tree
Date: Fri, 13 Nov 2015 12:06:05 +1100
Message-ID: <20151113120605.267e2627@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Nicholas,

Today's linux-next merge of the target-merge tree got conflicts in
several files.  It looks like a newer version of all the commits in the
target-merge tree has been applied to the scsi tree, so I just dropped
the target-merge tree for today.  You might like to tidy it up with
respect to the current scsi tree.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
