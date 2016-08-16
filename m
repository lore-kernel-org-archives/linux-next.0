From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: linux next naive question
Date: Tue, 16 Aug 2016 13:39:55 -0700
Message-ID: <28b3b6db-bc24-24cb-c5bd-6d46a65d489e@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next <linux-next@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

[Now in plain text]

Hi Stephan,

For preparing linux-next is there a specific merge strategy / script foo for
pulling branches from same developers repo. So for ARC there's for-curr and
for-next, and a lot of times they might have potentially conflicting changes, base
lines etc. It seem in linux-next for-curr is added first and then for-next - a
very likely case is for-next being significantly behind for-curr with a few
straggler changes.

The reason I ask is we want to implement something similar in our existing
regression setup - which builds / boot/ test jobs on several platforms but
currently only uses my kernel.org repo's for-next - I want to expose both the
branches w/o having to explicitly replicate duplicate changes in my for-next from
for-curr

Thx,
-Vineet
