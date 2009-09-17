From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: linux-next: manual merge of the blackfin tree with Linus' tree
Date: Wed, 16 Sep 2009 21:34:15 -0400
Message-ID: <8bd0f97a0909161834j328abe5aq96b7cb69893d1094@mail.gmail.com>
References: <20090917112604.acbae122.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f182.google.com ([209.85.210.182]:51306 "EHLO
	mail-yx0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758357AbZIQBeb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2009 21:34:31 -0400
In-Reply-To: <20090917112604.acbae122.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

On Wed, Sep 16, 2009 at 21:26, Stephen Rothwell wrote:
> Today's linux-next merge of the blackfin tree got a conflict in
> arch/blackfin/mm/sram-alloc.c between commit
> b9bf3121af348d9255f1c917830fe8c2df52efcb ("percpu: use
> DEFINE_PER_CPU_SHARED_ALIGNED()") from Linus' tree and commit
> 40bf94d6d1158fb6d6d67a666e6b16ab6ac3986e ("Blackfin: push SRAM locks =
down
> into related ifdefs") from the blackfin tree.
>
> The latter moved the code that the former modified. =C2=A0I fixed it =
up (see
> below) and can carry the fix for a while.

ive pulled down the latest mainline and rebased my branch onto it.
thanks for the heads up.
-mike
