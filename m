Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2A6C64E7A
	for <linux-next@archiver.kernel.org>; Tue,  1 Dec 2020 14:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 887BC2084C
	for <linux-next@archiver.kernel.org>; Tue,  1 Dec 2020 14:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391698AbgLAO4J (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 1 Dec 2020 09:56:09 -0500
Received: from www62.your-server.de ([213.133.104.62]:46088 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389342AbgLAO4I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 09:56:08 -0500
Received: from sslproxy03.your-server.de ([88.198.220.132])
        by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <daniel@iogearbox.net>)
        id 1kk73p-0008BG-4X; Tue, 01 Dec 2020 15:55:21 +0100
Received: from [85.7.101.30] (helo=pc-9.home)
        by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <daniel@iogearbox.net>)
        id 1kk73o-000UG1-U8; Tue, 01 Dec 2020 15:55:20 +0100
Subject: Re: linux-next: build failure after merge of the bpf-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexei Starovoitov <ast@kernel.org>,
        Networking <netdev@vger.kernel.org>
Cc:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201201190746.7d3357fb@canb.auug.org.au>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <63c8eaad-c977-fbaf-2b5c-b035851140ea@iogearbox.net>
Date:   Tue, 1 Dec 2020 15:55:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20201201190746.7d3357fb@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.102.4/26005/Tue Dec  1 15:16:58 2020)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/1/20 9:07 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bpf-next tree, today's linux-next build (x86_64
> allnoconfig) failed like this:
> 
> In file included from fs/select.c:32:
> include/net/busy_poll.h: In function 'sk_mark_napi_id_once':
> include/net/busy_poll.h:150:36: error: 'const struct sk_buff' has no member named 'napi_id'
>    150 |  __sk_mark_napi_id_once_xdp(sk, skb->napi_id);
>        |                                    ^~
> 
> Caused by commit
> 
>    b02e5a0ebb17 ("xsk: Propagate napi_id to XDP socket Rx path")
> 

Fixed it up in bpf-next, thanks for reporting!
