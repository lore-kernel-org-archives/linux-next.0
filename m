Return-Path: <SRS0=yk7U=AF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E6CC433DF
	for <linux-next@archiver.kernel.org>; Wed, 24 Jun 2020 07:30:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96121207DD
	for <linux-next@archiver.kernel.org>; Wed, 24 Jun 2020 07:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592983829;
	bh=GuZe+zK7j+ouZgBdJXHXau5NYviadWE9eNN2okyuJoM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-ID:From;
	b=Nk0dSMtdOv1uLxn3Unf6vnniY//ZvYcumzu7Ix9F4n1Auokt8h68mHBmcsnE5ZwG5
	 eP4N3IqwwRQNUs2XfWUaBnxQX5vthnmaKfF9Sf++CHMKH1ZuLThbGgSnbJN6gITp6u
	 BjwrFPy3tUyQzZP6Ttso7xx1lVDvsyIBMTdSU0SQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389893AbgFXHa2 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 24 Jun 2020 03:30:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:39756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389885AbgFXHa1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Jun 2020 03:30:27 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A0E932073E;
        Wed, 24 Jun 2020 07:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592983826;
        bh=GuZe+zK7j+ouZgBdJXHXau5NYviadWE9eNN2okyuJoM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Qml1ZXj0bJ1yIEBaqejbzqfrcHKQXBLXP6ECXmCUM3nuKE/xkBgPzpPDwDidXNUc3
         Naf2MEVChCBQHGVo3Rud4jPJDnHa0utTBNRNQEXV1EjvpzVWlaXRMxe4R+7jHLu8LD
         0IcvjF11NGmG9gxz1CmV7d6ylDeaw/xLK19tIUto=
Date:   Wed, 24 Jun 2020 09:30:23 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Cristian Klein <cristian.klein@elastisys.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: linux-next: build failures after merge of the hid tree
In-Reply-To: <nycvar.YFH.7.76.2006240012170.13242@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2006240930110.13242@cbobk.fhfr.pm>
References: <20200621140421.7f4552df@canb.auug.org.au> <20200623103736.25f67de5@canb.auug.org.au> <nycvar.YFH.7.76.2006240012170.13242@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 24 Jun 2020, Jiri Kosina wrote:

> > > I don't know what caused it, but commit
> > > 
> > >   470376737e88 ("HID: allow building hid.ko as an external module")
> > > 
> > > did not fix it.  BTW, I build with "make O=...".
> 
> That's actually the patch that almost certainly broke it.
> 
> CCing Cristian (author of that patch) and Nathan, who apparently sent a 
> fixup patch for this, but I haven't seen it, as our corporate mailserver 
> had severe issues yesterday.

I've now dropped the patch from hid.git

-- 
Jiri Kosina
SUSE Labs

