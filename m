Return-Path: <SRS0=aXXK=DF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E7CC4727E
	for <linux-next@archiver.kernel.org>; Mon, 28 Sep 2020 17:12:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4555120773
	for <linux-next@archiver.kernel.org>; Mon, 28 Sep 2020 17:12:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FwIYLY13"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgI1RMP (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 28 Sep 2020 13:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgI1RMP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Sep 2020 13:12:15 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ACFAC061755;
        Mon, 28 Sep 2020 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=qaQ/v6vKPGApGPWxgofd4F7eZEv7mlDZvTFdTHtBj3A=; b=FwIYLY13TDFDv7+LaMYnS0Oqnd
        CuUKja+FafEjRhPdscPLsiVEwGJq1NzQgQQu7n+ojlYAVRPf4rm3IQpQn3bDWHxSYX4akRn79LBeO
        icO/1R/2ngsSSOR9febaPYQZymjBIgTmEhU+KXyzMxOE40MFeq1wmPTL04rsSqYPCUvkkZb7TyMFI
        7kBmdikNeKd8XeeNJVsfXRhwT7coW4nLOvemJl3dVm4v35UObIf8x/WWL7G1oJfYKemn8vxY1fntN
        qqK0qapDdhQlpujmH04Vqq7Ypxu0zs/OknzQymjma+8uF4A6zu0ZUQXWByZeyi6voHz3XMfGiyLQl
        fleiKocg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kMwh7-0006tt-FS; Mon, 28 Sep 2020 17:12:09 +0000
Subject: Re: linux-next: Tree for Sep 28 (drivers/misc/hisi_hikey_usb.c )
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200928215551.2b882630@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0fd4bbff-25e1-2799-4320-41be5adfc59e@infradead.org>
Date:   Mon, 28 Sep 2020 10:12:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928215551.2b882630@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/28/20 4:55 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200925:
> 

on i386:

ld: drivers/misc/hisi_hikey_usb.o: in function `hisi_hikey_usb_remove':
hisi_hikey_usb.c:(.text+0x14): undefined reference to `usb_role_switch_unregister'
ld: hisi_hikey_usb.c:(.text+0x20): undefined reference to `usb_role_switch_put'
ld: drivers/misc/hisi_hikey_usb.o: in function `hub_usb_role_switch_set':
hisi_hikey_usb.c:(.text+0x37): undefined reference to `usb_role_switch_get_drvdata'
ld: drivers/misc/hisi_hikey_usb.o: in function `relay_set_role_switch':
hisi_hikey_usb.c:(.text+0x1b2): undefined reference to `usb_role_switch_set_role'
ld: drivers/misc/hisi_hikey_usb.o: in function `hisi_hikey_usb_probe':
hisi_hikey_usb.c:(.text+0x2ca): undefined reference to `usb_role_switch_get'
ld: hisi_hikey_usb.c:(.text+0x369): undefined reference to `usb_role_switch_register'
ld: hisi_hikey_usb.c:(.text+0x380): undefined reference to `usb_role_switch_put'

It looks like HISI_HIKEY_USB should at least depend on USB
and probably on USB_ROLE_SWITCH.


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
