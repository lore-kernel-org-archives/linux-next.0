Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987A6C7EE22
	for <linux-next@archiver.kernel.org>; Tue, 16 May 2023 02:23:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjEPCX2 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 15 May 2023 22:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjEPCX1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 May 2023 22:23:27 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C339AB8;
        Mon, 15 May 2023 19:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=OUqbepUxZ6cBSoXVCpOctGyinqNw5foAduLex2Z3q0s=; b=1AggPCNldVfjBGC7jZHc3KpvuR
        mASQoYsCAryZpbyDxxNG87gASEpiLVYzNcbETBggElOEPSSAx1WpBzsMY+1rZyu58qxes0d11yF0D
        uDIr+R9H067t0cbNADthU9mXpT34OekC24fFn2dcmWCbirmMy3Tq8v4AKIj4IQ6nmPvjb/1yb2ZlR
        JV6ODDY6p79RmmBeiM7358rKXnyUewpdoZOoBNLCfAOsR7UDsrfps3ZE00jOJ257JMe3enWQR+lGT
        Of5f34wozb/lzrTASTH7OPVErncaGmuKN18quyETcuPP4iIu6JYXQEnA83cV0rnvvKGYh9E/Chmbw
        LVgAv+MA==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1pykLV-00481z-1N;
        Tue, 16 May 2023 02:23:25 +0000
Message-ID: <81d74a8e-6bfb-5ed6-9851-faf120a6e9f8@infradead.org>
Date:   Mon, 15 May 2023 19:23:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: linux-next: Tree for May 15 (net/ipv4/ipconfig.c:)
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        David Ahern <dsahern@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Martin Wetterwald <martin@wetterwald.eu>
References: <20230515141235.0777c631@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230515141235.0777c631@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 5/14/23 21:12, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20230512:

../net/ipv4/ipconfig.c:177:12: warning: 'ic_nameservers_fallback' defined but not used [-Wunused-variable]
  177 | static int ic_nameservers_fallback __initdata;
      |            ^~~~~~~~~~~~~~~~~~~~~~~

-- 
~Randy
