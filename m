From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: of: Make OF_DYNAMIC user selectable
Date: Mon, 11 Aug 2014 15:28:17 +0100
Message-ID: <20140811142817.87834C40932@trevor.secretlab.ca>
References: <20140728093526.38d8e732@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:48161 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753567AbaHKO2W (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Aug 2014 10:28:22 -0400
Received: by mail-wi0-f177.google.com with SMTP id ho1so4293976wib.16
        for <linux-next@vger.kernel.org>; Mon, 11 Aug 2014 07:28:21 -0700 (PDT)
In-Reply-To: <20140728093526.38d8e732@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 28 Jul 2014 09:35:26 +1000, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
> 
> I noticed the subject commit in the devicetree tree in linux-next today.
> The commit message gives us no idea why we would want to make this
> change.  We already have lots of user selectable CONFIG_ options ... do
> we really need this one as well?

It was a mistake. That was a patch added for private testing that
accidentally made it out into my public tree. I'm not sending it to
Linus. Code depending on OF_DYNAMIC needs to select it.

g.
