From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: build warning after merge of the pci tree
Date: Tue, 3 Sep 2013 17:59:48 -0600
Message-ID: <CAErSpo7m77dD4zic5nn-KaaTwJyvDPtpr2pbGy6i6Tf6N5dt0Q@mail.gmail.com>
References: <20130904095527.d5e694435fd03a5252de0d42@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:51828 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761557Ab3IDAAJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Sep 2013 20:00:09 -0400
Received: by mail-ie0-f182.google.com with SMTP id aq17so12134777iec.27
        for <linux-next@vger.kernel.org>; Tue, 03 Sep 2013 17:00:08 -0700 (PDT)
In-Reply-To: <20130904095527.d5e694435fd03a5252de0d42@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next list <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 3, 2013 at 5:55 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Bjorn,
>
> You have sent a pull request to Linus for the pci tree, but at the same
> time you have reset the branch I pull into linux-next to be v3.11.  So
> you have effectively removed all that code from linux-next until Linus'
> merges it :-(
>
> Ordering is important.

Oops, sorry about that!.  I jumped the gun because I forgot about your
dependency on that branch (stupid, I know, since that's the whole
point of it).  Next time I'll wait until after Linus pulls my tag.

Bjorn
