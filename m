From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for July 29
Date: Tue, 29 Jul 2008 18:25:14 +0200
Message-ID: <200807291825.14281.bzolnier@gmail.com>
References: <20080729172337.b3d74100.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.187]:2652 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752294AbYG2Q1l (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 29 Jul 2008 12:27:41 -0400
Received: by nf-out-0910.google.com with SMTP id d3so1716032nfc.21
        for <linux-next@vger.kernel.org>; Tue, 29 Jul 2008 09:27:39 -0700 (PDT)
In-Reply-To: <20080729172337.b3d74100.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <haveblue@us.ibm.com>, Greg KH <gregkh@suse.de>


Hi,

On Tuesday 29 July 2008, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since next-20080728:

I keep reverting commit 0e3638d1e04040121af00195f7e4628078246489 ("warn
when statically-allocated kobjects are used") with each linux-next release
to make it work on my x86_32 laptop (http://lkml.org/lkml/2008/7/19/114).

Depending on the day I either forget to revert it on a first try or (lead by
incurable optimism) I don't try to revert it in hope that it was fixed.

Unfortunately the result is always the same cursing-during-qemu-test-run
-> git-revert -> recompile cycle and a needless time loss.

Could we have some action taken please?

Thanks,
Bart
