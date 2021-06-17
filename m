Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04B5C2B9F4
	for <linux-next@archiver.kernel.org>; Thu, 17 Jun 2021 15:08:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7419613A9
	for <linux-next@archiver.kernel.org>; Thu, 17 Jun 2021 15:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232985AbhFQPKN (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233136AbhFQPKM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 11:10:12 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F886C061574;
        Thu, 17 Jun 2021 08:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=/9evD7ovqH4RqAbLVdcDHYDNtc0RH747AvwfyLuHEoI=; b=IcocdOq17dGSdT9g3UYhXt4Eyx
        B3fl4TCfRI3c+EL5rBqjnlEhGWm5/IgYsqjzsAHUuXrBccrPEesnU7oO6q0/o0QagAPZe5kjQNDy7
        yVFiSCOaqq2FZPuRzxVT/h9yB0c9FTPbqJvTqAtYQ+yf1/U/1Ozv0UcWrhmbxn9W/UwIfZ3Cf3JpD
        /9ouWHys6BDXtla35rgby6qReEyz+nU0SyMJ46NQe+WH0NPSaSqLsb/yM/B+hD21G9LwhiJgASTWP
        7cOchYAQLedmhTQuA4lsDgIIMKWsMdTpEJjEVvJAyDpf9cMSe+DKUCRtr3C0g4+/ldnodt0QqANS3
        JdfL+RFA==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lttce-00AsPm-8L; Thu, 17 Jun 2021 15:08:00 +0000
Subject: Re: linux-next: Tree for Jun 16 (objdump version)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>
References: <20210616231358.63fe6e42@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7d523bca-67d8-6da1-6739-e5ba85f7683c@infradead.org>
Date:   Thu, 17 Jun 2021 08:07:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210616231358.63fe6e42@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/16/21 6:13 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210615:
> 

on i386 or x86_64:

Warning: objdump version 15) is older than 2.19
Warning: Skipping posttest.

'objdump --version' says:

GNU objdump (GNU Binutils; SUSE Linux Enterprise 15) 2.35.1.20201123-7.18
Copyright (C) 2020 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or (at your option) any later version.
This program has absolutely no warranty.



-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>

