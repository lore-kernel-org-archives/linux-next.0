Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B19C433FE
	for <linux-next@archiver.kernel.org>; Wed, 19 Oct 2022 21:47:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbiJSVrT (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 19 Oct 2022 17:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiJSVrQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Oct 2022 17:47:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D79190461;
        Wed, 19 Oct 2022 14:47:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 96E72B825F6;
        Wed, 19 Oct 2022 21:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360ADC433D6;
        Wed, 19 Oct 2022 21:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666216033;
        bh=2aXD5vrDRaBVh3BhQ2ePbMswz4yUwVdOZh4IViQZ+34=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=J/M69iWZC5lMDu/V51xBtX5mmmQdB3O8QpKcmA0O05y942ygU3VwNIQRmnhr5loHv
         Beu93CRJqEQYuhb9lNtZIuvI56TJiSR7kYNBddnceg8iHr/ecprSrl9yJplihw2tM3
         SzCYNk96GtarBQPNdKKHEkLUJ1CtRkqR8J7do4/lVv9D6cWaW5kX6pagADAt3Oxo7k
         gf5qdzlIKFarZuoP1JSljljPk0iO5Df8bB8rTC9R1xCK9wT1ML3Z+kQHx8HcYdiR9o
         oovZx/1L/RmbkcFhxWkPgmHnYQTAmLO4TTB8LJAgUDQVUJXX86JSqnbMp+usqHOjsF
         Ne569u/0FFQhw==
Date:   Wed, 19 Oct 2022 16:47:11 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pci-current
 tree
Message-ID: <20221019214711.GA48619@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020012608.20a5f3dc@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 20, 2022 at 01:26:08AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   22286757d2f5 ("MAINTAINERS: Update Kishon's email address in PCI endpoint subsystem")
> 
> is missing a Signed-off-by from its committer.

Sorry, fixed.
