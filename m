Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F94C4741F
	for <linux-next@archiver.kernel.org>; Tue, 10 Nov 2020 01:07:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E52982078D
	for <linux-next@archiver.kernel.org>; Tue, 10 Nov 2020 01:07:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bB2rmL4g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730521AbgKJBHR (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 9 Nov 2020 20:07:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41189 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730490AbgKJBHR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2020 20:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604970436;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mTXlKfTWyct7ELa6NUDaZ2WTzRPRy3oG569ol0gWKuc=;
        b=bB2rmL4gk0mc+6nOzR1T2/dWzIBcKodvotGx+zuxGQRikD0mLW296cj47EKZ2wEPsmdnLm
        /SxXa3BPmulY4LrrcS/9Y0JJUAcZJWdFyoRrQQ5OYvQyOW7Q49GQpNz+2JpGzx/IXZ/Hxu
        SPJJfFhXzdUh8o57KELBVRH1ueZkYCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-n82JQp1uOrCTpvc-D-ELlg-1; Mon, 09 Nov 2020 20:07:14 -0500
X-MC-Unique: n82JQp1uOrCTpvc-D-ELlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF1AD56C2E;
        Tue, 10 Nov 2020 01:07:12 +0000 (UTC)
Received: from ovpn-66-145.rdu2.redhat.com (unknown [10.10.67.145])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B433C100238C;
        Tue, 10 Nov 2020 01:07:11 +0000 (UTC)
Message-ID: <737d5be9eb5af55b1a61bd8bfb49b1829a3ff916.camel@redhat.com>
Subject: Re: [PATCH][next] cpumask: allocate enough space for string and
 trailing '\0' char
From:   Qian Cai <cai@redhat.com>
To:     Colin King <colin.king@canonical.com>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Mon, 09 Nov 2020 20:07:10 -0500
In-Reply-To: <20201109130447.2080491-1-colin.king@canonical.com>
References: <20201109130447.2080491-1-colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2020-11-09 at 13:04 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the allocation of cpulist is based on the length of buf but does
> not include the addition end of string '\0' terminator. Static analysis is
> reporting this as a potential out-of-bounds access on cpulist. Fix this by
> allocating enough space for the additional '\0' terminator.
> 
> Addresses-Coverity: ("Out-of-bounds access")
> Fixes: 65987e67f7ff ("cpumask: add "last" alias for cpu list specifications")

Yeah, this bad commit also introduced KASAN errors everywhere and then will
disable lockdep that makes our linux-next CI miserable. Confirmed that this
patch will fix it.

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  lib/cpumask.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/cpumask.c b/lib/cpumask.c
> index 34ecb3005941..cb8a3ef0e73e 100644
> --- a/lib/cpumask.c
> +++ b/lib/cpumask.c
> @@ -185,7 +185,7 @@ int __ref cpulist_parse(const char *buf, struct cpumask
> *dstp)
>  {
>  	int r;
>  	char *cpulist, last_cpu[5];	/* NR_CPUS <= 9999 */
> -	size_t len = strlen(buf);
> +	size_t len = strlen(buf) + 1;
>  	bool early = !slab_is_available();
>  
>  	if (!strcmp(buf, "all")) {

