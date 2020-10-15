Return-Path: <SRS0=dTEO=DW=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B98C433DF
	for <linux-next@archiver.kernel.org>; Thu, 15 Oct 2020 14:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4C622076B
	for <linux-next@archiver.kernel.org>; Thu, 15 Oct 2020 14:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730736AbgJOOnn (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 15 Oct 2020 10:43:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:51082 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730674AbgJOOnn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 10:43:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 45F8BAC24;
        Thu, 15 Oct 2020 14:43:41 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id A7717DA7C3; Thu, 15 Oct 2020 16:42:13 +0200 (CEST)
Date:   Thu, 15 Oct 2020 16:42:13 +0200
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Sterba <dsterba@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the btrfs tree with Linus' tree
Message-ID: <20201015144213.GP6756@twin.jikos.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20201015113530.115e0361@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015113530.115e0361@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 15, 2020 at 11:35:30AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Please do *not* rebase/rewrite your linux-next included tree and then
> immediately send it to Linus.  Or if you do, the please also update
> what you have in linux-next (so you can sneak it past me :-().
> (mutter, mutter, unnecessary conflicts :-().
> 
> I have dropped the brtfs tree from linux-next today.

I've pushed updated for-next and next-fixes to k.org, sorry for
inconvenience.
