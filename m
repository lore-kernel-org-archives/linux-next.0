Return-Path: <SRS0=yk7U=AF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3207C433DF
	for <linux-next@archiver.kernel.org>; Wed, 24 Jun 2020 07:56:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D29372085B
	for <linux-next@archiver.kernel.org>; Wed, 24 Jun 2020 07:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592985370;
	bh=j5+LBYVd8DR8wdaBsQhlkf1drPcbVXynthgjqgSEmHw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-ID:From;
	b=0WPfaqeFTu62lGqfemik5SriU/MxoDVdNOxTJnaeTEiFyVc3b5tXKofqdxxnV7gbu
	 KNI5GgM8AJ2U7wiD05Z+O8K5MHBfzqr44ecmo3BRpbYnuwLFS3GjffvkYcST3nwmGh
	 nS102nbdpEhs8T2BMN0V8XVHK9MkMjo58WsdFQ8A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388849AbgFXH4K (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 24 Jun 2020 03:56:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:54202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388690AbgFXH4K (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Jun 2020 03:56:10 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02B2A2088E;
        Wed, 24 Jun 2020 07:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592985369;
        bh=j5+LBYVd8DR8wdaBsQhlkf1drPcbVXynthgjqgSEmHw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ETAxDlTguNfR9AX4210sNW7fe5oxe96ktVB16oPEuBPHrIfuCxsQkiC+GNHcSasG3
         ZWaPnSSwiPBKYA0a9hvFMTFFODz6KmzLJyX2lCGLPgz15rxbF76eHpAjLADwtKIIR3
         H09YUEvtgbiGbpFEO66PCN2VF/aNan4WkJVx+fKY=
Date:   Wed, 24 Jun 2020 09:56:07 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the hid tree
In-Reply-To: <20200624175247.6c7427c8@canb.auug.org.au>
Message-ID: <nycvar.YFH.7.76.2006240955080.13242@cbobk.fhfr.pm>
References: <20200624175247.6c7427c8@canb.auug.org.au>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 24 Jun 2020, Stephen Rothwell wrote:

> Commit
> 
>   6d7ccae2e093 ("Revert "HID: allow building hid.ko as an external module"")
> 
> is missing a Signed-off-by from its author and committer.
> 
> Reverts are commits as well and need SOB tags and (preferably) an
> explanatory commit message.

The commit+revert pair is there only for linux-next (to maintain linear 
history there), the branch that contains the actual buggy commit will 
never make it to Linus.

Thanks,

-- 
Jiri Kosina
SUSE Labs

