Return-Path: <SRS0=cC7m=ZL=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C63CC432C0
	for <linux-next@archiver.kernel.org>; Tue, 19 Nov 2019 16:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 218EA223AC
	for <linux-next@archiver.kernel.org>; Tue, 19 Nov 2019 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574181748;
	bh=IoRuy5PlgBG8cHzzAaW1PMdYuuu78+gVQ8bvvtNy6g8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:List-ID:
	 From;
	b=Xb1AdbHYAp3y7uFqEidtqnCoshm4N9HeRJTOMxG0DulGbtefFZAWuu2h3viBrmDO9
	 pW0+ZuTJu8dNDdwC0pZ0bfYrGvd7HwG5ntomELlOKahjCSVQ1jbYHq6z5+zbcjJP2z
	 C4QkWlc/RpOtGQAT4F+FRG5kr20k/1aR+IfMn7gQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfKSQm1 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 19 Nov 2019 11:42:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:42462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbfKSQm1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Nov 2019 11:42:27 -0500
Received: from paulmck-ThinkPad-P72.home (unknown [199.201.64.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE9DE22384;
        Tue, 19 Nov 2019 16:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574181746;
        bh=IoRuy5PlgBG8cHzzAaW1PMdYuuu78+gVQ8bvvtNy6g8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=c1jHwxA4M+qLlTFeJkX+4ghY3WdnmlJelLLhKkt6XYMNtMFTCUmabd2beUN4Af9EZ
         rVRrgYcqJ9Njp7oRbGHshCIqcv1dFJ2IDHw41p0mkH9bI6/Y5NPSd88gBuNHDo1lLH
         U2TkpGfSmYpYNDvJxL3pgtymlUcQ01Y4lm77L3Sw=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id BAB153520F80; Tue, 19 Nov 2019 08:42:25 -0800 (PST)
Date:   Tue, 19 Nov 2019 08:42:25 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     rjw@rjwysocki.net, lenb@kernel.org, linux-acpi@vger.kernel.org,
        sfr@canb.auug.org.au
Cc:     linux-next@vger.kernel.org
Subject: Re: next-20191118 rcutorture gets lots of "ACPI: Masking GPE 0x0"
Message-ID: <20191119164225.GA30878@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191119145146.GA25855@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119145146.GA25855@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 19, 2019 at 06:51:46AM -0800, Paul E. McKenney wrote:
> Hello!
> 
> I had occasion to run rcutorture on next-20191118, and in a five-minute
> run got 1,810,735 instances of "ACPI: Masking GPE 0x0" printed to the
> console.  This run is under qemu on an ordinary x86 laptop.
> 
> Is this a known issue?

Apparently it is, apologies for the noise:

https://lkml.org/lkml/2019/11/18/163

							Thanx, Paul
