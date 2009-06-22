From: Thorsten Leemhuis <fedora@leemhuis.info>
Subject: Re: linux-next: Tree for June 22
Date: Mon, 22 Jun 2009 19:23:31 +0200
Message-ID: <4A3FBE13.9050201@leemhuis.info>
References: <20090622181920.496d160e.sfr@canb.auug.org.au> <20090622182600.129da88e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from basicbox7.server-home.net ([195.137.212.29]:37274 "EHLO
	basicbox7.server-home.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751982AbZFVRri (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Jun 2009 13:47:38 -0400
In-Reply-To: <20090622182600.129da88e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

/me drops LKML from CC, as this is linux-next specific

Hi!

Just a quick question from a git rookie:

On 22.06.2009 10:26, Stephen Rothwell wrote:
> On Mon, 22 Jun 2009 18:19:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Changes since 20090619:
> 
> The current "git diff --stat -M stable..HEAD^" ends like this:

Side note: above command doesn't work here (Fedora 11, git version 1.6.2.2):

$ git diff --stat -M 'stable..HEAD^'
fatal: ambiguous argument 'stable..HEAD^': unknown revision or path not
in the working tree.
Use '--' to separate paths from revisions

This command OTOH...
$ git diff --stat -M 'origin/stable..origin/HEAD^'
...seems to work just fine and gives the result your posted:


> 	835 files changed, 46602 insertions(+), 14044 deletions(-)

I just mention it because it might be relevant. The real reason why I
write this mail is this:

Is it possible somehow to export the individual patches that are
currently in linux-next? I tried

 git format-patch -M -o ../tmp 'origin/stable..origin/HEAD^'

but that resulted in 3269 files with commits/patches that sum up to
38 MByte. Some of those patches (seems 1919 alone from the KVM tree...)
are quite old. The first one for example is
0001-KVM-mmu-add-missing-dirty-page-tracking-cases.patch :
"""
> From 2959cd13ecc1fbe1b2339937481844ff963f1e7f Mon Sep 17 00:00:00 2001
> From: Avi Kivity <avi@qumranet.com>
> Date: Mon, 19 Feb 2007 14:37:46 +0200
> Subject: [PATCH 0001/3269] KVM: mmu: add missing dirty page tracking cases
> 
> We fail to mark a page dirty in three cases:
> 
> - setting the accessed bit in a pte
> - setting the dirty bit in a pte
> - emulating a write into a pagetable
> 
> This fix adds the missing cases.
> [...]
"""

It afaics was merged in linus tree ages ago:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=bf3f8e86c2e22b9bd1375be1bbbd67384dba4342

I suspect I do something wrong, but I could not find what exactly what
I'm doing wrong... Could anybody give me some insight/help? tia!

CU
knurd
