Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF29C38145
	for <linux-next@archiver.kernel.org>; Tue,  6 Sep 2022 19:47:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiIFTrR (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 6 Sep 2022 15:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiIFTrM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Sep 2022 15:47:12 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF08D86B76;
        Tue,  6 Sep 2022 12:47:10 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 5E6AD1FA09;
        Tue,  6 Sep 2022 19:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1662493629;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DwH1ufYcHzC/feIIZGsKI+YtePgH8+k2pybBbAJK9J0=;
        b=uaHr6eqCoS75A2c6MQDXSTw5AZoFT92trHaxq/GbXJ9Ecsa+NFk5yaelb8reeG4wNpVFtv
        ilgmc9vlfL7gU7oa7uhO4ekX3xUgALDLHi1NpPNaf1Dhxm0xh1SNNR0nMyAf+C8zGJV4i6
        sZxMN6ffSp9/un8JYQ3Fd7xtTZzuijE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1662493629;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DwH1ufYcHzC/feIIZGsKI+YtePgH8+k2pybBbAJK9J0=;
        b=jCEZ9xumltgwPiq5/DORbUlZuKzdXlkOSnzC1ZozjfEr/KZ05Yb63+/rampBPcLVXl+Z/8
        f0KhDT35/G7VQhAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 259C113A7A;
        Tue,  6 Sep 2022 19:47:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Ymw9CL2jF2NeCAAAMHmgww
        (envelope-from <dsterba@suse.cz>); Tue, 06 Sep 2022 19:47:09 +0000
Date:   Tue, 6 Sep 2022 21:41:46 +0200
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Sterba <dsterba@suse.com>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Josef Bacik <josef@toxicpanda.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the btrfs tree with the btrfs-fixes
 tree
Message-ID: <20220906194146.GV13489@suse.cz>
Reply-To: dsterba@suse.cz
References: <20220906095055.498d90ea@canb.auug.org.au>
 <20220906101549.1cfee0d4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906101549.1cfee0d4@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 06, 2022 at 10:15:49AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 6 Sep 2022 09:50:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the btrfs tree got a conflict in:
> > 
> >   fs/btrfs/zoned.c
> > 
> > between commit:
> > 
> >   6ca64ac27631 ("btrfs: zoned: fix mounting with conventional zones")
> > 
> > from the btrfs-fixes tree and commit:
> > 
> >   e5182af66852 ("btrfs: convert block group bit field to use bit helpers")
> > 
> > from the btrfs tree.
> > 
> > I fixed it up (the former removed some of the code modified by the latter)
> > and can carry the fix as necessary. This is now fixed as far as linux-next
> > is concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
> 
> Actually the fix up is below ...

Thanks, looks correct to me. I've pushed a new for-next snapshot that
has the conflict resolved too.
