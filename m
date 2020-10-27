Return-Path: <SRS0=G6w6=EC=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB360C55178
	for <linux-next@archiver.kernel.org>; Tue, 27 Oct 2020 18:14:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B56121556
	for <linux-next@archiver.kernel.org>; Tue, 27 Oct 2020 18:14:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1825940AbgJ0SOq (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 27 Oct 2020 14:14:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:44666 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2507446AbgJ0OM6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Oct 2020 10:12:58 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 4E8FFAC1D;
        Tue, 27 Oct 2020 14:12:57 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 1540FDA6E2; Tue, 27 Oct 2020 15:11:22 +0100 (CET)
Date:   Tue, 27 Oct 2020 15:11:22 +0100
From:   David Sterba <dsterba@suse.cz>
To:     Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the btrfs-fixes tree
Message-ID: <20201027141122.GD6756@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz,
        Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201027020128.1034187a@canb.auug.org.au>
 <SN4PR0401MB3598D1F53CA93C24F85610349B190@SN4PR0401MB3598.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN4PR0401MB3598D1F53CA93C24F85610349B190@SN4PR0401MB3598.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 26, 2020 at 03:04:40PM +0000, Johannes Thumshirn wrote:
> On 26/10/2020 16:01, Stephen Rothwell wrote:
> > Hi all,
> > 
> > In commit
> > 
> >   ae1a53ee21a5 ("btrfs: don't fallback to buffered read if we don't need to")
> > 
> > Fixes tag
> > 
> >   Fixes: b5ff9f1a96e8f ("btrfs: switch to iomap for direct IO")
> > 
> > has these problem(s):
> > 
> >   - Target SHA1 does not exist
> > 
> > Maybe you meant
> > 
> > Fixes: f85781fb505e ("btrfs: switch to iomap for direct IO")
> > 
> 
> Hmm b5ff9f1a96e8f exists in my tree. Probably something stale.

Same for me, the correct one is indeed f85781fb505ec028917, I'll push
an update.
