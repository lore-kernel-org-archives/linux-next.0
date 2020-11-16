Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A1DC6369E
	for <linux-next@archiver.kernel.org>; Mon, 16 Nov 2020 17:16:31 +0000 (UTC)
Received: from vger.kernel.org (unknown [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40664222EC
	for <linux-next@archiver.kernel.org>; Mon, 16 Nov 2020 17:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40664222EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-next-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731706AbgKPRQI (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 16 Nov 2020 12:16:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730459AbgKPRQI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Nov 2020 12:16:08 -0500
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:12e:520::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02524C0613CF;
        Mon, 16 Nov 2020 09:16:08 -0800 (PST)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1kei6i-0007at-NP; Mon, 16 Nov 2020 18:16:00 +0100
Date:   Mon, 16 Nov 2020 18:16:00 +0100
From:   Florian Westphal <fw@strlen.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jakub Kicinski <kuba@kernel.org>, Florian Westphal <fw@strlen.de>,
        Matthieu Baerts <matthieu.baerts@tessares.net>,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Willem de Bruijn <willemb@google.com>,
        linux-next@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v4] net: linux/skbuff.h: combine SKB_EXTENSIONS
 + KCOV handling
Message-ID: <20201116171600.GD22792@breakpoint.cc>
References: <20201116031715.7891-1-rdunlap@infradead.org>
 <ffe01857-8609-bad7-ae89-acdaff830278@tessares.net>
 <20201116143121.GC22792@breakpoint.cc>
 <20201116073013.24d45385@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <53e73344-3a3a-4a11-9914-8490efa1a3b9@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53e73344-3a3a-4a11-9914-8490efa1a3b9@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> wrote:
> On 11/16/20 7:30 AM, Jakub Kicinski wrote:
> > On Mon, 16 Nov 2020 15:31:21 +0100 Florian Westphal wrote:
> >>>> @@ -4151,12 +4150,11 @@ enum skb_ext_id {
> >>>>   #if IS_ENABLED(CONFIG_MPTCP)
> >>>>   	SKB_EXT_MPTCP,
> >>>>   #endif
> >>>> -#if IS_ENABLED(CONFIG_KCOV)
> >>>>   	SKB_EXT_KCOV_HANDLE,
> >>>> -#endif  
> >>>
> >>> I don't think we should remove this #ifdef: the number of extensions are
> >>> currently limited to 8, we might not want to always have KCOV there even if
> >>> we don't want it. I think adding items in this enum only when needed was the
> >>> intension of Florian (+cc) when creating these SKB extensions.
> >>> Also, this will increase a tiny bit some structures, see "struct skb_ext()".  
> >>
> >> Yes, I would also prefer to retrain the ifdef.
> >>
> >> Another reason was to make sure that any skb_ext_add(..., MY_EXT) gives
> >> a compile error if the extension is not enabled.
> > 
> > Oh well, sorry for taking you down the wrong path Randy!
> 
> No problem.
> So we are back to v2, right?

Yes, you can still drop the line

>> +#if IS_ENABLED(CONFIG_KCOV) && IS_ENABLED(CONFIG_SKB_EXTENSIONS)

for enum skb_ext_id (alreadyt under SKB_EXTENSIONS).

Other than that v2 looks good to me.

Thanks!
