Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6061CC433E9
	for <linux-next@archiver.kernel.org>; Mon,  1 Feb 2021 14:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A2796024A
	for <linux-next@archiver.kernel.org>; Mon,  1 Feb 2021 14:44:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhBAOoe (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 1 Feb 2021 09:44:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbhBAOmg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Feb 2021 09:42:36 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6869FC061573;
        Mon,  1 Feb 2021 06:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ao/81DetTUj9Oijf6UqzNjcJKUmoksPRJNzcAIa0ZIQ=; b=KafbwzfIrLFeN2e9RtrZPMO2uY
        Tgd8PlIpRfmc5TJH1p5JivHTYkAwZ2bhAvO3VgFHP+GA8V/XDmjhibYs8V3vcRQZwuMVZ7Z1R6q5A
        6LTQCst9IfX5JFruko0ST9QBRLfadVYKhUQLfYbO7/w80iLndCsK/kUG7yFN6QlyhotfQPxW+vn4W
        3X5NLY8KaN2K9yaB895ov8gqXMxY8rlOoLXB/H01dIBxWHjdqGxZdIggIEqFedRJoVimiUzWqPJ7g
        MVZ9OccARltVFENyNYZS/C7muGZLIM2Zz+9BziAvb7XM/XSDJYG/eRPkoKZqxPnHoSKJuFP0KEs3q
        lWV7peRQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l6aNB-00DtQM-V9; Mon, 01 Feb 2021 14:40:14 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E4B7F3003D8;
        Mon,  1 Feb 2021 15:40:12 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id B120F2C967E83; Mon,  1 Feb 2021 15:40:12 +0100 (CET)
Date:   Mon, 1 Feb 2021 15:40:12 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Valentin Schneider <valentin.schneider@arm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: qemu boot failure after merge of the tip tree
Message-ID: <YBgSzPcVILEtk4Yy@hirez.programming.kicks-ass.net>
References: <20210201200918.386682c5@canb.auug.org.au>
 <jhjv9bcym5d.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jhjv9bcym5d.mognet@arm.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 01, 2021 at 01:04:30PM +0000, Valentin Schneider wrote:
> On 01/02/21 20:09, Stephen Rothwell wrote:
> > Hi all,
> >
> 
> Hi Stephen,
> 
> > After merging the tip tree, today's linux-next qemu boot test (powerpc
> > pseries_le_defconfig) failed like this:
> 
> In case you haven't seen it, Dietmar did the dirty work and fixed my fail
> at
> 
>   http://lore.kernel.org/r/6000e39e-7d28-c360-9cd6-8798fd22a9bf@arm.com

Right, picked that up, I'll try and push it before the next next ;-)
